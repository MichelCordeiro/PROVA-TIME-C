<%-- 
    Document   : consult
    Created on : 24/05/2016, 10:30:25
    Author     : Valéria
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                    <li class="active"><a href="agenda.html">Agenda</a></li>
                    <li><a href="sair.html">Sair</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
</head>
<body>
    <div class="container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Setor</th>
                    <th>Data</th>
                    <th>Hora</th>    
                    <th>#</th>
                </tr>
            </thead>
            <tbody>

                <%
                    Connection con = ConnectionFactory.createConnection();
                    List<Horario> horarios = new ArrayList<Horario>();
                    horarios = AgendaDAO.AvailableByDate(con, Date.valueOf(request.getParameter("data")), request.getParameter("setor_id"));

                    int i = 0;

                    while (i < horarios.size()) {
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(horarios.get(i).setor);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(horarios.get(i).time);
                        out.print("</td>");
                        out.print("<td><input type='submit' value='Escolher' name='scolher' /></td>");
                        out.print("</tr>");

                        i++;
                    }


                %>


        </table>
</body>
</html>


