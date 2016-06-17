/**
 * 
 */
package BackClasses;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Davit
 *
 */
public class Authorizations {
	
	public boolean searchPerson(String email,String password){		
		Connection con = null;
		con=DataBaseInfo.getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			String query = "SELECT * FROM person "
					+ "WHERE " + "person_email = '" + email + "' AND person_password = '"+password
					+ "' ;";
			ResultSet rs=stmt.executeQuery(query);
			if(!rs.next()){
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	
	public static boolean searchShop(String email,String password){
		Connection con=DataBaseInfo.getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			String query = "SELECT * FROM shop "
					+ "WHERE " + "shop_email = '" + email + "' AND shop_password = '"+password
					+ "' ;";
			ResultSet rs=stmt.executeQuery(query);
			if(!rs.next()){
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
		return true;
	}
	
	public void addPerson(String name,String surname,String password,String id,Date date,String email,String sex) {
		Connection con=DataBaseInfo.getConnection();

		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("INSERT INTO person (person_name,person_lastName,person_email,person_password,person_id_number,person_birth_date,person_sex) "
					+ "values (?,?,?,?,?,?,?)");
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			stmt.setString(1, name);
			stmt.setString(2, surname);
			stmt.setString(3, email);
			stmt.setString(4, password);
			stmt.setString(5, id);
			stmt.setDate(6, date);
			stmt.setString(7,sex);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
	}
}
