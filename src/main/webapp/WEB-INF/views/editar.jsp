<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Serie - TV Series</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card-dark p-4 shadow-lg">
                <h4 class="mb-4">Editar serie</h4>
                <form:form action="/actualizar/${serie.id}" method="POST" modelAttribute="serie">
                    <input type="hidden" name="_method" value="PUT">
                    <div class="mb-3">
                        <form:label path="titulo" class="form-label text-secondary">Título</form:label>
                        <form:input path="titulo" class="form-control"/>
                        <form:errors path="titulo" class="text-danger small d-block mt-1"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="anio" class="form-label text-secondary">Año</form:label>
                        <form:input path="anio" class="form-control" type="number"/>
                        <form:errors path="anio" class="text-danger small d-block mt-1"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="descripcion" class="form-label text-secondary">Descripción</form:label>
                        <form:textarea path="descripcion" class="form-control" rows="4"/>
                        <form:errors path="descripcion" class="text-danger small d-block mt-1"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="urlImagen" class="form-label text-secondary">URL Imagen</form:label>
                        <form:input path="urlImagen" class="form-control"/>
                        <form:errors path="urlImagen" class="text-danger small d-block mt-1"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="cantidad" class="form-label text-secondary">Cantidad</form:label>
                        <form:input path="cantidad" class="form-control" type="number"/>
                        <form:errors path="cantidad" class="text-danger small d-block mt-1"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="precio" class="form-label text-secondary">Precio</form:label>
                        <form:input path="precio" class="form-control" type="number" step="0.01"/>
                        <form:errors path="precio" class="text-danger small d-block mt-1"/>
                    </div>
                    <button type="submit" class="btn btn-netflix mt-3">Guardar cambios</button>
                </form:form>

                <form action="/borrar/${serie.id}" method="POST" class="mt-3">
                    <input type="hidden" name="_method" value="DELETE">
                    <button type="submit" class="btn btn-outline-danger"
                            onclick="return confirm('¿Seguro que deseas eliminar esta serie?')">
                        Eliminar
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>