<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Editar Autor</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file = "../menubar.jsp" %>
        <div class="container">
            <h1>Editar Autor</h1>
            <form action="/autores/update" method="post">
                <input type="hidden" name="id" value="${autor.id}" />
                <div>
                    <label class="form-label">Nome</label>
                    <input type="text" name="nome" class="form-control" value="${autor.nome}" />
                </div>
                <hr />
                <a href="/autores/list" class="btn btn-secondary">Voltar</a>
                <button type="submit" class="btn btn-warning">Salvar</button>
            </form>
        </div>
    </body>
</html>

