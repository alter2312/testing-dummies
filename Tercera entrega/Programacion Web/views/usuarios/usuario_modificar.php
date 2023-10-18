<?php
	
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><?php echo $data["titulo"]; ?></title>
		<link rel="stylesheet" href="../../assets/css/styles-form-competidores-dojos.css">
	</head>
	
	<body>
		<div class="container">
			
		<h1><?php echo $data["titulo"]; ?></h1>

			<form id="nuevo" class="form-dojo" name="nuevo" method="POST" action="../../index.php?c=usuarios&a=actualizar&id='<?php echo $data["idUsuario"];?>'" autocomplete="off">
				
				<input type="hidden" id="idUsuario" name="idUsuario" value="<?php echo $data["idUsuario"]; ?>" />
				<div class="form-group">
						<label for="nombre" class="label-form label">User</label>
						<select name="nombre" class="input-form" id="nombre" required value="<?php echo $data["usuarios"]["nombre"]?>" >
							<option value=""></option>
							<option value="Juez1">Juez1</option>
							<option value="Juez2">Juez2</option>
							<option value="Juez3">Juez3</option>
							<option value="Juez4">Juez4</option>
							<option value="Juez5">Juez5</option>
							<option value="Juez6">Juez6</option>
							<option value="Juez7">Juez7</option>
							<option value="Administrador">Administrador</option>
							<option value="AdministradorBDKarate">Administrador de usuario</option>
						</select>
				</div>

				<div class="form-group">
					<input type="password" class="input-form" id="contraseña" name="contraseña" pattern="[A-Za-z0-9]*[A-Z]+[A-Za-z0-9]*[A-Za-z0-9]{7,}" title="la contraseña debe de tener 8 minimo caracteres y al menos una mayuscula" required value="<?php echo $data["usuarios"]["contraseña"]?>" />
					<label for="contraseña" class="label-form ">Contraseña</label>

				</div>

				<div class="form-group">

						<label for="grupo" class="label-form label">Grupo</label>
						<select name="grupoUsuario" class="input-form" id="grupoUsuario" required value="<?php echo $data["usuarios"]["grupoUsuario"]?>">
							<option value=""></option>
							<option value="Juez">Juez</option>
							<option value="Administrador">Administrador</option>
							<option value="AdministradorBDKarate">Administrador de usuario</option>
						</select>
				</div>
			
				<button id="guardar" name="guardar" type="submit" class="btn btn-usuarioABM">Guardar</button>
				
			</form>
		</body>
	</html>		