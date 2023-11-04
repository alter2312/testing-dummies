<?php
	
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><?php echo $data["titulo"]; ?></title>
		<link rel="stylesheet" href="assets/css/styles-form-competidores-dojos.css">
		<script src="assets/js/bootstrap.min.js" ></script>
	</head>
<body>
    <div class="container">


        <form id="modificar" name="modificar"class="form-small" method="POST" action="index.php?c=dojo&a=actualizar&id='<?php echo $data["idDojo"];?>">
            <input type="hidden" name="idDojo" value="<?php echo $data["idDojo"]; ?>" />
            <h1><?php echo $data["titulo"]; ?></h1>

            <div class="form-group">
                <input type="text" class="input-form" pattern="[A-Za-zÁ-ú\s]{1,30}" required require name="nombre" value="<?php echo $data["dojos"]["nombre"]; ?>" />
                <label for="nombre" class="label-form">Dojo</label>
            </div>
            <div class="form-group">
                <input type="text" class="input-form" name="escuela" id="escuela" pattern="[A-Za-zÁ-ú\s]{1,30}" required require value="<?php echo $data["dojos"]["escuela"]; ?>" />
                <label for="escuela" class="label-form">Escuela</label>
            </div>

            <button type="submit" class="btn btn-dojo">Guardar</button>
        </form>
    </div>
</body>
</html>
