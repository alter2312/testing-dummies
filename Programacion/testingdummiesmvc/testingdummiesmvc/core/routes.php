<?php
	
	function cargarControlador($controlador){
		
		$nombreControlador = ucwords($controlador)."Controller";
		$archivoControlador = 'controllers/'.ucwords($controlador).'.php';
		
		if(!is_file($archivoControlador)){
			
			$archivoControlador= 'controllers/'.CONTROLADOR_PRINCIPAL.'.php';
			
		}
		require_once $archivoControlador;
		$control = new $nombreControlador();
		return $control;
	}
	
	function cargarAccion($controller, $accion, $idcompetidores = null){
		
		if(isset($accion) && method_exists($controller, $accion)){
			if($idcompetidores == null){
				$controller->$accion();
				} else {
				$controller->$accion($idcompetidores);
			}
			} else {
			$controller->ACCION_PRINCIPAL();
		}	
	}
?>