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
		<div class="container">
			
			<form class="form-dojo" id="nuevo" name="nuevo" method="POST" action="index.php?c=dojo&a=guarda" autocomplete="off">
			<h1><?php echo $data["titulo"]; ?></h1>

            <div class="form-group">
			<input type="text" class="input-form input-dojo" pattern="[A-Za-zÁ-ú0-9\s]{1,30}" required require name="nombre" id="nombre" />	
						<label for="nombre" class="label-form">Dojo</label>
				</div>
                <div class="form-group">
				<input type="text" class="input-form input-dojo" pattern="[A-Za-zÁ-ú\s]{1,30}" required require name="escuela" id="escuela" />    
				<label for="escuela" class="label-form">Escuela</label>
				</div>
                
				<button id="guardar" name="guardar" type="submit" class="btn btn-dojo">Guardar</button>
				
			</form>
		</div>
	</body>
</html>