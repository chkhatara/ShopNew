/**
 * 
 */
package BackClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Davit
 *
 */
public class Authorizations {

	public boolean searchPerson(String email, String password) {
		Connection con = null;
		con = DataBaseInfo.getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			String query = "SELECT * FROM person " + "WHERE  person_email = '" + email + "' and person_password ='"+password+"';";
			ResultSet rs = stmt.executeQuery(query);
			if (!rs.next()) {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return true;
	}

	public boolean searchShop(String email, String password) {
		Connection con = DataBaseInfo.getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			String query = "SELECT * FROM shop " + "WHERE " + "shop_email = '" + email +"' and shop_password ='"+password+ "' ;";
			ResultSet rs = stmt.executeQuery(query);
			if (!rs.next()) {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	public void addPerson(String name, String surname, String email, String password, String id, String tel,
			String sex) {
		Connection con = DataBaseInfo.getConnection();

		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(
					"INSERT INTO person (person_name,person_lastName,person_email,person_password,person_id_number,person_tel,person_sex) "
							+ "values (?,?,?,?,?,?,?)");
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			stmt.setString(1, name);
			stmt.setString(2, surname);
			stmt.setString(3, email);
			stmt.setString(4, password);
			stmt.setString(5, id);
			stmt.setString(6, tel);
			stmt.setString(7, sex);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
	}

	public void addShop(String name, String email, String password, String site, String tel, String info) {
		Connection con = DataBaseInfo.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(
					"INSERT INTO shop (shop_name,shop_email,shop_password,shop_site,shop_tel,shop_info) "
							+ "values (?,?,?,?,?,?)");
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, password);
			stmt.setString(4, site);
			stmt.setString(5, tel);
			stmt.setString(6, info);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getPersonId(String email) {
		Statement stm;
		int res = -1;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from person where person_email='" + email + "';");
			if (rSet.next()) {
				res = rSet.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return res;
	}

	public Person getPerson(int idN) {
		Statement stm;
		Person pers = null;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from person  where person_id=" + idN + ";");
			String sex = null;
			String name = null;
			String mail = null;
			String surname = null;
			String id = null;
			String tel = null;
			if (rSet.next()) {
				sex = rSet.getString("person_sex");
				name = rSet.getString("person_name");
				mail = rSet.getString("person_email");
				surname = rSet.getString("person_lastName");
				id = rSet.getString("person_id_number");
				tel = rSet.getString("person_tel");

			}

			pers = new Person(name, mail, surname, id, sex, tel);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return pers;

	}
	public void updatePerson(Person p,String password,Boolean changePassword,String email){
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
			try {
				stm=con.createStatement();
				stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
				if(changePassword){
					stm.executeUpdate("update person "
							+ "set person_name='"+p.getName()+"', person_lastName='"+p.getSurname()+"', person_tel='"+p.getTel()+"', person_password='"+password+"', person_email='"+p.getMail()+"', person_id_number='"+p.getId()+"' where person_email='"+email+"';");
				}else{
					stm.executeUpdate("update person "
							+ "set person_name='"+p.getName()+"', person_lastName='"+p.getSurname()+"', person_tel='"+p.getTel()+"', person_email='"+p.getMail()+"', person_id_number='"+p.getId()+"' where person_email='"+email+"';");

				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	public void updateShop(Shop shop,String password,Boolean changePassword,String email){
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
			try {
				stm=con.createStatement();
				stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
				if(changePassword){
					stm.executeUpdate("update shop "
							+ "set shop_name='"+shop.getName()+"', shop_site='"+shop.getSite()+"', shop_tel='"+shop.getTel()+"', shop_password='"+password+"', shop_email='"+shop.getEmail()+"', shop_info='"+shop.getInfo()+"' where shop_email='"+email+"';");
				}else{
					stm.executeUpdate("update shop "
							+ "set shop_name='"+shop.getName()+"', shop_site='"+shop.getSite()+"', shop_tel='"+shop.getTel()+"', shop_email='"+shop.getEmail()+"', shop_info='"+shop.getInfo()+"' where shop_email='"+email+"';");

				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
