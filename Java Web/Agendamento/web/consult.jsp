<%-- 
    Document   : consult
    Created on : 24/05/2016, 10:30:25
    Author     : Valéria
--%>

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
        <title>Horários</title>
    </head>
    <body>

        <table >
            <thead>
                <tr>
                    <th>Data:</th>
                    <th>Hora:</th>

                </tr>
            </thead>
            <tbody>


                <%
                    Connection con = ConnectionFactory.createConnection();
                    List<Horario> horarios = new ArrayList<Horario>();
                    horarios = AgendaDAO.ConsultByDate(con,Date.valueOf(request.getParameter("data")));

                    int i = 0;

                    while (i < horarios.size()) {
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(horarios.get(i).date);
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
