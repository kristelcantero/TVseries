<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${serie.titulo}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #141414; color: #FFFFFF; }
    .card-dark { background-color: rgba(0,0,0,0.75); border: 1px solid #333; border-radius: 8px; }
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
    <header class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3 border-secondary">
        <h1 class="text-danger fw-bold m-0">TV - SERIES</h1>
        <nav class="d-flex flex-wrap gap-2">
            <a href="/misCompras" class="btn btn-outline-netflix btn-sm">Mis compras</a>
            <a href="/dashboard" class="btn btn-outline-secondary btn-sm">Series</a>
            <a href="/nuevo" class="btn btn-netflix btn-sm">Agregar serie</a>
            <a href="/logout" class="btn btn-outline-danger btn-sm">Logout</a>
        </nav>
    </header>

    <div class="row g-4">
        <div class="col-lg-4">
            <div class="card-dark p-3 shadow-lg">
                <img src="${serie.urlImagen}" class="img-fluid rounded w-100" style="height: 320px; object-fit: cover;">
            </div>
        </div>
        <div class="col-lg-8">
            <div class="card-dark p-4 shadow-lg">
                <h3 class="mb-3">${serie.titulo}</h3>
                <p><b>Usuario que publicó esta serie:</b> ${serie.usuario.nombre} ${serie.usuario.apellido}</p>
                <p><b>Descripción:</b> ${serie.descripcion}</p>
                <p><b>Año:</b> ${serie.anio}</p>
                <p><b>Precio:</b> CLP $<fmt:formatNumber value="${serie.precio}" pattern="#,##0" /></p>
                <p><b>Cantidad en inventario:</b> ${serie.cantidad}</p>

                <c:choose>
                    <c:when test="${serie.cantidad == 0}">
                        <button class="btn btn-secondary" disabled>Agotado</button>
                    </c:when>
                    <c:otherwise>
                        <form action="/comprar/${serie.id}" method="post" class="d-inline-block mt-2">
                            <button type="submit" class="btn btn-netflix">Comprar</button>
                        </form>
                    </c:otherwise>
                </c:choose>

                <c:if test="${serie.usuario.id == usuarioEnSesion.id}">
                    <a href="/editar/${serie.id}" class="btn btn-warning mt-2">Editar</a>
                    <form action="/borrar/${serie.id}" method="post" class="d-inline">
                        <input type="hidden" name="_method" value="DELETE">
                        <button type="submit" class="btn btn-danger mt-2"
                                onclick="return confirm('¿Seguro que deseas eliminar esta serie?')">
                            Eliminar
                        </button>
                    </form>
                </c:if>

                <div class="mt-4">
                    <h5>Usuarios que han comprado esta serie:</h5>
                    <c:choose>
                        <c:when test="${empty serie.compras}">
                            <p class="text-secondary">Nadie ha comprado esta serie aún.</p>
                        </c:when>
                        <c:otherwise>
                            <ul class="text-secondary">
                                <c:forEach var="compra" items="${serie.compras}">
                                    <li>${compra.usuario.nombre} ${compra.usuario.apellido}</li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>