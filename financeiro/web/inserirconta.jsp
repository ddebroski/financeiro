<%@page import="controle.ContaDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Cidade</title>
    </head>
    <body>
         <%
            String mensagem = "Informe os dados da conta!";
            if(request.getParameter("btnEnviar") != null){
                String descricao = request.getParameter("descricao");
                String data = request.getParameter("data");
                String valor = request.getParameter("valor");
                String tipo = request.getParameter("tipo");
                String situacao = request.getParameter("situacao");
                String pes_codigo = request.getParameter("pes_codigo");
                Conta conta = new conta(descricao, data, valor, tipo, situacao, pes_codigo);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = ContaDB.incluiConta(conta, conexao);
                if (incluiu){
                    mensagem = "Conta incluida com sucesso!";
                            }else{
                    mensagem = "Erro ao incluir a conta!";
                                  }
            }
            
            out.println(mensagem);
            out.println("<br/>");
        %>
        <h1>Inserir Nova Cidade</h1>
        <form name="fmrCidade" method="post">
            Descrição: <input type="text" name="descricao" maxlength="100" size="80"/>
            <br/>
            Data: <input type="text" name="estado" maxlength="2" size="3"/>
            <br/>
            Valor: <input type="text" name="estado" maxlength="2" size="3"/>
            <br/>
            <input type="submit" name="btnEnviar" value="Enviar"/>
        </form>
    </body>
</html>
