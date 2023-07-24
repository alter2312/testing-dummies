<?php
	
	class Competidores_model {
		
		private $db;
		private $competidores;
		
		public function __construct(){
			$this->db = Conectar::conexion();
			$this->competidores = array();
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
		
		public function insertar($ci, $nombre, $apellido, $dojo, $escuela, $fnac, $sexo){
			
			$resultado = $this->db->query("INSERT INTO competidor (ci, nombre, apellido, dojo, escuela, fnac, sexo) VALUES ('$ci', '$nombre', '$apellido', '$dojo', '$escuela', '$fnac', '$sexo')");
			
		}
		
		public function modificar($idcompetidores, $ci, $nombre, $apellido, $dojo, $escuela, $fnac, $sexo){
			
			$resultado = $this->db->query("UPDATE competidor SET ci='$ci', nombre='$nombre', apellido='$apellido', dojo='$dojo', escuela='$escuela', fnac='$fnac', sexo='$sexo' WHERE idcompetidores = '$idcompetidores'");			
		}
		
		public function eliminar($idcompetidores){
			
			$resultado = $this->db->query("DELETE FROM competidor WHERE idcompetidores = '$idcompetidores'");
			
		}
		
		public function get_competidor($idcompetidores)
		{
			$sql = "SELECT * FROM competidor WHERE idcompetidores='$idcompetidores' LIMIT 1";
			$resultado = $this->db->query($sql);
			$row = $resultado->fetch_assoc();

			return $row;
		}
	} 
?>