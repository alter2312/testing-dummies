<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><?php echo $data["titulo"]; ?></title>
		<link rel="stylesheet" href="assets/css/styles-form-competidores-dojos.css">
		<script src="assets/js/bootstrap.min.js" ></script>
	</head>
	
	<body>
		<section class="container">
			<h1><?php echo $data["titulo"]; ?></h1>
			
			<form id="nuevo" name="nuevo" method="POST" action="index.php?c=competidores&a=guarda" autocomplete="off">
				<div class="box-form">

					<div class="form-group">
				<input type="text" class="input-form" id="CI" name="CI" pattern="[0-9]{8}" title="Tu cedula deben ser los 8 digitos sin la barra" required />		
				<label for="CI" class="label-form">CI</label>
					</div>
				
					<div class="form-group">
					<input type="text" class="input-form" id="nombre" name="nombre" pattern="[A-Za-zÁ-ú\s]{1,30}" required />
					<label for="nombre" class="label-form">Nombre</label>
					</div>
				
					<div class="form-group">
					<input type="text" class="input-form" id="apellido" name="apellido" pattern="[A-Za-zÁ-ú\s]{1,30}" required />
					<label for="apellido" class="label-form">Apellido</label>
					</div>
				</div>

				<div class="box-form">
				
					<div class="form-group">
						<label for="fecha_nac" class="label-form label">Fecha de nacimiento</label>
						<input type="date" class="input-form" id="fecha_nac" name="fecha_nac" />
					</div>

	
					<div class="form-group">
						<label for="genero" class="label-form label">Género</label>
							<select name="genero" class="input-form" id="genero">
								<option value="Masculino">Masculino</option>
								<option value="Femenino">Femenino</option>
							</select>
					</div>
				
				</div>
				
				<button id="guardar" name="guardar" type="submit" class="btn btn-primary btn-competidor">Guardar</button>
				
			</form>
		</section>
	</body>
</html>