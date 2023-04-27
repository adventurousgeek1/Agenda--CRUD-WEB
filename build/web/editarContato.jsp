<%@page import="Model.Agenda"%>
<%@page import="DAO.AgendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Contato</title>
    </head>
    <body>
        <form action="editarContato.jsp" method="post">
            <input type="hidden" value="<%=request.getParameter("id")%>" name="id">
            <p>
            <label>Nome: </label>
            <input type="text" name="nome" value="<%=request.getParameter("nome")%>">
            </p>
            <p>
            <label>DDD: </label>
            <input type="text" name="ddd" value="<%=request.getParameter("ddd")%>">
            </p>
            <p>
            <label>Número: </label>
            <input type="text" name="numero" value="<%=request.getParameter("numero")%>">
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
        contato.setIdContato(Integer.parseInt(request.getParameter("id")));
        contato.setNome(request.getParameter("nome"));
        contato.setDdd(request.getParameter("ddd"));
        contato.setNumero(request.getParameter("numero"));
        
            agendadao.atualizarContato(contato);
            }
        %>
    </body>
</html>
