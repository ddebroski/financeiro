<%-- 
    Document   : exluircidade
    Created on : 19/08/2015, 21:08:33
    Author     : djonata
--%>

<%@page import="controle.CidadeDB"%>
<%@page import="modelo.Cidade"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Cidade</title>
    </head>
    <body>
        <%
            String mensagem = "";
            Connection conexao = Conexao.getConexao();
            Cidade cidade = null;
            if(request.getParameter("btnexclui") !=null){
             int codigo = Integer.valueOf(request.getParameter("codigo"));             
             boolean excluiu = CidadeDB.excluiCidade(codigo, conexao);
             if(excluiu){
                 mensagem = "Cidade excluida com sucelsso!";
             }else{
                 
                 mensagem = "Não foi possivel excluir a cidade!";
             }
            }
            out.println(mensagem);
            out.println("<br/>");
            
            String id = request.getParameter("id");
            int codigo = Integer.valueOf(id);
            cidade = CidadeDB.getCidade(codigo, conexao);            
            if(cidade != null){
                out.println("Deseja excluir a cidade " + cidade.getNome() + "?");
                out.println("<br />");
            }
        %>
        <a href="listacidades.jsp" target="_parent">Voltar</a>
        <h1>Exclusão da Cidade</h1>        
        <form name="exclui" method="post">
            <input type="hidden" name="codigo" value="<%= id %>"/>
            <input type="submit" name="btnexclui" value="Excluir"/>
        </form>
    </body>
</html>
