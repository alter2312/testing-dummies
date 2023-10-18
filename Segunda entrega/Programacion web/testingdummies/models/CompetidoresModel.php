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
		
		
		public function insertar($CI, $nombre, $apellido, $fecha_nac, $genero){
			
			$resultado = $this->db->query("INSERT INTO competidor (CI, nombre, apellido, fecha_nac, genero) VALUES ('$CI', '$nombre', '$apellido', '$fecha_nac', '$genero')");
		 	
			
		}
		
		public function modificar($idcompetidor, $CI, $nombre, $apellido, $fecha_nac, $genero){
			
			$resultado = $this->db->query("UPDATE competidor SET CI='$CI', nombre='$nombre', apellido='$apellido', fecha_nac='$fecha_nac', genero='$genero' WHERE idcompetidor = '$idcompetidor'");			
		}
		
		public function eliminar($idcompetidor){
			
			$resultado = $this->db->query("DELETE FROM competidor WHERE idcompetidor = '$idcompetidor'");
			
		}
		
		public function get_competidor($idcompetidor)
		{
			$sql = "SELECT * FROM competidor WHERE idcompetidor='$idcompetidor' LIMIT 1";
			$resultado = $this->db->query($sql);
			$row = $resultado->fetch_assoc();

			return $row;
		}
	} 
?>