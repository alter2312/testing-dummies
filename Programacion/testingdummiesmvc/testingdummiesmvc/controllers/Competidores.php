<?php
	
	class CompetidoresController {
		
		public function __construct(){
			require_once "models/CompetidoresModel.php";
		}
		
		public function index(){
			
			
			$competidores = new Competidores_model();
			$data["titulo"] = "Competidores";
			$data["competidores"] = $competidores->get_competidores();
			
			require_once "views/competidores/competidores.php";	
		}
		
		public function nuevo(){
			
			$data["titulo"] = "Competidores";
			require_once "views/competidores/competidores_nuevo.php";
		}
		
		public function guarda(){
			
			$ci = $_POST['ci'];
			$nombre = $_POST['nombre'];
			$apellido = $_POST['apellido'];
			$dojo = $_POST['dojo'];
			$escuela = $_POST['escuela'];
			$fnac = $_POST['fnac'];
			$sexo = $_POST['sexo'];

			$competidores = new Competidores_model();
			$competidores->insertar($ci, $nombre, $apellido, $dojo, $escuela, $fnac, $sexo);
			$data["titulo"] = "Competidores";
			$this->index();
		}
		
		public function modificar($idcompetidores){
			
			$competidores = new Competidores_model();
			
			$data["idcompetidores"] = $idcompetidores;
			$data["competidores"] = $competidores->get_competidor($idcompetidores);
			$data["titulo"] = "Competidores";
			require_once "views/competidores/competidores_modifica.php";
		}
		
		public function actualizar(){

			$idcompetidores = $_POST['idcompetidores'];
			$ci = $_POST['ci'];
			$nombre = $_POST['nombre'];
			$apellido = $_POST['apellido'];
			$dojo = $_POST['dojo'];
			$escuela = $_POST['escuela'];
			$fnac = $_POST['fnac'];
			$sexo = $_POST['sexo'];

			$competidores = new Competidores_model();
			$competidores->modificar($idcompetidores, $ci, $nombre, $apellido, $dojo, $escuela, $fnac, $sexo);
			$data["titulo"] = "Competidores";
			$this->index();
		}
		
		public function eliminar($idcompetidores){
			
			$competidores = new Competidores_model();
			$competidores->eliminar($idcompetidores);
			$data["titulo"] = "Competidores";
			$this->index();
		}	
	}
