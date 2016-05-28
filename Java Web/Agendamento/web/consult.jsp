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
<div class="container">
    <table class="table table-striped">
        <thead>
            <tr>
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
                    out.print(horarios.get(i).time);
                    out.print("</td>");
                    out.print("<td><input id = ' "+horarios.get(i).id + "'"
                            + " onclick = 'reserva(this)' class='btn btn-lg btn-primary btn-block' value='reservar' name='reservar' /></td>");
                    out.print("</tr>");

                    i++;
                }


            %>


    </table>
</div>


