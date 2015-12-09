<%@page import="modelo.Cidade"%>
<%@page import="controle.CidadeDB"%>
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
        <ul class="nav nav-pills">
            <li><a href="index.html">Home</a></li>
            <li class="active"><a class="dropdown-toggle" href="listacidades.jsp">Cidade</a></li>
            <li><a class="dropdown-toggle"  href="listapessoa.jsp">Pessoa</a></li>
            <li><a class="dropdown-toggle"  href="listaconta.jsp">Contas</a></li>
        </ul>
        <a href="inserircidade.jsp" target="_parent">Nova</a>
        <h1>Lista de cidades</h1>
        <%
            Connection conexao = Conexao.getConexao();
            ArrayList lista = CidadeDB.getListaCidades(conexao);
            out.println("<table border=\"1\" class=\"table table-striped\">");
            out.println("<tr>");
            out.println("<td>Código</td>");
            out.println("<td>Nome</td>");
            out.println("<td>Estado</td>");
            out.println("<td>Opções</td>");
            out.println("</tr>");
            for (int i = 0; i < lista.size(); i++) {
                Cidade cidade = (Cidade) lista.get(i);
                out.println("<tr>");
                out.println("<td>" + cidade.getCid_codigo() + "</td>");
                out.println("<td>" + cidade.getNome() + "</td>");
                out.println("<td>" + cidade.getEst_sigla() + "</td>");
                out.println("<td>");
                out.println("<a href=\"excluircidade.jsp?id=" + cidade.getCid_codigo() + "\">Excluir</a>");
                out.println("<a href=\"alterarcidade.jsp?id=" + cidade.getCid_codigo() + "\">Alterar</a>");
                out.println("</td>");
                out.println("<br/>");
            }
            out.println("</table>");
        %>

    </body>
</html>
