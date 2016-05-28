<html lang="en">
    <head>
        <title>Agendar Horario</title>

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/signin.css" type="text/css"/>
    </head>

    <body>

        <!-- Static navbar -->
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="agenda.html">Agenda</a></li>
                        <li><a href="sair.html">Sair</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>






        <div class="container">
            <form class="form-signin" action="consult.jsp" method="post">  
                <h2 class="form-signin-heading"></h2>
                Setor:
                <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <%@page import="java.sql.Time"%>
                <%@page import="java.sql.Date"%>
                <%@page import="java.util.ArrayList"%>
                <%@page import="java.util.List"%>
                <%@page import="valeria.*"%>
                <%@page import="java.sql.Connection"%>

                Setor: 
                <select class="selectpicker" data-live-search="true" name = "setor_id">
                    <%
                        Connection con = ConnectionFactory.createConnection();
                        List<Setor> setores = new ArrayList<Setor>();
                        setores = AgendaDAO.GetSectors(con);

                        int i = 0;

                        while (i < setores.size()) {
                            out.print("<option value = '" + setores.get(i).id + "'>");
                            out.print(setores.get(i).nome);
                            out.print("</option>");

                            i++;
                        }

                    %>
                </select>  
                Data:<input type="date" name="data">
                <input type="submit" value="Escolher" name="Escolher" />
            </form> 
        </div>




    </body>
</html>

