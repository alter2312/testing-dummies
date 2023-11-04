<?php

class equipo_model{

    private $equipo;
    private $competidores;
    private $db;
    
    public function __construct(){
        $this->db = Conectar::conexion();
        $this->competidores = array();
        $this->equipo = array();   
    }
	public function get_equipo()
		{
			$sql = "SELECT IDEequipo, competidores.*, .nombre dojo
			FROM competidores
			JOIN c ON coach.CI = dirige.CI
			JOIN dojo ON dirige.IDDojo = dojo.idDojo;";
			$resultado = $this->db->query($sql);
			while($row = $resultado->fetch_assoc())
			{
				$this->coach[] = $row;
			}
			return $this->coach;
		}
   
}
?>