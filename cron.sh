sqlite3 /var/lib/bouncelimits/db.sqlite "delete from activity where dtime < datetime('now', '-24 hours')"
