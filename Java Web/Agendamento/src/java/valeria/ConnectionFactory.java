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
// Cria conexão com o banco
public class ConnectionFactory {

	public static java.sql.Connection createConnection() throws SQLException, ClassNotFoundException{
                Class.forName("com.mysql.jdbc.Driver"); // essa linha pode resolver o problema
		String url = "jdbc:mysql://localhost:3306/bdagenda"; //Nome da base de dados
		String user = "root"; //nome do usuário do MySQL
		String password = "7410"; //senha do MySQL
		
		java.sql.Connection conexao = null;
		conexao = DriverManager.getConnection(url, user, password);
		
		return conexao;
	}
}