<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mis Compras</title>
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

    <h4 class="mb-4">Tus series compradas</h4>

    <c:choose>
        <c:when test="${empty compras}">
            <div class="card-dark p-4">
                <p class="mb-0">No has comprado ninguna serie aún.</p>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="compra" items="${compras}">
                <div class="card-dark mb-3 shadow-sm">
                    <div class="row g-0">
                        <div class="col-md-2">
                            <img src="${compra.serie.urlImagen}" class="img-fluid rounded-start h-100" style="height:140px; width:100%; object-fit:cover;">
                        </div>
                        <div class="col-md-10">
                            <div class="card-body">
                                <h5>${compra.serie.titulo}</h5>
                                <p class="mb-1 text-secondary">Año: ${compra.serie.anio}</p>
                                <p class="mb-2 text-secondary">Precio: CLP $<fmt:formatNumber value="${compra.serie.precio}" pattern="#,##0" /></p>
                                <c:if test="${compra.serie.usuario.id == usuarioEnSesion.id}">
                                    <a href="/editar/${compra.serie.id}" class="btn btn-sm btn-secondary">✏️</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>