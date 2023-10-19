
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

        public function inico(){
            require_once "views/inicio.php";
        }
        
        public function login() {
             require "views/usuarios/login.php";
        }


        public function validar() {
            
        
                if (empty($_POST["user"]) || empty($_POST["password"]) || empty($_POST["grupoUsuario"])) {
                    echo "hola";
                    echo '<div class="error">Campos vacíos</div>';
                    require_once "views/usuarios/login.php";
                    
                } else {
                    session_start();
                    $usuario = new Usuarios_model();
                    $user = $_POST['user'];
                    $password = $_POST['password'];
                    $grupoUsuario = $_POST['grupoUsuario'];
                    $data = $usuario->get_validar($user, $password, $grupoUsuario);
        
                    if ($data) {
                        $_SESSION['grupoUsuario'] = $grupoUsuario;
        
                        switch ($grupoUsuario) {
                            case 'Juez':
                                header("Location: views/jueces/inicio_juez.php");
                                break;
                            case 'Juez1':
                                header("Location: views/jueces/inicio_juez1.php");
                                break;
                            case 'Administrador':
                                header("Location: views/administrador/inicio_administrador.php");
                                break;
                            case 'administradorBDKarate':
                                header("Location: views/administrador_bd_karate/inicio_Administrador_bd_karate.php");
                                break;
                            default:
                                echo "Tipo de usuario no válido.";
                        }
                    } else {
                        echo '<div class="error">Usuario o contraseña incorrectos</div>';
                        require_once "views/usuarios/login.php";
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

     
        public function cerrarsession(){
            session_unset();
            session_destroy();
           header("location: views/usuarios/login.php") ;
        }


    }
?>