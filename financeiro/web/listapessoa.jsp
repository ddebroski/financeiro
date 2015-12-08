<%@page import="modelo.Pessoa"%>
<%@page import="controle.PessoaDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Controle Financeiro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>       
        <a href="index.html" target="_parent">Voltar</a>
        <a href="inserirpessoa.jsp" target="_parent">Nova</a>
        <h1>Lista de cidades</h1>
        <%
            Connection conexao = Conexao.getConexao();
            ArrayList lista = PessoaDB.getListaPessoa(conexao);
            out.println("<table border=\"1\">");
            out.println("<tr>");
            out.println("<td>Código</td>");
            out.println("<td>Nome</td>");
            out.println("<td>Idade</td>");
            out.println("<td>E-mail</td>");
            out.println("<td>Opções</td>");
            out.println("</tr>");
            for (int i = 0; i < lista.size(); i++) {
                Pessoa pessoa = (Pessoa) lista.get(i);
                out.println("<tr>");
                out.println("<td>" + pessoa.getPes_codigo() + "</td>");
                out.println("<td>" + pessoa.getNome() + "</td>");
                out.println("<td>" + pessoa.getIdade() + "</td>");
                out.println("<td>" + pessoa.getEmail() + "</td>");
                out.println("<td>");
                out.println("<a href=\"excluirpessoa.jsp?id=" + pessoa.getPes_codigo() + "\">Excluir</a>");
                out.println("<a href=\"alterarpessoa.jsp?id=" + pessoa.getPes_codigo() + "\">Alterar</a>");
                out.println("</td>");
                out.println("<br/>");
            }
            out.println("</table>");
        %>

    </body>
</html>
