<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProdController
 *
 * @author canals
 */
class TarController extends RestController {

 
   

    
    public function __construct( \Slim\Slim $app) {
        parent::__construct($app);
        $this->json_response();

    }
    
    public function get($id=null){
        $p=new Tarif();
        if (!is_null($id)) {
            
            $p=$p->find($id);
            if (!is_null($p)) {
                $this->app->response()->body(CrazyApp::json_crazy_object($p, $this->app));
            
            } else {
                
                $res = $this->app->response();
                $res->status(404);
             
                $res->body('{ "error" : "ressource not found" , "ressourceid":'.$id.' , "errormsg" : "the ressource was not found: the ressource id do no map to an existing tarif "}');
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
    
    public function getProd($id) {
        $p=new Tarif(); $p=$p->find($id);
        
        if (!is_null($p)) {
                $lp=$p->getProduits();
                $this->app->response()->body(CrazyApp::json_crazy_list($lp, $this->app, CrazyApp::PROD_ROUTE_NAME));
        } else {
            
            $res = $this->app->response();
            $res->status(404);
             
            $res->body('{ "error" : "ressource not found" , "ressourceid":'.$id.' , "errormsg" : "the ressource was not found: the ressource id do no map to an existing tarif "}');
            
        }
    }
    
        
    
}
   
    


?>
