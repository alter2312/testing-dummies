<?php

class UsuariosController
{

    public function __construct()
    {
        require_once "models/usuariosModel.php";

    }
      public function index(){
			
			
			$usuarios = new Usuarios_model();
			$data["titulo"] = "Usuarios";
			$data["usuarios"] = $usuarios->get_usuarios();
			
			require_once "views/usuarios/usuario.php";	
		}
		
		public function nuevo(){
			
			$data["titulo"] = "Usuarios";
			require_once "views/usuarios/usuario_nuevo.php";
		}

        public function login() {
   
             require "views/usuarios/login.php";
        }


     public function validar(){
        if(!empty($_POST["btn-ingresar"])){
            if(empty($_POST["user"] )|| empty($_POST["password"])){
                echo '<div class="error">Campos vacios</div>';
                 require_once "views/usuarios/login.php";
            }
            else{
                $usuario = new Usuarios_model();
                $user = $_POST['user'];
                $password = $_POST['password'];
                $data["usuarios"] = $usuario->get_validar($user, $password);
                if($data["usuarios"]){
                require_once "views/usuarios/inicio.php";
            }
            else{
                echo '<div class="error">Usuario o contraseña incorrectos</div>';
                require_once "views/usuarios/login.php";
            }
            }   
        }
     }
     public function inicio(){
        require_once "views/usuarios/inicio.php";
    }
  
		
		public function guarda(){
			
			$nombre = $_POST['nombre'];
			$contraseña = $_POST['contraseña'];
            $grupoUsuario = $_POST["grupoUsuario"];
			$usuarios = new Usuarios_model();
			$usuarios->insertar($nombre, $contraseña ,$grupoUsuario);
			$data["titulo"] = "Usuarios";
			$this->index();
			
		}

		public function modificar($idUsuario){
			
			$usuarios = new Usuarios_model();
			
			$data["usuarios"] = $usuarios->get_usuario($idUsuario);
			$data["idUsuario"] = $idUsuario;

			$data["titulo"] = "Usuarios";
			require_once "views/usuarios/usuario_modificar.php";
			
		}
		
		public function actualizar(){

				$idUsuario = $_POST['idUsuario'];
                $nombre = $_POST['nombre'];
                $grupoUsuario = $_POST["grupoUsuario"];
                $contraseña = $_POST['contraseña'];
				$usuarios = new Usuarios_model();
				$usuarios->modificar($idUsuario, $nombre, $contraseña, $grupoUsuario);
				$data["titulo"] = "Usuarios";
				$this->index();
			}
		
			public function eliminar($idUsuario){
			
			$usuarios = new Usuarios_model();
			$usuarios->eliminar($idUsuario);
			$data["titulo"] = "Usuarios";
			$this->index();
		}	
    }

?>