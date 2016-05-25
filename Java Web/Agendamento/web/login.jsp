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
                        <li><a href="cadastro.html">Cadastro</a></li>
                        <li><a href="consultar.html">Consulta</a></li>
                        <li><a href="ListUsers.jsp">Usuarios</a></li>
                        <li><a href="agenda.html">Agenda</a></li>
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
            out.print(" <ins> Ficha do Aluno </ins>");
            if (AgendaDAO.TryLogin(con, aluno)) {
                //out.print("<h2> Bem Vindo " + user.name + "</h2>");
                out.print("<h2> Aluno: " + aluno.password +  "</h2>");
                //out.print("<h2> Senha: " + user.password + "</h2>");
                out.print("<h2> Email: " + aluno.email + "</h2>");
         
            } else {
                out.print("Email ou senha incorretos");
                out.print(aluno.email);
                out.print(aluno.password);

            }


        %>
</html>