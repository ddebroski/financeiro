<%-- 
    Document   : listacidades
    Created on : 19/08/2015, 19:38:11
    Author     : djonata
--%>

<%@page import="modelo.Cidade"%>
<%@page import="controle.CidadeDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Cidades</title>
    </head>
    <body>       
        <a href="index.html" target="_parent">Voltar</a>
        <a href="inserircidade.jsp" target="_parent">Nova</a>
        <h1>Lista de cidades</h1>
        <%
        Connection conexao = Conexao.getConexao();
        ArrayList lista = CidadeDB.getListaCidades(conexao);
        out.println("<table border=\"1\">");
        out.println("<tr>");
        out.println("<td>Código</td>");
        out.println("<td>Nome</td>");
        out.println("<td>Estado</td>");
        out.println("<td>Opções</td>");
        out.println("</tr>");
        for(int i = 0; i < lista.size(); i++){
            Cidade cidade = (Cidade)lista.get(i);
            out.println("<tr>");
            out.println("<td>"+cidade.getCid_codigo()+"</td>");
            out.println("<td>"+cidade.getNome()+"</td>");
            out.println("<td>"+cidade.getEst_sigla()+"</td>");
            out.println("<td>");
            out.println("<a href=\"excluircidade.jsp?id="+cidade.getCid_codigo()+"\">Excluir</a>");
            out.println("<a href=\"alterarcidade.jsp?id="+cidade.getCid_codigo()+"\">Alterar</a>");
            out.println("</td>");
            out.println("<br/>");
        }
        out.println("</table>");
        %>
            
    </body>
</html>
