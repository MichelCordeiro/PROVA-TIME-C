<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.sql.Time"%>
    <%@page import="java.sql.Date"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.List"%>
    <%@page import="valeria.*"%>
    <%@page import="java.sql.Connection"%>
    <head>
        <title>Agendar Horario</title>

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/signin.css" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#ajaxform").submit(function () {
                    $.ajax({
                        url: $(this).attr('action'),
                        type: $(this).attr('method'),
                        data: $(this).serialize(),
                        success: function (data) {
                            $("#response").html(data);
                        }
                    });
                    return false;
                });

            });
            var reserva = function (obj)
            {
                alert("Button clicked, horario_id " + obj.id + ", aluno_id : <%= (String)session.getAttribute("aluno_id") %> , data: " + $("#data").val());

                $.post("reserva.jsp",
                        {
                            date: $("#data").val(),
                            aluno_id: "<%= session.getAttribute("aluno_id") %>",
                            horario_id: obj.id
                        },
                        function (data, status) {
                            alert("Data: " + data + "\nStatus: " + status);
                        });
            }
        </script>
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
            <div class="row">
                <form class="form-signin" action="consult.jsp" method="post" id = "ajaxform">  
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">setor</span>
                        <select class="form-control" data-live-search="true" name = "setor_id">
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
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">data</span>
                        <input type="date" name="data" id = "data" class = "form-control">
                    </div>
                    <br>
                    <input class = 'btn btn-lg btn-primary btn-block' type="submit" value="verificar" name="verificar" />
                </form> 
            </div>
            <div class="row">
                <div id="response"></div>
            </div>

        </div>

    </div>




</body>
</html>

