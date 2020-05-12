# Recipe for enforcing bounce limits with Exim

## What?

Disable accounts which generate excessive bounces until manually re-enabled.

## Why?

To deal with uncaught spam outbreaks and reign in badly run mailing lists.

## How to

Using Exim with support for `Event` and `sqlite` lookup (check `exim -bV`)

 * `mkdir -p /var/lib/bouncelimits && chown Debian-exim:Debian-exim /var/lib/bouncelimits`
 * `sqlite3 /var/lib/bouncelimits/db.sqlite < schema.sql`
 * Add `event_action` and contents of `acl_mail_from` from `exim4.conf` to your config
 * Clean up old data daily with `cron.sh`

## Caveats

 * 'Internal' delivery failures are counted as failures too, if that's undesirable edit `event_action` appropriately
 * Account is disabled not on exceeding limits but on next send
 * Might behave incorrectly due to lookup caching 😢
