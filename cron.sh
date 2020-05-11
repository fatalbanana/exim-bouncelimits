sqlite3 /var/lib/bouncelimits/db.sqlite "delete from activity where day < date('now', '-7 day')"
