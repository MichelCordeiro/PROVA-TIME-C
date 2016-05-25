package valeria;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Valéria
 */
public class ConnectionFactory {

	public static java.sql.Connection createConnection() throws SQLException{
		String url = "jdbc:mysql://localhost:3306/usuarios"; //Nome da base de dados
		String user = "root"; //nome do usuário do MySQL
		String password = "root"; //senha do MySQL
		
		java.sql.Connection conexao = null;
		conexao = DriverManager.getConnection(url, user, password);
		
		return conexao;
	}
}