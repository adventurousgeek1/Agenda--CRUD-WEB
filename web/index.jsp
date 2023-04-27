<%@page import="java.util.ArrayList"%>
<%@page import="Model.Agenda"%>
<%@page import="DAO.AgendaDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Agenda de Contatos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            AgendaDAO agendadao = new AgendaDAO();
            if (agendadao.listarContatos() != null) {
                ArrayList<Agenda> contatos = agendadao.listarContatos();
                request.setAttribute("list", contatos);
            }
        %>
        <h2>Lista de Contatos</h2>
        <p>
            <label>ID |</label><label>NOME |</label><label>DDD |</label><label>NUMERO |</label>
        </p>
        <c:forEach items="${list}" var="contato">
            <br>
            <p>
                <label><c:out value="${contato.getIdContato()}"/></label>
                <label><c:out value="${contato.getNome()}"/></label>
                <label><c:out value="${contato.getDdd()}"/></label>
                <label><c:out value="${contato.getNumero()}"/></label>
                <a href="editarContato.jsp?id=${contato.getIdContato()}&nome=${contato.getNome()}&ddd=${contato.getDdd()}&numero=${contato.getNumero()}">
                    <button type = "button">Editar</button></a>
                <a href="excluirContato.jsp?id=${contato.getIdContato()}">
                    <button type = "button">Excluir</button></a>
                    <button type="button">Cadastrar Contato</button>
            </p>
        </c:forEach>
    </body>
</html>
