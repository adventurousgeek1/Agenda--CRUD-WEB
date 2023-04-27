
<%@page import="Model.Agenda"%>
<%@page import="DAO.AgendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Contato</title>
    </head>
    <body>
        <h1>Cadastro de Contato</h1>
        <form action="cadastrarContato.jsp" method="post">
            <p>
            <label>Nome: </label>
            <input type="text" name="nome">
            </p>
            <p>
            <label>DDD: </label>
            <input type="text" name="ddd">
            </p>
            <p>
            <label>Número: </label>
            <input type="text" name="numero">
            </p>
        </form>
         <a href="index.jsp">
        <button type="button"></button>
        <a href="index.jsp">
        <button type="button">Listar Contatos</button>
    </a>
        <%
        if(request.getParameter("nome") !=null){
        AgendaDAO agendadao = new AgendaDAO();
        Agenda contato = new Agenda();
        contato.setNome(request.getParameter("nome"));
        contato.setDdd(request.getParameter("ddd"));
        contato.setNumero(request.getParameter("numero"));
        
            agendadao.cadastrarContato(contato);
            }
        
        %>
    </body>
</html>
