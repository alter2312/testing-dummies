<?php
class LlaveModel
{
    private $db;

    public function __construct()
    {
        $this->db = Conectar::conexion();
    }

    public function cantCompetidoresCategoria($idTorneo)
    {
        $sql = "SELECT categoria, COUNT(idcompetidor) as cantidad 
                FROM compiten
                WHERE idtorneo = $idTorneo
                GROUP BY categoria";
        $resultado = $this->db->query($sql);
        $row = $resultado->fetch_assoc();
        return $row;
    }

    public function crearLlave($categoria, $color)
    {
        $sql = "INSERT INTO llave (Categoria, color) VALUES ('$categoria', '$color')";
        $resultado = $this->db->query($sql);

        if ($resultado) {
            return $this->db->insert_id;
        } else {
            return false;
        }
    }

    public function agregarCompetidorLlave($idTorneo, $idCompetidor, $idLlave)
    {
        $sql = "INSERT into seencuentraen (idTorneo, idcompetidor, idLlave) values ($idTorneo, $idCompetidor, $idLlave)";
        $resultado = $this->db->query($sql);
    }

    public function get_competidores_categoria_Torneo($idTorneo, $categoria)
    {
        $sql = "SELECT idcompetidor
                FROM compiten
                WHERE idtorneo = $idTorneo
                AND Categoria = '$categoria'";
        $result = $this->db->query($sql);
        $competidores = [];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $competidores[] = $row['idcompetidor'];
            }
        }

        return $competidores;
    }
}
?>
