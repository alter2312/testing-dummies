<?php
class Usuarios_model
{
    private $db;
    private $usuarios;
    

    public function __construct(){

        $this->db = Conectar::conexion();
        $this->usuarios = array();
    }

    public function get_validar($nombre, $password){

        $sql = "SELECT*FROM usuario where  nombre='$nombre' and contraseña='$password'";
        $resultado = $this->db->query($sql);
//num_rows propiedad para determinar el número de filas afectadas en la consulta
        if ($resultado->num_rows == 1) {
            while ($row = $resultado->fetch_assoc()) {
                    $this->usuarios[] = $row;
                    return $this->usuarios;
                }
         }       
        else {
                return false;
            }
    }
  
    public function get_usuarios()	{
	
        $sql = "SELECT * FROM usuario";
        $resultado = $this->db->query($sql);
        while($row = $resultado->fetch_assoc())
        {
         $this->usuarios[] = $row;
        }
        return $this->usuarios;
    }
		
		
		public function insertar($nombre, $contraseña ,$grupoUsuario){
			
			$resultado = $this->db->query("INSERT INTO usuario (nombre, contraseña, grupoUsuario) VALUES ('$nombre', '$contraseña','$grupoUsuario')");
		 	
			
		}
		
		public function modificar($idUsuario, $nombre, $contraseña, $grupoUsuario){
			
			$resultado = $this->db->query("UPDATE usuario SET nombre='$nombre', contraseña='$contraseña', grupoUsuario='$grupoUsuario' WHERE idUsuario = '$idUsuario'");			
		}
		
		public function eliminar($idUsuario){
			
			$resultado = $this->db->query("DELETE FROM usuario WHERE idUsuario = '$idUsuario'");
			
		}
		
		public function get_usuario($idUsuario)
		{
			$sql = "SELECT * FROM usuario WHERE idUsuario='$idUsuario' LIMIT 1";
			$resultado = $this->db->query($sql);
			$row = $resultado->fetch_assoc();

			return $row;
		}
}

