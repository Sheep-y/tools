<?php

// Enable error report
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Dump database

include( 'Mysqldump.php' );

$type = 'mysql'; // PDO DNS prefix
$db = 'test';
$user = 'root';
$pass = '';
$keep_backup = '-3 days';

$filename = $db . '.' . date( 'Ymd.His' ) . '.sql.gz';
$dsn = "$type:host=localhost;dbname=$db";

$dumpSettings = array(
	//'include-tables' => array('table1', 'table2'),
	//'exclude-tables' => array('table3', 'table4'),
	'compress' => 'GZIP',
	'no-data' => false,
	'add-drop-database' => false,
	'add-drop-table' => false,
	'single-transaction' => false,
	'lock-tables' => false,
	'add-locks' => false,
	'extended-insert' => true,
	'disable-foreign-keys-check' => false,
	'where' => '',
	'no-create-info' => false
);

$dump = new Mysqldump( $dsn, $user, $pass, $dumpSettings );
$dump->start( $filename );

// Delete old database

$files = glob( "$db.*.*" );
$expires = strtotime( $keep_backup );
foreach ( $files as $f ) {
	if ( is_dir( $f ) ) continue;
	$part = explode( '.', $f );
	if ( sizeof( $part ) < 3 ) continue;

	$part = strtotime( $part[1] );
	if ( $part <= $expires ) {
		unlink( $f );
	}
}

?>