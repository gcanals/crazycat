<?php


/**
 * Active Record pour les produits
 *
 * @author canals
 */
class Produit extends DBModel {
   
    public function  __construct($tval = null) {
        
        $this->_a = array('id'=>'int', 'ref'=>'string', 'nom'=>'string', 'marque'=>'string',
                          'descr'=>'string', 'code_t'=> 'int', 'photo_path'=>'string',
                          'stock'=> 'int',
                          'id_categ'=>'int');
        $this->_mname = __CLASS__;
        $this->_tname = 'produits' ;
        $this->_dbconfig = CRAZY_DB ;
        parent::__construct($tval);
    }

    public function getCategorie () {
        $c=new Categorie;
        return $c->find($this->getAttr('id_categ'));
    }
    
    
    public function getTarif () {
        $t=new Tarif;
        return $t->find($this->getAttr('code_t'));
    }
}

?>
