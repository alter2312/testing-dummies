<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><?php echo $data["titulo"]; ?></title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<script src="assets/js/bootstrap.min.js" ></script>
	</head>
	
	<body>
		<div class="container">
			<h2><?php echo $data["titulo"]; ?></h2>
			
			<form id="nuevo" name="nuevo" method="POST" action="index.php?c=competidores&a=guarda" autocomplete="off">
				<div class="form-group">
					<label for="ci">ci</label>
					<input type="text" class="form-control" id="ci" name="ci" />
				</div>
				
				<div class="form-group">
					<label for="nombre">nombre</label>
					<input type="text" class="form-control" id="nombre" name="nombre" />
				</div>
				
				<div class="form-group">
					<label for="apellido">apellido</label>
					<input type="text" class="form-control" id="apellido" name="apellido" />
				</div>
				
				<div class="form-group">
					<label for="dojo">dojo</label>
					<input type="text" class="form-control" id="dojo" name="dojo" />
				</div>
				
				<div class="form-group">
					<label for="escuela">escuela</label>
					<input type="text" class="form-control" id="escuela" name="escuela" />
				</div>

				<div class="form-group">
					<label for="fnac">fnac</label>
					<input type="date" class="form-control" id="fnac" name="fnac" />
				</div>

	
				<div class="form-group">
					<label for="sexo">Sexo</label>
						<select name="sexo" class="form-control" id="sexo">
							<option value="Masculino">Hombre</option>
							<option value="Femenino">Mujer</option>
						</select>
				</div>
				
				<button id="guardar" name="guardar" type="submit" class="btn btn-primary">Guardar</button>
				
			</form>
		</div>
	</body>
</html>