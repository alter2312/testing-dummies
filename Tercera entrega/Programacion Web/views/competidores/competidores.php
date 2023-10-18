<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><?php echo $data["titulo"]; ?></title>

			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
   		<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.bootstrap5.min.css">
		<script src="https://kit.fontawesome.com/cea33d77ef.js" crossorigin="anonymous"></script>
		 <link rel="stylesheet" href="../../assets/css/styles-competidores-dojos.css"> -->

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
			<a href="index.php?c=usuarios&a=inicio">
            <img src="assets/img/logo.svg" class="logo"alt="Logo de la aplicacion web de Testing Dummmies">
			</a>	
		</figure>
    </header>
		<main class="" style="width:100%">
			<h1><?php echo $data["titulo"]; ?></h1>
			
			<a href="index.php?c=competidores&a=nuevo" class=" btn-primary"><span class="text">Agregar</span></a>
			
			
			<div class="table-responsive">
				<table class="table table-striped nowrap"id="example" cellspacing=0 cellpadding=5 style="">
					<thead>
						<tr class="table-primary">
							<th>CI</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Fecha de nacimiento</th>
							<th>Genero</th>
							<th>Editar</th>
							<th>Eliminar</th>
				
					
					<tbody>
						<?php foreach($data["competidores"] as $dato) {
							echo "<tr>";
							echo "<td>".$dato["CI"]."</td>";
							echo "<td>".$dato["nombre"]."</td>";
							echo "<td>".$dato["apellido"]."</td>";
							echo "<td>".$dato["fecha_nac"]."</td>";
							echo "<td>".$dato["genero"]."</td>";
							echo "<td><a href='index.php?c=competidores&a=eliminar&id=".$dato["idcompetidor"]."' class='btn'>
    						<span class='text'>Eliminar</span>
  							</a></td>";
							echo "<td><a href='index.php?c=competidores&a=modificar&id=".$dato["idcompetidor"]."' class='btn'>
    						<span class='text'>Modificar</span>
  							</a></td>";
						
							echo "</tr>";
						}
						?>
					</tbody>
					
				</table>
			</div>
		</main>
	<script src="assets/js/menu.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>
    <script>
        new DataTable('#example', {
            responsive: true
        });
    </script>
	</body>
</html>