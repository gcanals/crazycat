<?php


/**
 * Description of ProdController
 *
 * @author canals
 */
class ProdController extends RestController {

    
    public function __construct( \Slim\Slim $app) {
        parent::__construct($app);
        $this->json_response();

    }
    
    public function get($id=null){
        if ($this->app->request()->isPost()) echo "oh oh oh ?<br/>";
        $p=new Produit();
        if (!is_null($id)) {
            
            $p=$p->find($id);
            if (!is_null($p)) {
                $this->app->response()->body(CrazyApp::json_crazy_object($p, $this->app));
            
            } else {
                
                $res = $this->app->response();
                $res->status(404);
             
                $res->body('{ "error" : "ressource not found" , "ressourceid":'.$id.' , "errormsg" : "the ressource was not found: the ressource id do no map to an existing product "}');
            }
        }
        
        else {
            
            $request_query=$this->app->request()->get();
            if ( is_null($request_query) ) { 
                $list=$p->find() ; 
                }
            else {
                $findp['conditions']=$request_query;
                $list=$p->find($findp);
                
            }
            $resp = CrazyApp::json_crazy_list( $list ,$this->app);
            $res = $this->app->response();
            $res->body($resp);
        }
    }
    
    public function post() {
        
        if ( (is_null($ref=$this->app->request()->post('ref'))) OR
             (is_null($nom=$this->app->request()->post('nom'))) 
           ) {
            $res=$this->app->response();
            $res->status(400);
            $res->body('{ "errmsg" : "missing required value" }');
            return false; 
        }
        
        $p=new Produit;
        $postvars = $this->app->request()->post();
        $p->setAttr('ref', $ref);
        $p->setAttr('nom', $nom);
        $p->setAttr('marque', $this->app->request()->post('marque'));
        $p->setAttr('descr', $this->app->request()->post('descr'));
        $p->setAttr('code_t', $this->app->request()->post('code_t'));
        $p->setAttr('id_categ', $this->app->request()->post('id_categ'));
        $p->setattr('stock',$this->app->request()->post('stock') );
        $p->setAttr('photo_path', 'no-image.png');
        
        $handle = new upload($_FILES['prod_photo_file']);
        $imgdir = INSTALLATION_DIR . DIRECTORY_SEPARATOR . IMAGEDIR_NAME . DIRECTORY_SEPARATOR ;
               
        if ($handle->uploaded) {
            $handle->process ($imgdir);
            if ($handle->processed) $p->setAttr('photo_path', $handle->file_dst_name);
        }
        
        try {
        $p->insert();
        } catch (Exception $e) {
           $res=$this->app->response();
            $res->status(500);
            $res->body('{ "errmsg" : "database insertion error" , "dberror" : "'.$e->getMessage().'"}');
            return false;  
        }
        $res=$this->app->response();
        $res->status(201);
        $res->body(CrazyApp::json_crazy_object($p, $this->app));
        
    }
    
    public function getCat($id) {
        $p=new Produit();
        $p=$p->find($id);
        if (!is_null($p)) {
                $cat = $p->getCategorie();
                $this->app->response()->body(CrazyApp::json_crazy_object($cat, $this->app));
        } else {
            
            $res = $this->app->response();
            $res->status(404);
             
            $res->body('{ "error" : "ressource not found" , "ressourceid":'.$id.' , "errormsg" : "the ressource was not found: the ressource id do no map to an existing product "}');
            
        }
    }
        
     public function getTarif($id) {
        $p=new Produit();
        $p=$p->find($id);
        if (!is_null($p)) {
                $tarif = $p->getTarif();
                $this->app->response()->body(CrazyApp::json_crazy_object($tarif, $this->app));
        } else {
            
            $res = $this->app->response();
            $res->status(404);
             
            $res->body('{ "error" : "ressource not found" , "ressourceid":'.$id.' , "errormsg" : "the ressource was not found: the ressource id do no map to an existing product "}');
            
        }
        
    }
}
   
    


?>
