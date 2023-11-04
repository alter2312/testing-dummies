<?php
class LlaveController{
    public function __construct(){
        require_once "models/LlaveModel.php";
    }

    public function mostrarLlave(){
        require_once "views/llaves/llaves.php";
    }

    public function crearLlave(){
        $idTorneo = $_POST['idTorneo'];
        $categoria = $_POST['categoria'];
        
        $llaveModel = new LlaveModel();

        $cantCompetidores = $llaveModel->cantCompetidoresCategoria($idTorneo);

        if ($cantCompetidores['cantidad'] == 2 || $cantCompetidores['cantidad'] == 3) {
            $llaveIdRojo = $llaveModel->crearLlave($categoria, 'rojo');
            $competidores = $llaveModel->get_competidores_categoria_Torneo($idTorneo, $categoria);
            foreach($ompetidores as $competidor){
                $llaveModel->agregarCompetidorLlave($idTorneo, $competidor, $llaveIdRojo);

            }
        }
        elseif ($cantCompetidores['cantidad'] >=4 && $cantCompetidores['cantidad']<=10 ) {
            $llaveIdRojo = $llaveModel->crearLlave($categoria, 'rojo');
            $llaveIdAzul = $llaveModel->crearLlave($categoria, 'azul');       
            shuffle($competidores);
                if($cantCompetidores['cantidad'] % 2 !== 0){
                $mitadMasUno = ceil($cantCompetidores['cantidad'] / 2);
                $competidoresDivididos = array_chunk($competidores, $mitadMasUno);
            
                foreach ($competidoresDivididos[0] as $competidor) {
                    $llaveModel->agregarCompetidorLlave($idTorneo, $competidor, $llaveIdRojo);
                }

                foreach ($competidoresDivididos[1] as $competidor) {
                    $llaveModel->agregarCompetidorLlave($idTorneo, $competidor, $llaveIdAzul);
                }
            }    
            else {
                $competidoresDivididos = array_chunk($competidores, $cantCompetidores['cantidad'] / 2);

                foreach ($competidoresDivididos[0] as $competidor) {
                    $llaveModel->agregarCompetidorLlave($idTorneo, $competidor, $llaveIdRojo);
                }

                foreach ($competidoresDivididos[1] as $competidor) {
                    $llaveModel->agregarCompetidorLlave($idTorneo, $competidor, $llaveIdAzul);
                }
            }
        }
    }

}
?>
