<?php
define('CLI_SCRIPT', true);
require_once('../config.php');

$backup = false;
$restore = false;
$dir = null;
$fulldir = null;

// FUNCTIONS
// Function to import SQL for a given $file
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

// TODO: Allow a flag for creating a backup of the current state of Moodle...!

// Check for an argument
if (isset($argv[1])) {
    $backupopt = $argv[1]; // Get only the argument we want out of the array
} else {
    $backupopt = null; // If null, that means there was no argument
}

// Check if it's the argument we want
if ($backupopt == '--backup') {
    $backup = true;
} elseif ($backupopt != null) {
    echo "Only --backup is supported.\n";
} else {
    $backup = false;
    $restore = true;
}

// Setting Maintenance Mode on
// echo shell_exec("php ../admin/cli/maintenance.php --enable");

// Run restore!
if ($restore === true) { // Restoring...
    $introRestore = 
    "\nThis script will reset the current Moodle site back to it's original state with the provided backup files.

Ensure 'moodledata.tar.gz' and 'dump.sql' exists in the '_reset' folder.
";
    echo $introRestore;

    // Filenames
    $dumpsql = "dump.sql"; // MySQL Database Dump file
    $mdata = "moodledata.tar.gz"; // Moodledata backup file

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
    // Check $CFG->dataroot exists just in case...
    if (!file_exists($CFG->dataroot)) {
        echo "Cannot find ".$CFG->dataroot."\n";
        die();
    } else {
        echo "\nFound ".$CFG->dataroot."\n";
        $fulldir = $CFG->dataroot;
        $dir = str_replace('/moodledata','',$fulldir);
        echo $dir;
    }

    // Connect to MySQL Database
    $dbconnect = new mysqli($CFG->dbhost, $CFG->dbuser, $CFG->dbpass, $CFG->dbname);
    if ($dbconnect) {
        echo "Connected to Database\n";
    } else {
        echo "Couldn't connect to database!\n" . mysqli_get_host_info($dbconnect) . PHP_EOL;
    }

    // Dump all tables of database
    echo "\nDropping all tables from Database!";

    $dbconnect->query('SET foreign_key_checks = 0');
    if ($result = $dbconnect->query("SHOW TABLES")) {
        //echo $result;
        while($row = $result->fetch_array(MYSQLI_NUM)) {
            $dbconnect->query('DROP TABLE IF EXISTS '.$row[0]);
        }
    }
    $dbconnect->query('SET foreign_key_checks = 1');

    echo "\nDrop done!\n";

    // TODO: Import $dumpsql to database using mysqli rather than shell_exec.
    //import_sql($dumpsql);
    echo "\nImporting backup database...";
    echo shell_exec("mysql -u".$CFG->dbuser." -p".$CFG->dbpass." ".$CFG->dbname." < ".$dumpsql);
    echo "\nDatabase Imported!";

    //TODO: Remove current Moodledata
///var/www/moodles/stable_31/moodledata
    if ($fulldir != null) { // Check $dir isn't still null
        echo "Removing ".$fulldir,"\n";
        shell_exec("mv ".$fulldir." /tmp"); //Move to /tmp 
    } else {
        echo "Cannot find ".$fulldir."! This shouldn't happen...";
    }

    // TODO: Untar Moodledata backup to $CFG->dataroot location
    shell_exec("tar -xzf ".$mdata); // Extract to backup folder
    shell_exec("mv moodledata ".$fulldir); // Move into place...;

}

if ($backup === true) {
    // Do backup stuff...
}

// echo shell_exec("php ../admin/cli/maintenance.php --disable");