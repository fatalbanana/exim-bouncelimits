# Recipe for enforcing bounce limits with Exim

## What?

Disable accounts which generate excessive bounces until manually re-enabled.

## Why?

To deal with uncaught spam outbreaks and reign in badly run mailing lists.

## How to

Using Exim with support for `Event` and `sqlite` lookup (check `exim -bV`)

Set up the database:
 * `mkdir -p /var/lib/bouncelimits`
 * `sqlite3 /var/lib/bouncelimits/db.sqlite < schema.sql`
 * `chown -R Debian-exim:Debian-exim /var/lib/bouncelimits`

Edit your config:
 * Add `event_action` and contents of `acl_mail_from`/`acl_mail_rcpt` from `exim4.conf` to your config
 * Copy redirect router to return queued mail from banned accounts

Schedule database cleanup:
 * Clean up old data periodically with `cron.sh`

## Caveats

 * 'Internal' delivery failures are counted as failures too, if that's undesirable edit `event_action` appropriately
 * Account is disabled not on exceeding limits but on next send
 * You probably still want to use `ratelimit` to limit total number of recipients
 * Users might be re-disabled due to race condition (issue #3)
