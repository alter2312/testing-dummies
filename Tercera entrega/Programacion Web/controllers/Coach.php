<?php

	
	class CoachController {
		
		public function __construct(){
			require_once "models/coachModel.php";
		}
		
		public function index(){
			
			
			$coach = new Coach_model();
			$data["titulo"] = "Coach";
			$data["coach"] = $coach->get_coaches();
			
			
			require_once "views/coach/coach.php";	
		}
		
		public function nuevo(){
			
			$data["titulo"] = "coach";
			require_once "views/coach/coach_nuevo.php";
		}
		
		public function guarda(){
			
			$CI = $_POST['CI'];
			$nombre = $_POST['nombre'];
			$apellido = $_POST['apellido'];
		    $telefono = $_POST['telefono'];
            $dojo = $_POST['dojo'];
			$coach = new Coach_model();
			$idDojo = $coach->getIdDojo($dojo);

			$insertar = $coach->insertar($CI, $nombre, $apellido, $telefono);
            $coachDojo = $coach ->dirige($CI,$idDojo);
			$data["titulo"] = "coach";
			$this->index();

			
			
		}

		public function modificar($CI){
			
			$coach = new Coach_model();
			
			$data["coach"] = $coach->get_coach($CI);
			$data["CI"] = $CI;

			$data["titulo"] = "Coach";
			require_once "views/coach/coach_modificar.php";
			
		}
		
		public function actualizar(){

            $CI = $_POST['CI'];
			$nombre = $_POST['nombre'];
			$apellido = $_POST['apellido'];
		    $telefono = $_POST['telefono'];
            $dojo = $_POST['dojo'];
			$coach = new Coach_Model();
			$idDojo = $coach->getIdDojo($dojo);

			$modificar = $coach->modificar($CI, $nombre, $apellido, $telefono);
            $coachDojo = $coach ->modificar_dirige($CI,$idDojo);
			$data["titulo"] = "coach";
			$this->index();
        }
        
			public function eliminar($CI){
			
			$coach = new Coach_model();
			$eliminar= $coach->eliminar($CI);
			$data["titulo"] = "Coach";
			$this->index();
		}	
public function formInscripcion() {
require_once "views/competidores/inscripcion_competidor.php";
}
		public function inscrpcion(){
			$CI = $_POST['CI'];
			$nombre = $_POST['nombre'];
			$apellido = $_POST['apellido'];
			$fecha_nac = $_POST['fecha_nac'];
			$genero = $_POST['genero'];
			$Dojo = $_POST['Dojo']; 
			
			$CiCoach = $_POST['CI-coach'];
			$nombre = $_POST['nombre-coach'];
			$apellido = $_POST['apellido-coach'];
		    $telefono = $_POST['telefono-coach'];
			
			$coach = new Coach_model();
			$coachExistente = $coach ->validar_Coach_Existente($CiCoach);
			if($coachExistente === true){

				$idDojo = $coach->getIdDojo($Dojo);
				$ingresarCompetidor= $coach->insertar($CI, $nombre, $apellido, $fecha_nac, $genero, $idDojo);
				echo "<div class='exito'> la inscripcion fue un exito <div>";

			}
			else{
				echo "<p class='alerta'>No tienes permisos para inscribir a competidores habla con el personal de la cuk si es nesesario<p>";
			}

			$this->formInscripcion();
		}

	}

	?>	
		