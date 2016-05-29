<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="valeria.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/signin.css" rel="stylesheet">
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Agenda</a></li>                        
                <li><a href="agenda.jsp">Reserva</a></li>
                <li><a href="logout.jsp">Sair</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
</head>
<body>
    <!DOCTYPE html>
<table class="table table-striped">
    <thead>
        <tr>
            <th>Setor</th>    
            <th>Data</th>
            <th>Hora</th>
        </tr>
    </thead>
    <tbody>

        <%
            Connection con = ConnectionFactory.createConnection();
            List<Horario> horarios = new ArrayList<Horario>();
            horarios = AgendaDAO.ConsultByAluno(con, (String) session.getAttribute("aluno_id"));
            int i = 0;
            out.print("<h2>Agenda " + (String) session.getAttribute("aluno_nome") + " <h2>");
            while (i < horarios.size()) {
                out.print("<tr>");
                out.print("<td>");
                out.print(horarios.get(i).setor);
                out.print("</td>");
                out.print("<td>");
                out.print(horarios.get(i).getDataFormatada());
                out.print("</td>");
                out.print("<td>");
                out.print(horarios.get(i).time);
                out.print("</td>");
                out.print("</tr>");

                i++;
            }


        %>


</table>

</body>
</html>


