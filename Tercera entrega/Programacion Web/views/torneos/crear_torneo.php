<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../../../assets/css/formularios.css">
    <title></title>
</head>
<body>
   

<main class="container">
<h1 class>Crear <span>torneo</span></h1>

    <form action="../../index.php?c=torneo&a=CrearTorneo" method="post">
    <div class="box-form">

    <div class="form-group">
            <input type="text" class="input-form" name="ubicacion">
            <label for="ubicacion" class="label-form">Ubicación</label>
        </div>

        <div class="form-group">
            <label for="fecha" class="label-form label">Fecha</label>
            <input type="date" class="input-form" name="fecha">
        </div>
</div>
<div class="box-form box-form-right">

        <div class="form-group">
            <label for="hora" class="label-form label">hora</label>
            <input type="time" class="input-form" name="hora">
        </div>

        

        <div class="form-group">
		    <label for="genero" class="label-form label">genero</label>
    		<select name="genero" class="input-form" id="genero"> 
                 <option value="Femenino">Femenino</option>
			    <option value="Masculino">Masculino</option>
			</select>
		</div>		
        <div class="form-group">
		    <label for="tipo" class="label-form label">Tipo de torneo</label>
    		<select name="tipo" class="input-form" id="tipo"> 
                 <option value="Individual">Individual</option>
			    <option value="Grupal">Grupal</option>
			</select>
		</div>
</div>
        <div class="container-btn">
            <button id="guardar" name="guardar" type="submit" class="btn btn-competidor">Guardar
            <span class="bar"></span>

            </button>

        </div>
    </form>
    </main>
</body>
</html>