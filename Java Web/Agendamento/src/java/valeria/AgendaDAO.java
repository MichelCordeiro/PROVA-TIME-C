package valeria;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
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

    public static List<Horario> ConsultHour(Connection con, Time t) throws SQLException {
        String sql = "SELECT * FROM horarios WHERE Hora = '" + t.toString() + "'";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Horario> horarios = new ArrayList<Horario>();
        Horario horarioA;

        while (rs.next()) {
            horarioA = new Horario();
            horarioA.time = rs.getTime("Hora");
            horarios.add(horarioA);
        }
        return horarios;
    }

    public static List<Horario> ConsultByDate(Connection con, Date date) throws SQLException {
        //String sql = "SELECT * FROM horarios WHERE CAST(Hora AS DATE) = '" + date.toString() + "'";
        String sql = "SELECT *  FROM alunos_agendados WHERE Data = '" + date.toString() + "'";
        //Prepara a instrução SQL
        PreparedStatement ps = con.prepareStatement(sql);
        //Executa a instrução SQL
        ResultSet rs = ps.executeQuery();

        List<Horario> horarios = new ArrayList<Horario>();
        Horario horarioA;

        while (rs.next()) {
            horarioA = new Horario();
            horarioA.date = rs.getDate("Data");
            horarioA.time = rs.getTime("Hora");
            horarioA.setor = rs.getString("Setor");
            horarioA.aluno = rs.getString("Aluno");
            horarios.add(horarioA);
        }
        return horarios;
    }

    public static List<Horario> AvailableByDate(Connection con, Date date, String setor_id) throws SQLException {
        //String sql = "SELECT * FROM horarios WHERE CAST(Hora AS DATE) = '" + date.toString() + "'";
        String sql = "SELECT * FROM horarios_disponiveis hd WHERE  hd.setor_id = "+ setor_id +" "
                + "AND id NOT IN (SELECT  "
                + "setores_horarios_id  FROM alunos_agendados aa WHERE  aa.setor_id = "+ setor_id 
                + " AND aa.Data = '"+date.toString()+"')";
        //Prepara a instrução SQL
        PreparedStatement ps = con.prepareStatement(sql);
        //Executa a instrução SQL
        ResultSet rs = ps.executeQuery();

        List<Horario> horarios = new ArrayList<Horario>();
        Horario horarioA;

        while (rs.next()) {
            horarioA = new Horario();
            horarioA.time = rs.getTime("hora");
            horarioA.setor = rs.getString("setor");
            horarios.add(horarioA);
        }
        return horarios;
    }
     public static List<Setor> GetSectors(Connection con) throws SQLException {

        String sql = "SELECT * FROM setores ; ";
        //Prepara a instrução SQL
        PreparedStatement ps = con.prepareStatement(sql);
        //Executa a instrução SQL
        ResultSet rs = ps.executeQuery();
        List<Setor> setores;
        setores = new ArrayList<Setor>();
        Setor setorA;
        while (rs.next()) {
            setorA = new Setor();
            setorA.nome = rs.getString("nome");
            setorA.id = rs.getString("id");
            setores.add(setorA);
        }
        return setores;
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
