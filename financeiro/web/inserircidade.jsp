<%@page import="controle.CidadeDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Cidade"%>
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
        <%
            String mensagem = "Informe os dados para nova cidade!";
            if (request.getParameter("btnEnviar") != null) {
                int codigo = Integer.valueOf(request.getParameter("codigo"));
                String nome = request.getParameter("nome");
                String estado = request.getParameter("estado");
                Cidade cidade = new Cidade(codigo, nome, estado);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = CidadeDB.incluiCidade(cidade, conexao);
                if (incluiu) {
                    mensagem = "Cidade incluida com sucesso!";
                } else {
                    mensagem = "Erro ao incluir a cidade!";
                }
            }

            out.println(mensagem);
            out.println("<br/>");
        %>
        <a href="listacidades.jsp" target="_parent">Voltar</a>
        <h1>Inserir Nova Cidade</h1>
        <form name="fmrCidade" method="post">
            Código: <input type="text" name="codigo" maxlength="10" size="8"/>
            <br/>
            Nome: <input type="text" name="nome" maxlength="100" size="80"/>
            <br/>
            Estado: <input type="text" name="estado" maxlength="2" size="3"/>
            <br/>
            <input type="submit" name="btnEnviar" value="Enviar"/>
        </form>
    </body>
</html>
