<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - TV Series</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
<style>
    body { background-color: #141414; color: #FFFFFF; }
    .card-dark { background-color: rgba(0,0,0,0.75); border: 1px solid #333; border-radius: 8px; }
    .form-control { background-color: #333 !important; border: none !important; color: #fff !important; }
    .form-control:focus { background-color: #454545 !important; box-shadow: 0 0 0 0.25rem rgba(229,9,20,0.25) !important; }
    .btn-netflix { background-color: #E50914; color: white; font-weight: bold; border: none; }
    .btn-netflix:hover { background-color: #B81D24; color: white; }
    .btn-outline-netflix { border: 1px solid #E50914; color: #E50914; }
    .btn-outline-netflix:hover { background-color: #E50914; color: white; }
    a { color: #AAA; text-decoration: none; }
    a:hover { color: #FFF; }
</style>
</head>
<body>
<div class="container py-4">
    <header class="d-flex justify-content-between align-items-center mb-5 border-bottom pb-3 border-secondary">
        <h1 class="text-danger fw-bold m-0" style="letter-spacing: 1px;">TV - SERIES</h1>
        <nav class="d-flex flex-wrap gap-2">
            <a href="/misCompras" class="btn btn-outline-netflix btn-sm">Mis compras</a>
            <a href="/dashboard" class="btn btn-outline-secondary btn-sm">Series</a>
            <a href="/nuevo" class="btn btn-netflix btn-sm">Agregar serie</a>
            <a href="/logout" class="btn btn-outline-danger btn-sm">Logout</a>
        </nav>
    </header>

    <h4 class="mb-4">¡Bienvenid@ ${usuarioEnSesion.nombre}!</h4>

    <form action="/buscar" method="GET" class="mb-4">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Buscar Serie" name="palabra">
            <button class="btn btn-outline-secondary" type="submit">Buscar</button>
        </div>
    </form>

    <div class="row g-4">
        <c:forEach items="${series}" var="serie">
            <div class="col-md-6">
                <div class="card-dark p-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="${serie.urlImagen}" class="img-fluid rounded-start h-100" style="object-fit: cover;" alt="serie">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><a href="/mostrar/${serie.id}" class="text-white">${serie.titulo}</a></h5>
                                <p class="card-text text-secondary mb-1">Año: ${serie.anio}</p>
                                <p class="card-text text-secondary">Precio: ${serie.precio}</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer bg-transparent border-0 text-end">
                        <c:if test="${serie.creador.id == usuarioEnSesion.id}">
                            <a href="/editar/${serie.id}" class="btn btn-sm btn-secondary"><i class="fa-solid fa-pen"></i></a>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>