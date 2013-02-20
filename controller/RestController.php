<?php



/**
 * Description of Controller
 *
 * @author canals
 */
abstract class RestController {
    protected $app;
    
    public function __construct( \Slim\Slim $app) {
        $this->app=$app;

    }
    
    public function json_response() {
      $res = $this->app->response();
      $res['Content-Type']= 'application/json; charset=utf-8';
  }
}

?>
