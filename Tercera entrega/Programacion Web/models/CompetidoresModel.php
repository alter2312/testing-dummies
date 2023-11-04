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
			$sql = "SELECT competidor.*, dojo.nombre dojo FROM competidor join dojo  on competidor.IDDojo = dojo.idDojo";
			$resultado = $this->db->query($sql);
			while($row = $resultado->fetch_assoc())
			{
				$this->competidores[] = $row;
			}
			return $this->competidores;
		}
		
		
		public function insertar($CI, $nombre, $apellido, $fecha_nac, $genero, $idDojo, $cantidad){
			
			$resultado = $this->db->query("INSERT INTO competidor (CI, nombre, apellido, fecha_nac, genero, IDDojo) VALUES ('$CI', '$nombre', '$apellido', '$fecha_nac', '$genero', '$idDojo')");
			if ($resultado) {
				return $this->db->insert_id;
			} else {
				return false;
			}
			
		}
		
		public function modificar($IDCompetidor, $CI, $nombre, $apellido, $fecha_nac, $genero, $idDojo){
			
			$resultado = $this->db->query("UPDATE competidor SET CI='$CI', nombre='$nombre', apellido='$apellido', fecha_nac='$fecha_nac', genero='$genero', idDojo='$idDOjo' WHERE IDCompetidor = '$IDCompetidor'");			
		}
		
		public function eliminar($IDCompetidor){
			
			$resultado = $this->db->query("DELETE FROM competidor WHERE IDCompetidor = '$IDCompetidor'");
			
		}
		
		public function get_competidor($IDCompetidor)
		{
			$sql = "SELECT competidor.*, dojo.nombre dojo FROM competidor join dojo on competidor.IDDojo = dojo.idDojo WHERE IDCompetidor='$IDCompetidor' LIMIT 1";
			$resultado = $this->db->query($sql);
			$row = $resultado->fetch_assoc();

			return $row;
		}

		public function getIdDojo($nombre){
			$sql = "SELECT idDojo from dojo where nombre='$nombre'";
			$resultado = $this->db->query($sql);
			$row = $resultado->fetch_assoc();
			return $row["idDojo"];
		}

		public function crearEquipo($IDCompetidor, $cantidad){
			$resultado = $this->db->query("INSERT into equipo (IDComeptidor, cantidad) values( $IDCompetidor,$cantidad)");
		}
		
		
	}

?>