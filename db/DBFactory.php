<?php
  /**
   * DBGateway.php : gateway PDO vers la base SQL 
   *
   * @author Gérome Canals
   * @package DB
   */


/**
 *  La classe DBFactory : fabrique des connexions PDO
 * 
 *  
 */

class DBFactory {


  
  private static $dbconnect ;

 

  /**
   *   makeConnection() : fabrique une instance PDO 
   *
   *   
   *   Charge le fichier de configuration
   *   @access public
   *   @return PDO un nouvel objet PDO ou False en cas d'erreur
   **/  
  public static  function makeConnection($conf) {
    
    $db = self::$dbconnect[$conf];
    if (!empty ($db))  return $db ;
    $configpath = INSTALLATION_DIR . DIRECTORY_SEPARATOR. DBCONFIG_FILE;
    $ini_array= parse_ini_file($configpath,true);
    $config = $ini_array[$conf];
   
    if (!$config) throw new DBException("DBFactory::makeConnection: could not parse config file $configpath <br/>");

    $dbtype=$config['db_driver'];$host=$config['host']; $dbname=$config['dbname'];
    $user=$config['db_user']; $pass=$config['db_password']; 
    $port=( (isset($config['dbport']))?$config['dbport']:null);
    $dsn="$dbtype:host=$host;";
    if (!empty($port)) $dsn.="port=$port;";
    $dsn.="dbname=$dbname";
    try {
        
        $db = new PDO($dsn, $user,$pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'',
                                               
                                               PDO::ATTR_PERSISTENT=>true   ));
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
    } catch(PDOException $e) {
            
	    throw new DBException("connection: $dsn  ".$e->getMessage(). '<br/>');
    }
    self::$dbconnect[$conf] = $db;
    return $db;
  }


 

}

?>
	


  
