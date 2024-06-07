<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Remover Livro</title>
    </head>
    <body>
        <%@ include file = "../menubar.jsp" %>
        <h1>Remover Livro</h1>
        <p>
            Tem certeza que deseja excluir o livro ${livro.getTitulo()} ?
        </p>
        <form action="/livros/delete" method="post">
            <input type="hidden" name="id" value="${livro.getId()}" />
            <a href="/livro/list">Voltar</a>
            <button type="submit">Excluir</button>
        </form>
    </body>
</html>

