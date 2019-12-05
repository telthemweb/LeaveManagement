<?php

define('DB_NAME', 'leave_manager');

/*
 * The username of the databse. Needed in addition to password for connection
 */
define("DB_USER", "root");

/*
 * Database password. Needed for connection to database(if set)
 */
define("DB_PASS", "!physmach89");

/*
 * Database host. This is localhost since we're developing locally
 */
define("DB_HOST", "localhost");

/*
 * The main connection to the database is actually here.
 */

/*
 * @var $db_con will hold details to our connection
 */
$db_con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

/*
 * Character set to use for our connection. We'll choose utf-8 since it covers
 * more characters than ASCII.

 dbname 
 root rutendo
 pass rutendo2019
 */
$db_con->set_charset("utf8");
?>
