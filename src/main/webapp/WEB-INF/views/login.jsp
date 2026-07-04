<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - TV Series</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #141414; color: #FFFFFF; }
    .card-login { background-color: rgba(0,0,0,0.75); border: 1px solid #333; border-radius: 8px; padding: 40px; }
    .form-control { background-color: #333 !important; border: none !important; color: #fff !important; }
    .form-control:focus { background-color: #454545 !important; box-shadow: 0 0 0 0.25rem rgba(229,9,20,0.25) !important; }
    .btn-netflix { background-color: #E50914; color: white; font-weight: bold; }
    .btn-netflix:hover { background-color: #B81D24; color: white; }
    a { color: #AAA; text-decoration: none; }
    a:hover { color: #FFF; }
</style>
</head>
<body>
<div class="container mt-5">
    <header class="d-flex justify-content-between align-items-center mb-5 border-bottom pb-3 border-secondary">
        <h1 class="text-danger fw-bold m-0">TV - SERIES</h1>
        <div>
            <a href="/login" class="fw-bold text-white me-3">Login</a>
            <a href="/">Registro</a>
        </div>
    </header>

    <div class="row justify-content-center">
        <div class="col-md-6 card-login shadow-lg">
            <h2 class="mb-4 text-center">Login</h2>
            <form:form action="/login" method="POST" modelAttribute="loginUsuario">
                <div class="mb-3">
                    <form:label path="emailLogin" class="form-label text-secondary">E-mail</form:label>
                    <form:input path="emailLogin" class="form-control form-control-lg"/>
                    <form:errors path="emailLogin" class="text-danger small d-block mt-1"/>
                </div>
                <div class="mb-4">
                    <form:label path="passwordLogin" class="form-label text-secondary">Contraseña</form:label>
                    <form:password path="passwordLogin" class="form-control form-control-lg"/>
                    <form:errors path="passwordLogin" class="text-danger small d-block mt-1"/>
                </div>
                <button type="submit" class="btn btn-netflix btn-lg w-100 mt-2">Login</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>