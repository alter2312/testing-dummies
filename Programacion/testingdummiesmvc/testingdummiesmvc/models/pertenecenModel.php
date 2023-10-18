<?php

class Pertenecen_model {
    private $db;

    public function __construct() {
        $this->db = Conectar::conexion();
    }

    public function agregarRelacion($idcompetidor, $idDojo) {
        $resultado = $this->db->query("INSERT INTO pertenecen (idcompetidor, idDojo) VALUES ('$idcompetidor', '$idDojo')");
    }


    public function eliminarRelacion($idcompetidor, $idDojo) {
        $resultado = $this->db->query("DELETE FROM pertenecen WHERE idcompetidor = '$idcompetidor' AND idDojo = '$idDojo'");
    }


    public function actualizarRelacion($idcompetidor, $idDojo, $nuevosValores) {
        $actualizaciones = array();
        foreach ($nuevosValores as $columna => $valor) {
            $actualizaciones[] = "$columna = '$valor'";
        }
        $actualizacionesStr = implode(", ", $actualizaciones);

        $resultado = $this->db->query("UPDATE pertenecen SET $actualizacionesStr WHERE idcompetidor = '$idcompetidor' AND idDojo = '$idDojo'");
    }

  
}
