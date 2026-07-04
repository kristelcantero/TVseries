<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro - TV SERIES</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    /* Un pequeño toque personalizado como el estilo Netflix */
    body {
        background-color: #141414; /* El negro característico de Netflix */
        color: #FFFFFF;
    }
    .card-registro {
        background-color: rgba(0, 0, 0, 0.75); /* Fondo del formulario semi-transparente */
        border: 1px solid #333;
        border-radius: 8px;
        padding: 40px;
    }
    .form-control {
        background-color: #333 !important;
        border: none !important;
        color: #fff !important;
    }
    .form-control:focus {
        background-color: #454545 !important;
        box-shadow: 0 0 0 0.25rem rgba(229, 9, 20, 0.25) !important; /* Brillo rojo al enfocar */
    }
    .btn-netflix {
        background-color: #E50914; /* El rojo oficial o parecido Netflix */
        color: white;
        font-weight: bold;
    }
    .btn-netflix:hover {
        background-color: #B81D24;
        color: white;
    }
    a {
        color: #AAA;
        text-decoration: none;
    }
    a:hover {
        color: #FFF;
    }
</style>
</head>
<body>
	<div class="container mt-5">
		<!-- Encabezado con el nombre de la app en Rojo destacado -->
		<header class="d-flex justify-content-between align-items-center mb-5 border-bottom pb-3 border-secondary">
			<h1 class="text-danger fw-bold m-0" style="letter-spacing: 1px;">TV - SERIES</h1>
			<div>
				<a href="/login" class="me-3">Login</a>
				<a href="/" class="fw-bold text-white">Registro</a>
			</div>
		</header>

		<div class="row justify-content-center">
			<div class="col-md-6 card-registro shadow-lg">
				<h2 class="mb-4 text-center">Registro de Usuario</h2>
				
				<form:form action="/registro" method="POST" modelAttribute="nuevoUsuario">
					<div class="mb-3">
						<form:label path="nombre" class="form-label text-secondary">Nombre</form:label>
						<form:input path="nombre" class="form-control form-control-lg" />
						<form:errors path="nombre" class="text-danger small d-block mt-1" />
					</div>
					
					<div class="mb-3">
						<form:label path="apellido" class="form-label text-secondary">Apellido</form:label>
						<form:input path="apellido" class="form-control form-control-lg" />
						<form:errors path="apellido" class="text-danger small d-block mt-1" />
					</div>
					
					<div class="mb-3">
						<form:label path="email" class="form-label text-secondary">E-mail</form:label>
						<form:input path="email" class="form-control form-control-lg" />
						<form:errors path="email" class="text-danger small d-block mt-1" />
					</div>
					
					<div class="mb-3">
						<form:label path="password" class="form-label text-secondary">Contraseña</form:label>
						<form:password path="password" class="form-control form-control-lg" />
						<form:errors path="password" class="text-danger small d-block mt-1" />
					</div>
					
					<div class="mb-4">
						<form:label path="confirmarPassword" class="form-label text-secondary">Confirmar Contraseña</form:label>
						<form:password path="confirmarPassword" class="form-control form-control-lg" />
						<form:errors path="confirmarPassword" class="text-danger small d-block mt-1" />
					</div>
					
					<button type="submit" class="btn btn-netflix btn-lg w-100 mt-2">Registrarse</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
