<?php
define('CLI_SCRIPT', true);
require_once('../config.php');

// Setting Maintenance Mode on
// echo shell_exec("php ../admin/cli/maintenance.php --enable");

$intro = 
"\nThis script will reset the current Moodle site back to it's original state with the provided backup files.

Ensure 'moodledata.tar.gz' and 'dump.sql' exists in the '_reset' folder.
";
echo $intro;

// Filenames
$dumpsql = "dump.sql"; // MySQL Database Dump file
$mdata = "moodledata.tar.gz"; // Moodledata backup file

// FUNCTIONS
/*
 * Function to import SQL for a given $file
 */
function import_sql($file, $delimiter = ';') {
    $handle = fopen($file, 'r');
    $sql = '';
 
    if($handle) {
        /*
         * Loop through each line and build
         * the SQL query until it detects the delimiter
         */
        while(($line = fgets($handle, 4096)) !== false) {
            $sql .= trim(' ' . trim($line));
            if(substr($sql, -strlen($delimiter)) == $delimiter) {
                mysqli_query($sql);
                var_dump($sql);
                $sql = '';
            }
        }
 
        fclose($handle);
    }
}



// Check files exist in current directory

if (file_exists($dumpsql)) {
    echo $dumpsql . " found!\n";
} else {
    echo $dumpsql . " not found!\n";
    die();
}

if (file_exists($mdata)) {
    echo $mdata . " found!\n";
} else {
    echo $mdata . " not found!\n";
    die();
}

// Connect to MySQL Database

$dbconnect = new mysqli($CFG->dbhost, $CFG->dbuser, $CFG->dbpass, $CFG->dbname);

if ($dbconnect) {
    echo "Connected to Database\n";
} else {
    echo "Couldn't connect to database!\n" . mysqli_get_host_info($dbconnect) . PHP_EOL;
}

// Dump all tables of database
echo "\nDropping all tables from Database!"

$dbconnect->query('SET foreign_key_checks = 0');
if ($result = $dbconnect->query("SHOW TABLES")) {
    //echo $result;
    while($row = $result->fetch_array(MYSQLI_NUM)) {
        $dbconnect->query('DROP TABLE IF EXISTS '.$row[0]);
    }
}
$dbconnect->query('SET foreign_key_checks = 1');

echo "\nDrop done!\n";

// TODO: Import $dumpsql to database 

//import_sql($dumpsql);
echo "\nImporting backup database...";
echo shell_exec("mysql -u".$CFG->dbuser." -p".$CFG->dbpass." ".$CFG->dbname." < ".$dumpsql);
echo "\nDatabase Imported!";

// TODO: Remove current Moodledata


// TODO: Untar Moodledata backup to $CFG->dataroot location


// echo shell_exec("php ../admin/cli/maintenance.php --disable");