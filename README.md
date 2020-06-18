# DNSBL Script

Get DNSBL records from a database and output them to a file.

# DB

See sample DB in [test-db.sql](test-db.sql).

# Usage

ENV Variables are needed to run the script, ex:

```
MYSQL_DATABASE=dnsbl MYSQL_HOST=localhost MYSQL_PASSWORD=test MYSQL_USERNAME=root dnsbl-output -filename=/etc/dnsbl/bl.txt
```
