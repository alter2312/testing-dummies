<?php

class TorneoController{
    public function __construct(){
        require_once "models/TorneoModel.php";
    }

    public function viewFormulario (){
        require_once "views/torneos/crear_torneo.php";
    }
  
    
    public function CrearTorneo() {
        $ubicacion = $_POST["ubicacion"];
        $fecha = $_POST["fecha"];
        $hora = $_POST["hora"];
        $genero = $_POST["genero"];
        $tipo = $_POST["tipo"];
        $torneo = new torneo_model;
        
        $torneo->creartorneo($ubicacion, $fecha, $genero, $tipo, 'Inicializado');
        $idTorneo = $torneo->getID();
        
        i           |       |       |       |1              |                   f ($tipo == "Individual") {
            // Obtén los equipos individuales (Cantidad = 1)
            $equiposIndividuales = $torneo->get_equipos_individual($genero);
            
            foreach ($equiposIndividuales as $equipo) {
                // Calcula la categoría basada en la fecha de nacimiento del capitán
                $categoria = $this->CalcularCategoria($equipo);
                
                // Ingresa el equipo al torneo en la categoría calculada
                $torneo->ingresarEquipo($equipo['IDEquipo'], $idTorneo, $categoria);
            }
        } elseif ($tipo == "Grupal") {
            // Obtén los equipos grupales (Cantidad = 3)
            $equiposGrupales = $torneo->get_equipos_grupal($genero);
            
            foreach ($equiposGrupales as $equipo) {
                $categoria = $this->CalcularCategoria($equipo);
                
                $torneo->ingresarEquipo($equipo['IDEquipo'], $idTorneo, $categoria);
            }
        }
        header("location: index.php?c=llave&a=index");
  
    }


    public function CalcularCategoria($equipo) {
       $torneo = new Torneo_model;
        $capitan = $equipo['IDCompetidor'];
        $fechaNacimiento = $torneo->ObtenerFechaNacimientoCompetidor($capitan);
    
        if ($fechaNacimiento !== null) {
            $hoy = new DateTime();
            $fechaNac = new DateTime($fechaNacimiento);
            $edad = $hoy->diff($fechaNac)->y;
    
            if ($edad >= 12 && $edad <= 13) {
                return '12/13';
            } elseif ($edad >= 14 && $edad <= 15) {
                return '14/15';
            } elseif ($edad >= 16 && $edad <= 17) {
                return '16/17';
            } elseif ($edad >= 18) {
                return '18/Mayores';
            }
        }
    }
    
}
?>