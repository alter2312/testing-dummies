<?php
 
 class Torneo_model{
   
   private $db;
   private $torneo;
   private $competidores;
    public function __construct(){
        $this->db = Conectar::conexion();
        $torneo= array();
        $competidores = array();
    }

   public function getID(){
    $sql = "SELECT last_insert_id() id";
    $resultado = $this->db->query($sql);
    $row = $resultado->fetch_assoc();
    return $row["id"];


   }
   public function get_competidores()
   {
       $sql = "SELECT * FROM competidor";
       $resultado = $this->db->query($sql);
       while($row = $resultado->fetch_assoc())
       {
           $this->competidores[] = $row;
       }
       return $this->competidores;
   }
   



    public function crearTorneo($ubucacion,$fecha , $hora, $genero, $tipo){

        $sql = ("INSERT INTO torneo(ubicacion, fecha, hora, genero, tipo) VALUES( '$ubucacion','$fecha','$hora', '$genero', '$tipo')");
        $resultado = $this->db->query($sql);
     
        
        return $resultado;
    }

    public function ingresar_competidor($idcompetidor, $idtorneo, $categoria){
        $sql =( "INSERT INTO compiten (idcompetidor, idTorneo, Categoria) values ('$idcompetidor', '$idtorneo', '$categoria')");
        $resultado = $this->db->query($sql);
        return $resultado;
    }
    public function get_competidores_dojo($idDojo){

        $sql = "SELECT * from competidor join dojo on  competidor.idDojo = dojo.idDojo where idDojo";
        $resultado = $this->db->query($sql);
        while($row = $resultado->fetch_assoc())
        {
            $this->competidores[] = $row;
        }
        return $this->competidores;
    }
    
        
    
    public function agruparCompetidor($idTorneo) {
        $sql = "SELECT competidor.*, dojo.nombre AS NombreDojo, compiten.Categoria
                FROM competidor
                JOIN dojo ON competidor.IDDojo = dojo.idDojo
                JOIN compiten ON competidor.idcompetidor = compiten.idcompetidor
                JOIN torneo ON torneo.idTorneo = compiten.idTorneo
                WHERE torneo.idTorneo = $idTorneo
                GROUP BY dojo.idDojo, compiten.Categoria;";
                
        $resultado = $this->db->query($sql);
        while ($row = $resultado->fetch_assoc()) {
            $this->competidores[] = $row;
        }
        
        return $this->competidores;
    }
    
}
    
    
 
 
 ?>