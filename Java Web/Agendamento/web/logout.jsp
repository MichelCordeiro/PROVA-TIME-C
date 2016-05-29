<%-- 
    Document   : logout
    Created on : 28/05/2016, 19:44:41
    Author     : Valéria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.setAttribute("aluno_nome","" );
    session.setAttribute("aluno_id", "");
    response.sendRedirect("index.html");
%>