<?php

class LlavesController {
    public function __construct() {
        require_once "models/LlavesModel.php";
    }

    public function index() {
        $llave = new LlaveModel;
        $idTorneo = $llave->getIDTorneo();
        $data["title"] = "Torneo número $idTorneo";
        $cantidad = $llave->cantidadEquipos($idTorneo);
        foreach ($cantidad as $categoria) {
            echo "<div class='cant_competidores'>Cantidad de competidores en la categoría " . $categoria['Categoria'] . "<br> " . $categoria['cantidad'] . "<br>" . "</div>";
        }

        require_once "views/llaves/llaves.php";
    }

    public function crearLlave() {
        $llaveModel = new LlaveModel();

        $idTorneo = $llaveModel->getIDTorneo();
        $categoria = $_POST['categoria'];
    
        if ($categoria == "mayores") {
            $categoria = "18/mayores";
        }
        $cantEquipos = $llaveModel->cantEquiposCategoria($idTorneo, $categoria);
        
        $equiposEnCategoria = 0;
    
        foreach ($cantEquipos as $cat) {
            if ($cat["Categoria"] === $categoria) {
                $equiposEnCategoria = $cat["cantidad"];
                break;
            }
        }
    
       
         if($equiposEnCategoria <= 1){
            echo "<div class='alerta'>No hay competidores suficientes en esta categoria  ".$categoria ."</div>";
            $this->index();
        }
        
         elseif ($equiposEnCategoria == 2 || $equiposEnCategoria == 3) {
            $llaveIdRojo = $llaveModel->crearLlave($categoria, 'rojo');
            $equipos = $llaveModel->getEquiposCategoriaTorneo($idTorneo, $categoria);
            foreach ($equipos as $equipo) {
                $llaveModel->agregarEquipoLlave($idTorneo, $equipo, $llaveIdRojo);
            }
         } elseif ($equiposEnCategoria >= 4 && $equiposEnCategoria <= 10) {
            $llaveIdRojo = $llaveModel->crearLlave($categoria, 'rojo');
            $llaveIdAzul = $llaveModel->crearLlave($categoria, 'azul');
            $equipos = $llaveModel->getEquiposCategoriaTorneo($idTorneo , $categoria);
            shuffle($equipos);

            if ($equiposEnCategoria % 2 !== 0) {
                $mitadMasUno = ceil($cantEquipos / 2);
                $equiposDivididos = array_chunk($equipos, $mitadMasUno);

                foreach ($equiposDivididos[0] as $equipo) {
                    $llaveModel->agregarEquipoLlave($idTorneo, $equipo, $llaveIdRojo);
                }

                foreach ($equiposDivididos[1] as $equipo) {
                    $llaveModel->agregarEquipoLlave($idTorneo, $equipo, $llaveIdAzul);
                }
            } else {
                $equiposDivididos = array_chunk($equipos, $cantEquipos / 2);

                foreach ($equiposDivididos[0] as $equipo) {
                    $llaveModel->agregarEquipoLlave($idTorneo, $equipo, $llaveIdRojo);
                }

                foreach ($equiposDivididos[1] as $equipo) {
                    $llaveModel->agregarEquipoLlave($idTorneo, $equipo, $llaveIdAzul);
                }
            }
        } else {
            echo "<div class='alerta'>El sistema no puede soportar más de 10 competidores o equipos por ahora</div>";
            $this->index();
        }
    }
}
?>
