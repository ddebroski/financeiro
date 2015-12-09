<%@page import="modelo.Conta"%>
<%@page import="controle.ContaDB"%>
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
            <li><a class="dropdown-toggle" href="listacidades.jsp">Cidade</a></li>
            <li><a class="dropdown-toggle"  href="listapessoa.jsp">Pessoa</a></li>
            <li class="active"><a class="dropdown-toggle"  href="listaconta.jsp">Contas</a></li>
        </ul>
        <a href="inserirconta.jsp" target="_parent">Nova</a>
        <br>
        Lista de contas
        <%
            Connection conexao = Conexao.getConexao();
            ArrayList lista = ContaDB.getListaContas(conexao);
            out.println("<table border=\"1\" class=\"table table-striped\">");
            out.println("<tr>");
            out.println("<td>Numero</td>");
            out.println("<td>Descrição</td>");
            out.println("<td>Data</td>");
            out.println("<td>Valor</td>");
            out.println("<td>Tipo</td>");
            out.println("<td>Situação</td>");
            out.println("<td>Opções</td>");
            out.println("</tr>");
            for (int i = 0; i < lista.size(); i++) {
                Conta conta = (Conta) lista.get(i);
                out.println("<tr>");
                out.println("<td>" + conta.getCnt_numero()+ "</td>");
                out.println("<td>" + conta.getDescricao()+ "</td>");
                out.println("<td>" + conta.getData()+ "</td>");
                out.println("<td> R$" + conta.getValor()+ "</td>");
                out.println("<td>" + conta.getTipo()+ "</td>");
                out.println("<td>" + conta.getSituacao()+ "</td>");
                out.println("<td>");
                out.println("<a href=\"excluircidade.jsp?id=" + conta.getCnt_numero()+ "\">Excluir</a>");
                out.println("<a href=\"alterarcidade.jsp?id=" + conta.getCnt_numero()+ "\">Alterar</a>");
                out.println("</td>");
                out.println("<br/>");
            }
            out.println("</table>");
        %>

    </body>
</html>
