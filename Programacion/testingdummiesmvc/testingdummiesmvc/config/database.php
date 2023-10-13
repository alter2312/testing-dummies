<?php
	
	class Conectar {
		
		public static function conexion(){
			
			$conexion = new mysqli("127.0.0.1", "root", "", "mvc1");
			return $conexion;
			
		}
	}
?>