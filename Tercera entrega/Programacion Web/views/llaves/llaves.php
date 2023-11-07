<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Llave</title>
</head>
<body>
    <h1><?php echo $data["title"]?></h1>

    <main class="container">
      
      <div class="formulario">
            <h2>Crear llave</h2>
            <form method="post" action="index.php?c=llaves&a=crearLlave">
           <input type="text" name="categoria">
            <label for="categoria">Categoría</label>
            <input type="submit" value="Crear Llave">
    </form>
    </div>
    </main>
</body>
</html>
