<?php
  class Dojo_model{
    private $bd;
    private $dojo;

    public function __construct(){
        $this->db = Conectar::conexion();
        $this->dojos= array();
    }
    public function get_dojos()
    {
        $sql = "SELECT * FROM dojo";
        $resultado = $this->db->query($sql);
        while($row = $resultado->fetch_assoc())
        {
            $this->dojo[] = $row;
        }
        return $this->dojo;
    }

        
    
    public function insertar($nombre, $escuela){
        
        $resultado = $this->db->query("INSERT INTO dojo (nombre, escuela) VALUES ('$nombre', '$escuela')");
         
        
    }
    
    public function modificar($idDojo, $nombre, $escuela ){
        
        $resultado = $this->db->query("UPDATE dojo SET nombre='$nombre', escuela='$escuela' WHERE idDojo= '$idDojo'");			
    }
    
    public function eliminar($idDojo){
        
        $resultado = $this->db->query("DELETE FROM dojo WHERE idDojo = '$idDojo'");
        
    }
    
    public function get_dojo($idDojo)
    {
        $sql = "SELECT * FROM dojo WHERE idDojo='$idDojo' LIMIT 1";
        $resultado = $this->db->query($sql);
        $row = $resultado->fetch_assoc();

        return $row;
    }
}
?>
  