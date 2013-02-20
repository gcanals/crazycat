<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Classe Categorie : active Record pour la table categorie
 *
 * @author canals
 * @package crazy
 */
class Categorie extends DBModel {

    /*
     * __construct : constructeur de Categorie
     * Initialise le tableau d'attributs, le tableau de valeurs
     *  le nom du modèle et le nom de la table
     */

    public function  __construct($tval = null) {
        
        $this->_a = array('id'=>'int', 
                          'nom'=>'string', 
                          'descr'=>'string');
        $this->_mname = 'Categorie' ;//__CLASS__;
        $this->_tname = 'categorie' ;
        $this->_dbconfig = CRAZY_DB ;
        parent::__construct($tval);
    }

    /*
     * getAnnonces : implantation du lien n-n vers Annonce
     * retourne un tableau d'annonces liés à cette catégorie
     * 
     * @author G. Canals
     * @return Array of Annonce
     * 
     */
    public function getProduits() {
        $a=new Produit();
        return $a->find (array( 'conditions'=> array('id_categ' => $this->getOid()) ) );           
    }

}
?>
