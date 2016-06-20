<?php
define('CLI_SCRIPT', true);
require_once(__DIR__ . '/../config.php');

$backup = false;
$restore = false;
$dir = null;
$fulldir = null;

$home = getcwd();

// Filenames
// MySQL Database Dump file
$dumpsql = "dump.sql";
// Moodledata backup file
$mdata = "moodledata.tar.gz";

// Messages
$helpmsg = 
"\nEnsure ".$dumpsql." and ".$mdata." exists in the current directory.
--backup : Runs backup script, dumping Database and backing up Moodledata into the ".$home." directory.
           Run this first to generate backup files for restoring later.

--restore : Runs restore script using the dumped database and Moodledata archive supplied. 
\n";

$introRestore = 
"\nThis script will reset the current Moodle site back to it's original state with the provided backup files.
Ensure 'moodledata.tar.gz' and 'dump.sql' exists in the ".$home." folder.
\n";

$introBackup = 
"\nThis script will backup the current Moodle site suitably for the restore part of this script.
\n";

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

// Setting Maintenance Mode on
shell_exec("php ../admin/cli/maintenance.php --enable");

// Check for an argument
if (isset($argv[1])) {
    $options = $argv[1];
    // 	Get only the argument we want out of the array
}
else {
    $options = null;
    // 	If null, that means there was no argument
}

// Check if it's the argument we want
if ($options == '--backup') {
    $backup = true;
    $restore = false;
} elseif ($options == '--restore') {
    $restore = true; 
    $backup = false;
} elseif ($options == '-h' OR $options == '--help') {
    echo $helpmsg;
} elseif ($options != null) {
    echo "Only --backup is supported. See -h.\n";
} else {
    echo "\nMissing argument! Run --help for information.\n";
}
// Check $CFG->dataroot exists just in case...
if (!file_exists($CFG->dataroot)) {
    $backup = false;
} else {
    $fulldir = $CFG->dataroot;
    $dir = str_replace('/moodledata','',$fulldir);
}
// Run restore!
if ($restore === true) { // Restoring...
    echo $introRestore;
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
        echo "\nConnected to Database\n";
    } else {
        echo "Couldn't connect to database!\n" . mysqli_get_host_info($dbconnect) . PHP_EOL;
    }
    // Dump all tables of database
    echo "Dropping all tables from Database!";
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
    echo "\nImporting backup database...\n";
    shell_exec("mysql -u".$CFG->dbuser." -p".$CFG->dbpass." ".$CFG->dbname." < ".$dumpsql);
    echo "\nDatabase Imported!\n";
    //TODO: Remove current Moodledata
///var/www/moodles/stable_31/moodledata
    if ($fulldir != null) { // Check $dir isn't still null
        echo "\nRemoving ".$fulldir,"\n";
        shell_exec ("rm -Rf ".$fulldir);
    } else {
        echo "\nCannot find ".$fulldir."! This shouldn't happen...\n";
    }
    // TODO: Untar Moodledata backup to $CFG->dataroot location
    echo "Extracting backed up Moodledata\n";
    shell_exec("tar -xzf ".$mdata); // Extract to backup folder
    echo "Moving Moodledata to correct location\n";
    shell_exec("mv moodledata ".$fulldir); // Move into place...;
    echo "Fixing permissions of Moodledata...\n";
    shell_exec ("chmod -R 777 ".$fulldir);
    echo "\nDone!\n";
}
if ($backup === true) {
    // Do backup stuff...
    echo $introRestore;
    echo "Backing up site...\n";
    if (file_exists($dumpsql)) {
        unlink($dumpsql);
    }
    if (file_exists($mdata)) {
        unlink($mdata);
    }
    echo "Dumping Database...\n";
    shell_exec("mysqldump -u".$CFG->dbuser." -p".$CFG->dbpass." ".$CFG->dbname." > ".$dumpsql);
    echo "Backing up Moodledata...\n";
    shell_exec ("cd ".$dir." && tar -czf ".$mdata." moodledata  --exclude 'moodledata/sessions' --exclude 'moodledata/trashdir'");
    shell_exec ("cd ".$dir." && mv ".$mdata." ".$home);
    shell_exec ("cd ".$home);
    echo "Done!\n";
}
shell_exec("php ../admin/cli/maintenance.php --disable");
