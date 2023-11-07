<?php

class Torneo_model {
    private $db;
    private $torneo;
    private $equipos;

    public function __construct() {
        $this->db = Conectar::conexion();
        $this->torneo = array();
        $this->equipos = array();
    }

    public function getID() {
        $sql = "SELECT last_insert_id() id";
        $resultado = $this->db->query($sql);
        $row = $resultado->fetch_assoc();
        return $row["id"];
    }

    public function get_equipos_individual($genero) {
        $sql = "SELECT competidor.*, IDEquipo 
                FROM equipo
                JOIN competidor ON equipo.IDCompetidor = competidor.IDCompetidor
                WHERE equipo.Cantidad = 1 AND competidor.Genero = '$genero'";
        $resultado = $this->db->query($sql);
        while ($row = $resultado->fetch_assoc()) {
            $this->equipos[] = $row;
        }
        return $this->equipos;
    }

    public function get_equipos_grupal($genero) {
        $sql = "SELECT competidor.*, IDEquipo 
                FROM equipo
                JOIN competidor ON equipo.IDCompetidor = competidor.IDCompetidor
                WHERE equipo.Cantidad = 3 AND competidor.Genero = '$genero'";
        $resultado = $this->db->query($sql);
        while ($row = $resultado->fetch_assoc()) {
            $this->equipos[] = $row;
        }
        return $this->equipos;
    }

    public function crearTorneo($ubicacion, $fecha, $genero, $tipo, $estado) {
        $sql = "INSERT INTO torneo (Ubicacion, Fecha, Genero, Tipo, EstadoTorneo) VALUES ('$ubicacion', '$fecha', '$genero', '$tipo', '$estado')";
        $resultado = $this->db->query($sql);
        return $resultado;
    }

    public function ingresarEquipo($idEquipo, $idTorneo, $categoria) {
        $sql = "INSERT INTO compite (IDEquipo, IDTorneo, Categoria) VALUES ('$idEquipo', '$idTorneo', '$categoria')";
        $resultado = $this->db->query($sql);
        return $resultado;
    }

    public function ObtenerFechaNacimientoCompetidor($idCompetidor) {
        $sql = "SELECT Fecha_Nac FROM competidor WHERE IDCompetidor = '$idCompetidor'";
        $resultado = $this->db->query($sql);
        $row = $resultado->fetch_assoc();
        return $row["Fecha_Nac"];
    }
}

