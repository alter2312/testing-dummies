<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><?php echo $data["titulo"]; ?></title>
		<link rel="stylesheet" href="../../assets/css/styles-competidores-dojos.css">
		<script src="https://kit.fontawesome.com/cea33d77ef.js" crossorigin="anonymous"></script>

	</head>
	
	<body>
	<header class="header">
        <nav>
			<bottom class="toggle">
        		<i class="fa-solid fa-bars"></i>
      		</bottom>
            <ul class="nav_menu">
                <li> <a href="../../index.php?c=competidores&a=index" class="btn btn-primary">Competidores</a></li>
                <li> <a href="../../index.php?c=dojo&a=index" class="btn btn-primary">Dojo</a></li>
                <li> <a href="../../index.php?c=usuarios&a=index" class="btn btn-primary">Usuarios</a></li>

            </ul>
        </nav>
        <figure class="container_logo">
			<a href="../../index.php?c=usuarios&a=inicio">
            <img src="../../assets/img/logo.svg" class="logo"alt="Logo de la aplicacion web de Testing Dummmies">
			</a>	
		</figure>
    </header>


		<section class="container">
			<h1><?php echo $data["titulo"]; ?></h1>
			
			<a href="../../index.php?c=usuarios&a=nuevo" class="btn btn-primary"><span class="text">Agregar</span></a>
			
			
			<div class="table-responsive">
				<table class="table" cellspacing=0 cellpadding=5 >
					<thead>
						<tr class="table-primary">
							<th>Nombre</th>
							<th>Contraseña</th>
							<th>Grupo</th>
							<th>Editar</th>
							<th>Eliminar</th>
					<tbody>
						<?php foreach($data["usuarios"] as $dato) {
							echo "<tr>";
							echo "<td>".$dato["nombre"]."</td>";
							echo "<td>".$dato["contraseña"]."</td>";
							echo "<td>".$dato["grupoUsuario"]."</td>";
							echo "<td><a href='../../index.php?c=usuarios&a=modificar&id=".$dato["idUsuario"]."' class='btn'>
    						<span class='text'>Modificar</span>
  							</a></td>"
						
							;
							echo "<td><a href='../../index.php?c=usuarios&a=eliminar&id=".$dato["idUsuario"]."' class='btn'>
    						<span class='text'>Eliminar</span>
  							</a></td>";
							echo "</tr>";
						}
						?>
					</tbody>
					
				</table>
			</div>
		</section>
		<script src="assets/js/menu.js"></script>

	</body>
</html>