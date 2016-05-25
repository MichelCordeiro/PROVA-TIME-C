<%-- 
    Document   : login
    Created on : 25/05/2016, 15:50:53
    Author     : Valéria
--%>

<%@page import="valeria.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/signin.css" rel="stylesheet">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Login</a></li>                        
                        <li><a href="agenda.html">Agenda</a></li>
                        <li><a href="sair.html">Sair</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
    </head>
    <body>

        <%
            Connection con = ConnectionFactory.createConnection();
            Aluno aluno = new Aluno(request.getParameter("email"), request.getParameter("password"),
            request.getParameter("id"));
            
            if (AgendaDAO.TryLogin(con, aluno)) {
                out.print(" <ins> Ficha do Aluno </ins>");
                out.print("Aluno: " + aluno.email +  " ");
                out.print("Email: " + aluno.email + " ");
         
            } else {
                out.print("Email ou senha incorretos\n");
            }


        %>
</html>