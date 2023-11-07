<?php

class LlaveModel {
    private $db;

    public function __construct() {
        $this->db = Conectar::conexion();
    }

    public function getIDTorneo() {
        $sql = "SELECT IDTorneo AS id FROM torneo ORDER BY IDTorneo DESC LIMIT 1";
        $resultado = $this->db->query($sql);
        $row = $resultado->fetch_assoc();
        return $row["id"];
    }
    public function cantidadEquipos($idTorneo){
        $sql = "SELECT COUNT(IDEquipo) AS 'cantidad', Categoria FROM compite WHERE IDTorneo = $idTorneo GROUP BY Categoria";
        $resultado = $this->db->query($sql);
        $cantidad = array();
        while ($row = $resultado->fetch_assoc()) {
            $cantidad[] = $row;
        }
        return $cantidad;
    }
    public function cantEquiposCategoria($idTorneo, $categoria) {
        $sql = "SELECT COUNT(IDEquipo) AS 'cantidad', Categoria FROM compite WHERE IDTorneo = $idTorneo AND Categoria = '$categoria'";
        $resultado = $this->db->query($sql);
        $cantidad = array();
        while ($row = $resultado->fetch_assoc()) {
            $cantidad[] = $row;
        }
        return $cantidad;
    }

    public function getEquiposCategoriaTorneo($idTorneo, $categoria) {
        $sql = "SELECT DISTINCT IDEquipo FROM compite WHERE IDTorneo = $idTorneo AND Categoria = '$categoria'";
        $resultado = $this->db->query($sql);
        $equipos = array();
        while ($row = $resultado->fetch_assoc()) {
            $equipos[] = $row['IDEquipo'];
        }
        return $equipos;
    }

    public function crearLlave($categoria, $color) {
        $sql = "INSERT INTO llave (Categoria, Color) VALUES ('$categoria', '$color')";
        $resultado = $this->db->query($sql);
        return $this->db->insert_id;
    }

    public function agregarEquipoLlave($idTorneo, $equipo, $llave) {
        $sql = "INSERT INTO llave_equipo (IDTorneo, IDEquipo, IDLlave) VALUES ($idTorneo, $equipo, $llave)";
        $resultado = $this->db->query($sql);
    }
    
}

?>
