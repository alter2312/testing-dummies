<?php

class TorneoController{
    public function __construct(){
        require_once "models/TorneoModel.php";
    }

    public function viewFormulario (){
        require_once "views/torneos/crear_torneo.php";
    }
    public function CrearTorneo() {
        // Aquí capturas los datos del torneo desde el formulario
        $ubicacion = $_POST["ubicacion"];
        $fecha = $_POST["fecha"];
        $hora = $_POST["hora"];
        $genero = $_POST["genero"];
        $tipo = $_POST["tipo"];
    
        // Creas el torneo y obtienes su ID
        $torneo = new torneo_model;
        $torneo->creartorneo($ubicacion, $fecha, $hora, $genero, $tipo);
        $idTorneo = $torneo->getID();
        $competidor = $torneo->get_competidores();
    
        foreach ($competidor as $datoscompetidor) {
            $this->ingresarCompetidor($idTorneo, $datoscompetidor["idcompetidor"], $datoscompetidor["fecha_nac"], $datoscompetidor["genero"]);
        }
        header("Location: views/llaves/llaves.php");
    }
    
        
    


    public function ingresarCompetidor($idtorneo, $idcompetidor, $fechaNacimiento, $genero) {
        $torneo = new torneo_model;
        $genero_torneo = $_POST["genero"];
        $tipo = $_POST["tipo"];
   
        if ($genero_torneo == $genero){
            if ($tipo == "Individual" ){}
            $fechaNacimiento = new DateTime($fechaNacimiento);
            $hoy = new DateTime();
            $edad = $hoy->diff($fechaNacimiento)->y;
            $categoria = '';
            if ($edad >= 12 && $edad <= 13) {
                $categoria = '12/13 años';
                $data = $torneo->ingresar_competidor( $idcompetidor,$idtorneo, $categoria);

            } elseif ($edad >= 14 && $edad <= 15) {
                $categoria = '14/15 años';
                $data = $torneo->ingresar_competidor( $idcompetidor,$idtorneo, $categoria);

            } elseif ($edad >= 16 && $edad <= 17) {
                $categoria = '16/17 años';
                $data = $torneo->ingresar_competidor( $idcompetidor,$idtorneo, $categoria);

            } elseif ($edad >= 18) {
                $categoria = 'Mayores';
                $data = $torneo->ingresar_competidor( $idcompetidor,$idtorneo, $categoria);

            }
        }

        else{
            return false;
        }
    }
    public function TorneoGrupal(){
        $competidoresDojo = $torneo->get_competidores_dojo();
        $grupal = $torneo->distribuir($idcompetidor);
        require_once "../../views/torneos/torneo_grupal.php";

    }
}
?>