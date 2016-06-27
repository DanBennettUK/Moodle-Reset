<?php
define('CLI_SCRIPT', true);
require_once(__DIR__ . '/../config.php');

$backup = false;
$restore = false;
$dir = null;
$fulldir = null;
$moodledata = null;
$database = null;

$home = getcwd(); // Get current directory for things later on... This needs improved.

// TODO: Tidy up Database interactions to use MySQLI and not CLI commands

// Filenames
// MySQL Database Dump file
$dumpsql = "dump.sql";
// Moodledata backup file
$mdata = "moodledata.tar.gz";

// Messages
$helpmsg = 
"\nBy default, ensure ".$dumpsql." and ".$mdata." exists in the current directory.
--backup : Runs backup script, dumping Database and backing up Moodledata into the ".$home." directory.
           Run this first to generate backup files for restoring later.

           Example:
           reset_moodle.php --backup

--restore : Runs restore script using the dumped database and Moodledata archive supplied.
            --moodledata= : Location of your moodledata backup file (in .tar.gz format & extension)
            --database= : Location of your database backup file (in .sql format & extension)

            Example:
            reset_moodle.php --restore (Restores using defaults)
            reset_moodle.php --restore --moodledata=/path/of/moodledata.tar.gz --database=/path/of/database.sql (Restore using specified backup files)
\n";

$introRestore = 
"\nThis script will reset the current Moodle site back to it's original state with the provided backup files.
Ensure 'moodledata.tar.gz' and 'dump.sql' exists in the ".$home." folder.
\n";

$introBackup = 
"\nThis script will backup the current Moodle site suitably for the restore part of this script.
\n";

$htmlText = "
<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <title>Site is currently resetting...</title>
</head>
<body>
    <div style=\"height:200px; width:400px; position:fixed; top:50%; left:50%; margin-top:-100px; margin-left:-200px; text-align:center;\">
    <img src=\"http://www.howtomoodle.com/wp-content/themes/htm/images/howtomoodle.png\">
    <p>
    This site is currently being reset.
    <p>
    Please try again in 1 minute.
    </div>
</body>
</html>
";

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

// Create temporary index.php for maintenance notice...
$moodleIndex = __DIR__ . "/../index.php";
$backupIndex = __DIR__ . "/../index.backup.tmp";

if (file_exists($backupIndex) && file_exists($moodleIndex)) { // If both $moodleIndex and $backupIndex exist
    echo "Both ".$moodleIndex." and ".$backupIndex." exist! Clean before continuing!\n";
    die();
} elseif (file_exists($moodleIndex)) {
    // echo "index.php exists";
} else {
    echo "Cannot find ". $moodleIndex . " Or " . $backupIndex . "\n";
}


// Check the first argument exists...
if (isset($argv[1])) {
    $options = $argv[1];
    // 	Get only the argument we want out of the array
}
else {
    $options = null;
    // 	If null, that means there was no argument
}

// Check for second and third arguments which can be either way round...
$optMoodledata = "--moodledata=";
$optDatabase = "--database=";

if (isset($argv[2])) {
    $arg2 = $argv[2];
} else {
    $arg2 = null;
}
if (isset($argv[3])) {
    $arg3 = $argv[3];
} else {
    $arg3 = null;
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
    die();
} elseif ($options != null) {
    echo "Only --backup is supported. See -h.\n";
} else {
    echo "\nMissing argument! Run --help for information.\n";
}

// Check second and thirds are specified...
if ($arg2 == null && $arg3 == null) {
    echo "No backup files specified. Using default location.\n";
} elseif (strpos($arg2, '--database=') !== false && $arg3 == null) {
    echo "Moodledata backup file not specified! Please specify with \"--moodledata=\"\n";
    die();
} elseif (strpos($arg2, '--moodledata=') !== false && $arg3 == null) {
    echo "Database backup file not specified! Please specify with \"--database=\"\n";
    die();
}
// Sort arguments into the right variables...
if ($arg2 != null) {
    if (strpos($arg2, '--database=') !== false) {
        $database = str_replace('--database=','',$arg2);
        if (strpos($arg3, '--moodledata=') !== false) {
            $moodledata = str_replace('--moodledata=','',$arg3);
        }
    } elseif (strpos($arg2, '--moodledata=') !== false) {
        $moodledata = str_replace('--moodledata=','',$arg2);
        if (strpos($arg3, '--database=') !== false) {
            $database = str_replace('--database=','',$arg3);
        }
    }
}

// Check format of files
if ($moodledata != null) {
    if (strpos($moodledata, '.tar.gz') == false) {
        echo "Moodledata must be in .tar.gz format and extension! \n";
        die();
    }
}
if ($database != null) {
    if (strpos($database, '.sql') == false) {
        echo "Database must be in .sql format and extension! \n";
        die();
    }
}

// Check the backup files exist...
if (!file_exists($moodledata)) {
    echo "Cannot find ".$moodledata."! Please check the path and try again. \n";
}
if (!file_exists($database)) {
    echo "Cannot find ".$database."! Please check the path and try again. \n";
}

// Check $CFG->dataroot exists just in case...
if (!file_exists($CFG->dataroot)) {
    $backup = false;
} else {
    $fulldir = $CFG->dataroot;
    $dir = str_replace('/moodledata','',$fulldir);
}

if ($restore === true) { // Restore!
    echo $introRestore;

    // Setting Maintenance Mode on
    shell_exec("php ../admin/cli/maintenance.php --enable");
    
    // Set temp index.php
    rename($moodleIndex, $backupIndex); // Rename index.php temporarily
    $tmpIndex = fopen($moodleIndex, "w") or die("Unable to open file!");
    fwrite($tmpIndex, $htmlText);
    fclose($tmpIndex);
    
    // Check files exist
    if ($database != null) {
        $dumpsql = $database;
    } elseif (file_exists($dumpsql)) {
        echo $dumpsql . " found!\n";
    } else {
        echo $dumpsql . " not found!\n";
        die();
    }
    if ($moodledata != null) {
        $mdata = $moodledata;
    } elseif (file_exists($mdata)) {
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
    
    // Remove current Moodledata
    if ($fulldir != null) { // Check $dir isn't still null
        echo "\nRemoving ".$fulldir,"\n";
        shell_exec ("rm -Rf ".$fulldir);
    } else {
        echo "\nCannot find ".$fulldir."! This shouldn't happen...\n";
    }
    
    // Untar Moodledata backup to $CFG->dataroot location
    echo "Extracting backed up Moodledata\n";
    shell_exec("tar -xzf ".$mdata); // Extract to backup folder
    echo "Moving Moodledata to correct location\n";
    shell_exec("mv moodledata ".$fulldir); // Move into place...;
    echo "Fixing permissions of Moodledata...\n";
    shell_exec ("chmod -R 777 ".$fulldir);

    // Remove temp index.php
    unlink($moodleIndex);
    rename($backupIndex, $moodleIndex); // Rename index.php temporarily

    // Take out of Maintenance Mode
    shell_exec("php ../admin/cli/maintenance.php --disable");
    echo "\nDone!\n";
}

if ($backup === true) { // Backups!
    echo $introRestore;

    // Setting Maintenance Mode on
    shell_exec("php ../admin/cli/maintenance.php --enable");
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
    
    // Take out of Maintenance Mode
    shell_exec("php ../admin/cli/maintenance.php --disable");
    echo "Done!\n";
}

