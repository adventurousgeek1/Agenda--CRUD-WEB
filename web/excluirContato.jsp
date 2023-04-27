<%@page import="DAO.AgendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Contato </title>
    </head>
    <body>
        <a href="index.jsp">
        <h1>Contato excluído com sucesso!</h1>
        </a>
        <%
        //tag abertura JSP
        AgendaDAO agendadao = new AgendaDAO();
        agendadao.excluirContato(Integer.parseInt(request.getParameter("id")));
        //tag fechamento JSP
        
        %>
    </body>
</html>
