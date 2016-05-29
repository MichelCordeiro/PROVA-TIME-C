<%-- 
    Document   : setores
    Created on : 28/05/2016, 15:27:38
    Author     : Valéria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="valeria.*"%>
<%@page import="java.sql.Connection"%>

<select class="selectpicker" data-live-search="true" id = "setor_id">
<%
    Connection con = ConnectionFactory.createConnection();
                    List<Setor> setores = new ArrayList<Setor>();
                    setores = AgendaDAO.GetSectors(con);

                    int i = 0;
                  
                    while (i < setores.size()) {
                        out.print("<option value = '" + setores.get(i).id + "'>");   // Lista de opções dos setores 
                        out.print(setores.get(i).nome);
                        out.print("</option>");                       

                        i++;
                    }
%>
</select>  
