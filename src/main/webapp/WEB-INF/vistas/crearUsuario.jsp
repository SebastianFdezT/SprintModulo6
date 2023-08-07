<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/modulo6/res/css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>Crear Usuario</title>
 <style>
.prueba {
    background-image: url("/modulo6/res/img/imagen3.png");
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
</head>
<body class="prueba">
    <%@ include file='navbar.jsp'%>
    <img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png" alt="Logo de la empresa">


    <div class=contacto style="display: flex; justify-content: center;">

        <form action="/modulo6/CrearUsuario" method="post" onsubmit="return enviarFormulario(event)">
            <h1 class=tituloContacto>Formulario de Creacion de Usuario</h1>
            <label for="tipo">Selecciona un Tipo:</label> 
            <select id="tipo" name="tipo" onchange="mostrarCamposAdicionales()">
                <option value="Seleccione">Seleccione</option>
                <option value="Cliente">Cliente</option>
                <option value="Profesional">Profesional</option>
                <option value="Administrativo">Administrativo</option>
            </select> 
            <br>
            <br>
            <!--Datos en comun para todos los tipos de Usuario-->
            <label for="nombre">Ingrese el nombre de usuario:</label><br>
            <input type="text" id="nombre" name="nombre" title="Campo Obligatorio"><br><br>
            <span id="nombreValidationMessage" style="color: red;"></span> <br> 
            <label for="fechaNacimiento">Ingrese fecha de nacimiento:</label><br> 
            <input type="text" id="fechaNacimiento" name="fechaNacimiento" title="Formato DD/MM/AAAA" ><br><br>
            <span id="fechaNacimientoValidationMessage" style="color: red;"></span> <br> 
            <label for="run">Ingrese run:</label><br>
            <input type="text" id="run" name="run" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br><br>
            <span id="runValidationMessage" style="color: red;"></span> <br> 

			<!-- Datos correspondientes al usuario de tipo Cliente -->
            <div id="camposCliente" style="display: none;">
                <label for="rut">RUT:</label><br>
                <input type="text" id="rut" name="rut" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br><br>
                <span id="rutValidationMessage" style="color: red;"></span> <br>
                <label for="nombres">Nombres:</label><br>
                <input type="text" id="nombres" name="nombres" title="Campo Obligatorio"><br><br>
                <span id="nombresValidationMessage" style="color: red;"></span> <br>
                <label for="apellidos">Apellidos:</label><br>
                <input type="text" id="apellidos" name="apellidos" title="Campo Obligatorio"><br><br>
                <span id="apellidosValidationMessage" style="color: red;"></span> <br>
                <label for="telefono">Teléfono:</label><br>
                <input type="number" id="telefono" name="telefono" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br><br>
                <span id="telefonoValidationMessage" style="color: red;"></span> <br>
                <label for="afp">AFP:</label><br>
                <input type="text" id="afp" name="afp" title="Campo Obligatorio"><br><br>
                <span id="afpValidationMessage" style="color: red;"></span> <br>
                <label for="sistemaDeSalud">Sistema de salud:</label><br>
                <select id="sistemaDeSalud" name="sistemaDeSalud">
                    <option value="1">Fonasa</option>
                    <option value="2">Isapre</option>
                </select>
                <br>
                <br>
                <label for="direccion">Dirección:</label><br>
                <input type="text" id="direccion" name="direccion" title="Campo Obligatorio"><br><br>
                <span id="direccionValidationMessage" style="color: red;"></span> <br>
                <label for="comuna">Comuna:</label><br>
                <input type="text" id="comuna" name="comuna" title="Campo Obligatorio"><br><br>
				<span id="comunaValidationMessage" style="color: red;"></span> <br>
                <label for="edad">Edad:</label><br>
                <input type="text" id="edad" name="edad" title="Campo Obligatorio / Debe Introducir un Valor Númerico."><br><br>
                <span id="edadValidationMessage" style="color: red;"></span> <br>
            </div>
			<!--  Datos correspondientes al usuario de tipo Profesional-->
            <div id="camposProfesional" style="display: none;">
                <label for="titulo">Título:</label><br>
                <input type="text" id="titulo" name="titulo" title="Campo Obligatorio"><br><br>
                <span id="tituloValidationMessage" style="color: red;"></span> <br>
                <label for="fechaDeIngreso">Fecha de ingreso:</label><br>
                <input type="text" id="fechaDeIngreso" name="fechaDeIngreso" title="/ En Formato DD/MM/AAAA" ><br><br>
                <span id="fechaDeIngresoValidationMessage" style="color: red;"></span> <br>
            </div>

            <div id="camposAdministrativo" style="display: none;">
                <label for="area">Área:</label><br>
                <input type="text" id="area" name="area" title="Campo Obligatorio"><br><br>
                <span id="areaValidationMessage" style="color: red;"></span> <br>
                <label for="experienciaPrevia">Experiencia previa:</label><br>
                <input type="text" id="experienciaPrevia" name="experienciaPrevia" title="Campo Obligatorio"><br><br>
            	<span id="experienciaPreviaValidationMessage" style="color: red;"></span> <br>
            </div>
			
			
            <div style="display: flex; justify-content: center;">
                <input type="submit" value="Enviar" class="boton-enviar">
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    //Validaciones
    //Validar Campo nombre
var nombreInput = document.getElementById('nombre');
var nombreValidationMessage = document.getElementById('nombreValidationMessage');

nombreInput.addEventListener('input', function() {
  var nombreValue = nombreInput.value.trim();
  
  if (nombreValue === '') {
    nombreValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
  } else {
    nombreValidationMessage.textContent = '';
  }
});
//Validar Campo fecha de nacimiento
var fechaNacimientoInput = document.getElementById('fechaNacimiento');
var fechaNacimientoValidationMessage = document.getElementById('fechaNacimientoValidationMessage');

fechaNacimientoInput.addEventListener('input', function() {
  var fechaNacimientoValue = fechaNacimientoInput.value.trim();
  
  if (fechaNacimientoValue === '') {
    fechaNacimientoValidationMessage.textContent = 'Por favor, introduzca la fecha de nacimiento. Campo Obligatorio';
  } else if (!isValidDateFormat(fechaNacimientoValue)) {
    fechaNacimientoValidationMessage.textContent = 'El formato de fecha debe ser dd/mm/aaaa';
  } else {
    fechaNacimientoValidationMessage.textContent = '';
  }
});

function isValidDateFormat(dateString) {
  // Validar el formato de fecha dd/mm/aaaa usando una expresión regular
  var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
  return datePattern.test(dateString);
}
//Validar Campo Run
var runInput = document.getElementById('run');
var runValidationMessage = document.getElementById('runValidationMessage');

runInput.addEventListener('input', function() {
  var runValue = runInput.value.trim();
  
  if (runValue === '') {
    runValidationMessage.textContent = 'Por favor, introduzca el Rut sin puntos ni guion';
  } else if (!/^[0-9]+$/.test(runValue)) {
    runValidationMessage.textContent = 'Por favor, introduzca un Rut válido. Solo se permiten dígitos numéricos.';
  } else if (parseInt(runValue, 10) > 99999999) {
    runValidationMessage.textContent = 'Por favor, introduzca un Rut válido. El número no puede ser mayor a 99.999.999.';
  } else {
    runValidationMessage.textContent = '';
  }
});


//Validar datos del usurio tipo cliente
//Validar Campo Rut
var rutInput = document.getElementById('rut');
var rutValidationMessage = document.getElementById('rutValidationMessage');

rutInput.addEventListener('input', function() {
  var rutValue = rutInput.value.trim();

  if (rutValue === '') {
    rutValidationMessage.textContent = 'Por favor, introduzca el Rut. Campo Obligatorio';
  } else if (!/^[0-9]+$/.test(rutValue)) {
    rutValidationMessage.textContent = 'Por favor, introduzca un Rut válido. Solo se permiten dígitos numéricos.';
  } else if (parseInt(rutValue, 10) > 99999999) {
    rutValidationMessage.textContent = 'Por favor, introduzca un Rut válido. El número no puede ser mayor a 99.999.999.';
  } else {
    rutValidationMessage.textContent = '';
  }
});

  
//Validar Campo nombres
  var nombresInput = document.getElementById('nombres');
  var nombresValidationMessage = document.getElementById('nombresValidationMessage');

  nombresInput.addEventListener('input', function() {
    var nombresValue = nombresInput.value.trim();

    if (nombresValue === '') {
      nombresValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
    } else {
      nombresValidationMessage.textContent = '';
    }
  });

  // Validar Campo apellidos
  var apellidosInput = document.getElementById('apellidos');
  var apellidosValidationMessage = document.getElementById('apellidosValidationMessage');

  apellidosInput.addEventListener('input', function() {
    var apellidosValue = apellidosInput.value.trim();

    if (apellidosValue === '') {
      apellidosValidationMessage.textContent = 'Por favor, introduzca apellidos. Campo Obligatorio';
    } else {
      apellidosValidationMessage.textContent = '';
    }
  });

//Validar Campo telefono
  var telefonoInput = document.getElementById('telefono');
  var telefonoValidationMessage = document.getElementById('telefonoValidationMessage');

  telefonoInput.addEventListener('input', function() {
    var telefonoValue = telefonoInput.value.trim();
    
    if (telefonoValue === '') {
      telefonoValidationMessage.textContent = 'Por favor, introduzca un número de teléfono. Campo Obligatorio';
    } else if (!isValidPhoneNumber(telefonoValue)) {
      telefonoValidationMessage.textContent = 'Por favor, introduzca un número de teléfono válido';
    } else {
      telefonoValidationMessage.textContent = '';
    }
  });
  

  function isValidPhoneNumber(phoneNumber) {
    // Validar que el número de teléfono contenga solo dígitos numéricos
    var numberPattern = /^\d+$/;
    return numberPattern.test(phoneNumber);
  }

  //Validar Campo afp
  var afpInput = document.getElementById('afp');
  var afpValidationMessage = document.getElementById('afpValidationMessage');

  afpInput.addEventListener('input', function() {
    var afpValue = afpInput.value.trim();
    
    if (afpValue === '') {
      afpValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
    } else {
      afpValidationMessage.textContent = '';
    }
  });
  //Validar Campo direccion
  var direccionInput = document.getElementById('direccion');
  var direccionValidationMessage = document.getElementById('direccionValidationMessage');

  direccionInput.addEventListener('input', function() {
    var direccionValue = direccionInput.value.trim();
    
    if (direccionValue === '') {
      direccionValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
    } else {
      direccionValidationMessage.textContent = '';
    }
  });
  
//Validar Campo comuna
  var comunaInput = document.getElementById('comuna');
  var comunaValidationMessage = document.getElementById('comunaValidationMessage');

  comunaInput.addEventListener('input', function() {
    var comunaValue = comunaInput.value.trim();
    
    if (comunaValue === '') {
      comunaValidationMessage.textContent = 'Por favor, introduzca la comuna. Campo Obligatorio';
    } else {
      comunaValidationMessage.textContent = '';
    }
  });

  
  var edadInput = document.getElementById('edad');
  var edadValidationMessage = document.getElementById('edadValidationMessage');

  edadInput.addEventListener('input', function() {
    var edadValue = edadInput.value.trim();
    
    if (edadValue === '') {
      edadValidationMessage.textContent = 'Por favor, introduzca una edad. Campo Obligatorio';
    } else if (!isValidAge(edadValue)) {
      edadValidationMessage.textContent = 'Por favor, introduzca una edad válida';
    } else {
      edadValidationMessage.textContent = '';
    }
  });

  function isValidAge(age) {
    // Validar que la edad contenga solo dígitos numéricos
    var numberPattern = /^\d+$/;
    return numberPattern.test(age);
  }

//Validar datos del usurio tipo profesional

  //Validar Campo titulo
var tituloInput = document.getElementById('titulo');
var tituloValidationMessage = document.getElementById('tituloValidationMessage');

tituloInput.addEventListener('input', function() {
  var tituloValue = tituloInput.value.trim();
  
  if (tituloValue === '') {
    tituloValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
  } else {
    tituloValidationMessage.textContent = '';
  }
});
var fechaDeIngresoInput = document.getElementById('fechaIngreso');
var fechaDeIngresoValidationMessage = document.getElementById('fechaIngresoValidationMessage');

fechaDeIngresoInput.addEventListener('input', function() {
  var fechaDeIngresoValue = fechaDeIngresoInput.value.trim();
  
  if (fechaDeIngresoValue === '') {
    fechaDeIngresoValidationMessage.textContent = 'Por favor, introduzca una fecha de ingreso. Campo Obligatorio';
  } else if (!isValidDateFormat(fechaDeIngresoValue)) {
    fechaDeIngresoValidationMessage.textContent = 'El formato de fecha debe ser DD/MM/AAAA';
  } else if (!isValidNumericFormat(fechaDeIngresoValue)) {
    fechaDeIngresoValidationMessage.textContent = 'La fecha de ingreso debe contener solo valores numéricos';
  } else {
    fechaDeIngresoValidationMessage.textContent = '';
  }
});

function isValidDateFormat(dateString) {
  // Validar el formato de fecha DD/MM/AAAA usando una expresión regular
  var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
  return datePattern.test(dateString);
}

function isValidNumericFormat(dateString) {
  // Validar que la fecha de ingreso contenga solo dígitos numéricos
  var numberPattern = /^\d+$/;
  return numberPattern.test(dateString.replace(/\//g, ''));
}

//Validar datos del usuario de tipo administrativo
  var areaInput = document.getElementById('area');
var areaValidationMessage = document.getElementById('areaValidationMessage');

areaInput.addEventListener('input', function() {
  var areaValue = areaInput.value.trim();
  
  if (areaValue === '') {
    areaValidationMessage.textContent = 'Por favor, introduzca el área. Campo Obligatorio';
  } else {
    areaValidationMessage.textContent = '';
  }
});

var experienciaPreviaInput = document.getElementById('experiencia');
var experienciaPreviaValidationMessage = document.getElementById('experienciaValidationMessage');

experienciaPreviaInput.addEventListener('input', function() {
  var experienciaPreviaValue = experienciaInput.value.trim();
  
  if (experienciaPreviaValue === '') {
    experienciaPreviaValidationMessage.textContent = 'Por favor, introduzca la experiencia. Campo Obligatorio';
  } else {
    experienciaPreviaValidationMessage.textContent = '';
  }
});
        
        function mostrarCamposAdicionales() {
            var tipoSeleccionado = document.getElementById("tipo").value;
            var camposCliente = document.getElementById("camposCliente");
            var camposProfesional = document.getElementById("camposProfesional");
            var camposAdministrativo = document.getElementById("camposAdministrativo");

            camposCliente.style.display = "none";
            camposProfesional.style.display = "none";
            camposAdministrativo.style.display = "none";

            if (tipoSeleccionado === "Cliente") {
                camposCliente.style.display = "block";
            } else if (tipoSeleccionado === "Profesional") {
                camposProfesional.style.display = "block";
            } else if (tipoSeleccionado === "Administrativo") {
                camposAdministrativo.style.display = "block";
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <%@ include file='footer.jsp'%>
</body>
</html>