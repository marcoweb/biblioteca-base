<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Autores</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file = "../menubar.jsp" %>
        <div class="container">
            <h1>Autores</h1>
            <a href="/autores/insert" class="btn btn-primary">Novo Autor</a>
            <table class="table">
                <tr>    
                    <th>Id</th>
                    <th>Nome</th>
                    <th>&nbsp;</th>
                </tr>
                <c:forEach var="a" items="${autores}">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.nome}</td>
                        <td>
                            <a href="/autores/update/${a.id}" class="btn btn-secondary">Editar</a> | 
                            <a href="/autores/delete/${a.id}" class="btn btn-danger">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

