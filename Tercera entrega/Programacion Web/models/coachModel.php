<?php
	
	class Coach_model {
		
		private $db;
		private $coach;
	
		
		public function __construct(){
			$this->db = Conectar::conexion();
			$this->coach = array();
			
		}
		
		public function get_coaches()
		{
			$sql = "SELECT coach.*, dojo.nombre dojo
			FROM coach
			JOIN dirige ON coach.CI = dirige.CI
			JOIN dojo ON dirige.IDDojo = dojo.idDojo;";
			$resultado = $this->db->query($sql);
			while($row = $resultado->fetch_assoc())
			{
				$this->coach[] = $row;
			}
			return $this->coach;
		}

		
		public function insertar($CI, $nombre, $apellido, $telefono){
			
			$resultado = $this->db->query("INSERT INTO coach (CI, Nombre, Apellido, Telefono ) VALUES ('$CI', '$nombre', '$apellido', '$telefono')");
		 	
			
		}
		
		public function modificar( $CI, $nombre, $apellido, $telefono){
			
			$resultado = $this->db->query("UPDATE coach SET CI='$CI', Nombre='$nombre', Apellido='$apellido',Telefono ='$telefono' WHERE CI = '$CI'");			
		}
		
		public function eliminar($CI){
			$resultado = $this->db->query("DELETE FROM dirige WHERE CI = '$CI'");
			
			if ($resultado) {
				$resultado = $this->db->query("DELETE FROM coach WHERE CI = '$CI'");
			}
		}
		
		
		public function get_coach($CI)
		{
			$sql = "SELECT coach.*, dojo.nombre AS dojo
			FROM coach
			JOIN dirige ON coach.CI = dirige.CI
			JOIN dojo ON dirige.IDDojo = dojo.idDojo
			WHERE coach.CI ='$CI' LIMIT 1";
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

		public function getNombreDojo($idDojo){
			$sql = "SELECT Nombre from Dojo where idDojo='$idDojo'";
			$resultado = $this->db->query($sql);
			return $resultado;
		}
		public function dirige($CI,$idDojo){
        $sql = "INSERT into dirige(CI, IDDojo) values ('$CI', '$idDojo')";
        $resultado = $this->db->query($sql);
        }
        public function modificar_dirige($CI, $idDojo){
			$resultado = $this->db->query("UPDATE  dirige SET CI='$CI', IDDojo='$idDojo' WHERE CI = '$CI'");			
        }
		
		public function validar_Coach_Existente($CI) {
			$sql = "SELECT * FROM coach WHERE CI = '$CI'";
			$resultado = $this->db->query($sql);
			if ($resultado->num_rows == 1) {
				return true;
			} else {
				return false;
			}
		}
	}

?>