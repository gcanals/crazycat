<?php


/**
 * Description of CrazyApp
 *
 * @author canals
 */

include '../conf/appconf.php';


class CrazyApp {
  
  const PROD_ROUTE_NAME = 'Produit';
  const CAT_ROUTE_NAME =  'Categorie';
  const TAR_ROUTE_NAME =  'Tarif';
  
  private $app ;
  
  
   public function __construct() {
      $this->app = new \Slim\Slim();
  }
  
  public static function Autoload_Register () {
      
  spl_autoload_register(function ($className) {
     
     $directories  = array('db' , 'app', 'model','utils', 'controller');
     foreach ($directories as $dir) {
      $file = INSTALLATION_DIR . DIRECTORY_SEPARATOR. $dir. DIRECTORY_SEPARATOR. $className. CLASS_FILE_SUFFIX;
      if (is_file($file)) { 
         require_once $file ;
         break;
        }
      } 
   } );
   //require INSTALLATION_DIR . DIRECTORY_SEPARATOR. 'Slim'. DIRECTORY_SEPARATOR. 'Slim.php';
   //\Slim\Slim::registerAutoloader();
   require INSTALLATION_DIR . DIRECTORY_SEPARATOR . 'vendor/autoload.php';
  }
  
  public static function makeCrazyUrl($path ) {
      return SERVICE_URL .$path ;
  }
  
 
  
  
  
  public function getSlimApp() {
      return $this->app;
  }
  
  public function routes () {
      $app=$this->app;
      $app->get('/', function() use ($app){
          $st = '
           welcome to ze crazy cat<br />
           available Uris <b> GET ONLY </b>:<br /> 
          <ul>
         
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/produits :(tableau) liste des produits - chaque produit est désigné par son uri
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/produits/1 :(objet) le produit 1, en détail
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/tarifs :(tableau) liste des tarifs - chaque tarif est désigné par son uri
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/tarifs/1 :(objet) le tarif 1 en détail
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/tarifs/1/produits :(tableau) la liste des produits de tarif 1 - chaque produit est désigné par son uri 
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/categories :(tableau) liste des categories - chaque categorie est désigné par son uri
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/categories/1 :(objet) la categorie 1 en détail
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/categories/produits :(tableau) la liste des produits dde categorie 1 - chaque produit est désigné par son uri
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/produits/1/categories : (objet) la categorie du produit 1
          <li>'. SERVICE_URL . LOCAL_URL_PATH . 'rest/produits/1/tarifs : (objet) le tarif du produit 1
</ul>

';   

	  $res= $app->response();
	  $res['Content-Type']= 'text/html; charset=utf-8';
	  $res->body($st);
      }) ;
      $app->get('/produits/:id', function($id) use ($app) {

            $a = new ProdController($app);
            $a->get($id); 
            
            }
            )->name(self::PROD_ROUTE_NAME);
            
       $app->get('/produits/', function() use ($app) {

            $a = new ProdController($app);
            $a->get(); 
            
            }
            );
       $app->post('/produits/', function() use ($app){
           
           $a=new ProdController($app);
           $a->post();
       }
       );
       $app->get('/produits/:id/categories', function($id) use ($app) {

            $a = new ProdController($app);
            $a->getCat($id); 
            
            }
            );
       $app->get('/produits/:id/tarifs', function($id) use ($app) {

            $a = new ProdController($app);
            $a->getTarif($id); 
            
            }
            );
            
       $app->get('/categories/:id', function($id) use ($app) {

            $a = new CatController($app);
            $a->get($id); 
            
            }
            )->name(self::CAT_ROUTE_NAME);
            
       $app->get('/categories/', function() use ($app) {

            $a = new CatController($app);
            $a->get(); 
            
            });
       $app->get('/categories/:id/produits', function($id) use ($app) {

            $a = new CatController($app);
            $a->getProd($id); 
            
            }
            );
            
       $app->get('/tarifs/:id', function($id) use ($app) {

            $a = new TarController($app);
            $a->get($id); 
            }
            )->name(self::TAR_ROUTE_NAME);

       $app->get('/tarifs/', function() use ($app) {

            $a = new TarController($app);
            $a->get(); 
            
            });
       $app->get('/tarifs/:id/produits', function($id) use ($app) {

            $a = new TarController($app);
            $a->getProd($id); 
            }
            );
  }
  
  public function goCrazy (){
      $this->app->run();
  }

 
  public static function json_crazy_object_short(DBModel $m,\Slim\Slim $app ) {
      
      if (is_null($m)) return '{}';
      
      $jsonarray['type'] = get_class($m) ;
      $jsonarray['id'] = intval($m->getOid()) ;
      $jsonarray['uri'] =  self::makeCrazyUrl ($app->urlFor (get_class($m), array('id'=>$m->getOid())));
      switch (get_class($m)) {
          case 'Tarif' : {
              $jsonarray['ref'] = $m->getAttr('ref');
             
              break;
          }
          case 'Categorie' : {
              $jsonarray['nom'] = $m->getAttr('nom');
              break;
          }
          case 'Produit' : {
              $jsonarray['ref'] = $m->getAttr('ref');
              $jsonarray['imgUrl'] = self::makeCrazyUrl(IMG_URL_PATH.'/'.$m->getAttr('photo_path'));
             
              break;
          }
          
      }
      return json_encode($jsonarray, JSON_FORCE_OBJECT);
  }
  
  public static function json_crazy_object(DBModel $m,\Slim\Slim $app ) {
      if (is_null($m)) return '{}';
      
      $jsonarray['type'] = get_class($m) ;
      $jsonarray['id'] = intval($m->getOid()) ;
      
      switch (get_class($m)) {
          case 'Tarif' : {
              /*
              $json .= '"ref" : "'. $m->getAttr('ref') . '" ,';
              $json .= '"tarif_j" : '. $m->getAttr('tarif_j') . ' ,';
              $json .= '"tarif_we" : '. $m->getAttr('tarif_we') . ' ,';
              $json .= '"tarif_s" : '. $m->getAttr('tarif_s') . ' ,';
              $json .= '"descr" : '. json_encode($m->getAttr('descr')) ;
               * 
               */
              $jsonarray['ref'] = $m->getAttr('ref');
              $jsonarray['tarif_j'] = $m->getAttr('tarif_j');
              $jsonarray['tarif_we'] = $m->getAttr('tarif_we');
              $jsonarray['tarif_s'] = $m->getAttr('tarif_s');
              $jsonarray['descr'] = $m->getAttr('descr');
              break;
          }
          case 'Categorie' : {
              
              $jsonarray['nom'] = $m->getAttr('nom');
              $jsonarray['descr'] = $m->getAttr('descr');
              break;
          }
          case 'Produit' : {
              
              $jsonarray['ref'] = $m->getAttr('ref');
              $jsonarray['nom'] = $m->getAttr('nom');
              $jsonarray['marque'] = $m->getAttr('marque');
              $jsonarray['descr'] = $m->getAttr('descr');
              $jsonarray['stock'] = $m->getAttr('stock');
              $jsonarray['tarif'] = self::json_crazy_object_short($m->getTarif(), $app) ;
              $jsonarray['imgUrl'] = self::makeCrazyUrl(IMG_URL_PATH.'/'.$m->getAttr('photo_path'));
              $jsonarray['categ'] = self::json_crazy_object_short($m->getCategorie(), $app) ;
              break;
          }
          
      }
     
      return json_encode($jsonarray, JSON_FORCE_OBJECT);
  }
  
  public static function json_crazy_list( $a, \Slim\Slim $app) {
     $json = '[' ;
     if (!is_null($a)) {
     foreach ($a as $m) 
         $json .= self::json_crazy_object_short($m, $app) .' , ';
     $json = substr($json,0,-3);
     }
     $json .= ']';
     return $json;
  }


}


?>
