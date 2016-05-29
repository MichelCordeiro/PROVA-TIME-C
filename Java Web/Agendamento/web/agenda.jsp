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
                $.post("reserva.jsp",
                        {
                            date: $("#data").val(),
                            aluno_id: "<%= session.getAttribute("aluno_id")%>",
                            horario_id: obj.id
                        },
                        function (data, status) {
                            if (status)
                            {
                                alert("Reservado com sucesso!");
                                $("#ajaxform").submit();
                            }
                        });
            }
        </script>
        <!-- Static navbar -->
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="agendaAluno.jsp">Agenda</a></li>
                    <li class="active"><a href="#">Reserva</a></li>
                    <li><a href="logout.jsp">Sair</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
</head>

<body>









    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <form action="consult.jsp" method="post" id = "ajaxform">  
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
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="table-responsive" id="response">


                </div>
            </div>

        </div>
    </div>

</div>




</body>
</html>

