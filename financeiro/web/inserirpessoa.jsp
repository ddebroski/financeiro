<%@page import="controle.PessoaDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Cidade</title>
    </head>
    <body>
         <%
            String mensagem = "Informe os dados para uma nova Pessoa!";
            if(request.getParameter("btnEnviar") != null){
                int codigo = Integer.valueOf(request.getParameter("pes_codigo"));
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                Pessoa pessoa = new Pessoa(codigo, nome,email,idade);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = PessoaDB.incluiPessoa(pessoa, conexao);
                if (incluiu){
                    mensagem = "Pessoa incluida com sucesso!";
                            }else{
                    mensagem = "Erro ao incluir a Pessoa!";
                                  }
            }
            out.println(mensagem);
            out.println("<br/>");
        %>
        <a href="listapessoa.jsp" target="_parent">Voltar</a>
        <h1>Inserir Nova Cidade</h1>
        <form name="fmrPessoa" method="post">
            Código: <input type="text" name="codigo" maxlength="10" size="8"/>
            <br/>
            Nome: <input type="text" name="nome" maxlength="100" size="80"/>
            <br/>
            Estado: <input type="text" name="email" maxlength="2" size="3"/>
            <br/>
            <input type="submit" name="btnEnviar" value="Enviar"/>
        </form>
    </body>
</html>
