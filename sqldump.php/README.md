# MySQLDump - PHP #

This is a script to call [MySQLDump - PHP](https://github.com/ifsnop/mysqldump-php),
a PHP script to dump database through PDO.

Usage:
Upload both php, edit <code>dump.php</code> to set database name, username, and password, then browse/call dump.php.

No output is generated in case of success.
By default, a timestamped <code>.sql.gz<code> file will be created in the same folder,
and dumps older than 3 days will be deleted.

This script is created as a way to backup remote database through cron,
so that database will be included in site backup through FTP.