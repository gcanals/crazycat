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
class Tarif extends DBModel {

    /*
     * __construct : constructeur de Categorie
     * Initialise le tableau d'attributs, le tableau de valeurs
     *  le nom du modèle et le nom de la table
     */

    public function  __construct($tval = null) {
        
        $this->_a = array('id'=>'int', 
                          'ref'=>'string',
                          'tarif_j'=>'int', 
                          'tarif_we'=>'int', 
                          'tarif_s'=>'int', 
                          'descr'=>'string');
        $this->_mname = 'Tarif' ;//__CLASS__;
        $this->_tname = 'tarifs' ;
        $this->_dbconfig = CRAZY_DB ;
        parent::__construct($tval);
    }

    /*
     * getAnnonces : implantation du lien n-n vers Annonce
     * retourne un tableau d'annonces liés à cette catégorie
     * 
     * @author G. Canals
     * @return Array of Produit
     * 
     */
    public function getProduits() {
        $a=new Produit();
        return $a->find( array('conditions'=> array( 'code_t' => $this->getOid())) );           
    }

}
?>
