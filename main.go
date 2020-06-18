package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"

	"github.com/dchest/uniuri"
	_ "github.com/go-sql-driver/mysql"
)

func getDBData() {

	var filename string

	tempFile := uniuri.New()
	flag.StringVar(&filename, "filename", "foo", "The final filename for dnsbl.")
	flag.Parse()

	db, err := dbConnection()
	if err != nil {
		log.Println("Error connecting to the DB: ", err)
	}

	tx, err := db.Begin()
	if err != nil {
		return
	}

	defer func() {
		switch err {
		case nil:
			err = tx.Commit()
		default:
			tx.Rollback()
		}
	}()

	glineTypes, err := db.Query("SELECT DISTINCT gline_type FROM ips")
	if err != nil {
		log.Println("Failed to get gline types: ", err)
		return
	}

	f, err := os.Create(tempFile)
	if err != nil {
		log.Println("Unable to create file.")
		return
	}

	defer f.Close()

	w := bufio.NewWriter(f)

	for glineTypes.Next() {
		var glineType int
		glineTypes.Scan(&glineType)

		line := fmt.Sprintf(":127.0.0.%d:IRC Spam Drone, see https://dnsbl.dev-undernet.org/check-view.php?ipaddress=$\n", glineType)

		_, err := w.WriteString(line)
		if err != nil {
			log.Println("Failed to write line to file", err)
			return
		}

		rows, err := db.Query("SELECT ipaddress FROM ips WHERE b_or_w='b' and gline_type=? ORDER BY dateadded, ipaddress", glineType)
		if err != nil {
			log.Println("Error fetching rows: ", err)
			return
		}

		for rows.Next() {
			var ip string

			rows.Scan(&ip)

			_, err := w.WriteString(ip + "\n")
			if err != nil {
				log.Println("Failed to write line to file", err)
				return
			}
		}

		defer rows.Close()
	}
	w.Flush()
	defer glineTypes.Close()

	err = os.Rename(tempFile, filename)
	if err != nil {
		log.Fatal("Failed to move file: ", err)
		err = os.Remove(tempFile)
	}

}

func main() {
	getDBData()
}
