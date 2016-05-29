<%-- 
    Document   : reserva
    Created on : 28/05/2016, 18:05:05
    Author     : Valéria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="valeria.*"%>
<%@page import="java.sql.Connection"%>

<%
    Connection con = ConnectionFactory.createConnection();
    if (AgendaDAO.Reserve(con, request.getParameter("horario_id"), request.getParameter("aluno_id"), Date.valueOf(request.getParameter("date")))) {
        out.print("Reserva feita com sucesso!");
    }
    else
    {
        out.print("SQL ERROR");
    
    }
%>
