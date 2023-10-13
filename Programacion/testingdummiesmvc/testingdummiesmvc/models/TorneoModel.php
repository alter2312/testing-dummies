<?php
 
 class Torneo_model{
   
   private $db;
   private $torneo;
    public function __construct(){
        $this->db = Conectar::conexion();
        $torneo= array();
    }
   
    public function crearTorneo($fecha, $ubucacion, $hora, $tipo){

        $sql = ("INSERT INTO Torneo(Fecha, ubucacion, hora, tipo) VALUES( '$fecha', '$ubucacion', '$hora', '$tipo')");
        $resultado = $this->db->query($sql);
        return $resultado;
    }

    public function crearTorneoIndividual($idtorneo, $categoria){
        $sql = ("INSERT INTO torneo_individual(idTorneo,categoria) values ('$idtorneo', '$categoria')");
        $resultado =$this ->query($sql);
        return $resultado;
    }
    public function crearTorneoGrupal($idtorneo){
        $sql = ("INSERT INTO torneo_individual(idTorneo) values ('$idtorneo'");
        $resultado =$this ->query($sql);
        return $resultado;
    }

 }
 
 ?>