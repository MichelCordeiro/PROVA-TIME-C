package valeria;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Valéria
 */
public class AgendaDAO {

    public static List<Horario> ConsultHour(Connection con) throws SQLException {
        String sql = "SELECT * FROM horarios";
        //Prepara a instrução SQL
        PreparedStatement ps = con.prepareStatement(sql);
        //Executa a instrução SQL
        ResultSet rs = ps.executeQuery();
        List<Horario> horarios = new ArrayList<Horario>();
        Horario horarioA;

        while (rs.next()) {
            horarioA = new Horario();
            horarioA.date = rs.getDate("hora");
            horarioA.time = rs.getTime("hora");
            horarios.add(horarioA);
        }
        return horarios;
    }

    public static List<Horario> ConsultByDate(Connection con, Date date) throws SQLException {
        String sql = "SELECT * FROM horarios WHERE CAST(Hora AS DATE) = '" + date.toString() + "'";
        //Prepara a instrução SQL
        PreparedStatement ps = con.prepareStatement(sql);
        //Executa a instrução SQL
        ResultSet rs = ps.executeQuery();
        List<Horario> horarios = new ArrayList<Horario>();
        Horario horarioA;

        while (rs.next()) {
            horarioA = new Horario();
            horarioA.date = rs.getDate("hora");
            horarioA.time = rs.getTime("hora");
            horarios.add(horarioA);
        }
        return horarios;
    }

    public static boolean TryLogin(Connection con, Aluno aluno) throws SQLException {

        String sql = "SELECT * FROM alunos WHERE Email = '" + aluno.email + "'and Senha = '" + aluno.password + "'; ";
        //Prepara a instrução SQL
        PreparedStatement ps = con.prepareStatement(sql);
        //Executa a instrução SQL
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            aluno.email = rs.getString("Email");
            aluno.password = rs.getString("Senha");

            return true;
        }
        return false;
    }
}