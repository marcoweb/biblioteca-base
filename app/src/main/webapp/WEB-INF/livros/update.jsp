<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Editar Livro</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file = "../menubar.jsp" %>
        <div class="container">
            <h1>Editar Livro</h1>
            <form action="/livros/update" method="post">
                <input type="hidden" name="id" value="${livro.getId()}" />
                <div>
                    <label class="form-label">Título</label>
                    <input type="text" name="titulo" value="${livro.getTitulo()}" class="form-control" />
                </div>
                <div>
                    <label class="form-label">Gênero</label>
                    <select name="genero" class="form-select">
                        <c:forEach var="g" items="${generos}">
                            <option ${livro.genero.id == g.id ? "selected" : ""} value="${g.id}">${g.nome}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label class="form-label">Autor(s)</label>
                    <c:forEach var="a" items="${autores}">
                        <div class="form-check">
                            <input ${livro.autores.contains(a) ? "checked" : ""} type="checkbox" class="form-check-input" value="${a.id}" name="autores">
                            <label class="form-check-label">${a.nome}</label>
                        </div>
                    </c:forEach>
                </div>
                <button type="submit" class="btn btn-success">Salvar</button>
            </form>
        </div>
    </body>
</html>

