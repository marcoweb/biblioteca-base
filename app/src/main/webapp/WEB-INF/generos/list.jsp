<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Gêneros</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file = "../_template/menubar.jsp" %>
        <div class="container">
            <h1>Gêneros</h1>
            <a href="/generos/insert" class="btn btn-primary">Novo Gênero</a>
            <table class="table">
                <tr>    
                    <th>Id</th>
                    <th>Nome</th>
                    <th>&nbsp;</th>
                </tr>
                <c:forEach var="g" items="${generos}">
                    <tr>
                        <td>${g.id}</td>
                        <td>${g.nome}</td>
                        <td>
                            <a href="/generos/update/${g.id}" class="btn btn-secondary">Editar</a> | 
                            <a href="/generos/delete/${g.id}" class="btn btn-danger">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

