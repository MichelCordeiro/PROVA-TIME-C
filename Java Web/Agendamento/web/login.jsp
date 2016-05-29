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
    
<body>

    <%
        Connection con = ConnectionFactory.createConnection();
        Aluno aluno = new Aluno(request.getParameter("email"), request.getParameter("password"));

        if (AgendaDAO.TryLogin(con, aluno)) {
         /* out.print(" <ins> Ficha do Aluno </ins>");
            out.print("Aluno: " + aluno.email + " ");
            out.print("Email: " + aluno.email + " ");*/
            session.setAttribute("aluno_nome", aluno.nome);
            session.setAttribute("aluno_id", aluno.id);
            response.sendRedirect("agendaAluno.jsp");

        } else {
            out.print("Email ou senha incorretos\n");
        }


    %>
</html>