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
	
	public  static boolean searchPerson(String email,String password){	
		Connection con = null;
		con=DataBaseInfo.getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			String query = "SELECT * FROM person "
					+ "WHERE " + "person_email = '" + email 
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
	
	public static  boolean searchShop(String email,String password){
		Connection con=DataBaseInfo.getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			String query = "SELECT * FROM shop "
					+ "WHERE " + "shop_email = '" + email 
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
	
	public void addPerson(String name,String surname,String password,String id,Date date,String email,String sex,String tel) {
		Connection con=DataBaseInfo.getConnection();

		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("INSERT INTO person (person_name,person_lastName,person_email,person_password,person_id_number,person_birth_date,person_tel,person_sex) "
					+ "values (?,?,?,?,?,?,?,?)");
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			stmt.setString(1, name);
			stmt.setString(2, surname);
			stmt.setString(3, email);
			stmt.setString(4, password);
			stmt.setString(5, id);
			stmt.setDate(6, date);
			stmt.setString(7, tel);
			stmt.setString(8,sex);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
	}
	public void addShop(String name,String email,String password,String site,String tel,int Category,String info) {
		Connection con=DataBaseInfo.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("INSERT INTO shop (shop_name,shop_email,shop_password,shop_site,shop_tel,shop_category,shop_info) "
					+ "values (?,?,?,?,?,?,?)");
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, password);
			stmt.setString(4, site);
			stmt.setString(5, tel);
			stmt.setInt(6, Category);
			stmt.setString(7, info);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getPersonId(String email){
		 Statement stm;
		 int res=-1;
		 Connection con = DataBaseInfo.getConnection();
		try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet=stm.executeQuery(
					"select * from person where person_email='"+email+"';");
			if(rSet.next()){
				res=rSet.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		
		 
	return res;
	}
	public Person getPerson(int idN){
		 Statement stm;
		 Person pers=null;
		 Connection con = DataBaseInfo.getConnection();
		 try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet=stm.executeQuery("select person_id"
					+ "from person  where person_id="+idN+";");
			Date date=null;
			String sex=null;
			String name=null;
			String mail=null;
			String surname=null;
			String id=null;
			String about=null;
			if(rSet.next()){
				  date=rSet.getDate(4);
				  sex=rSet.getString(5);
				  name=rSet.getString(2);
				  mail=rSet.getString(6);
				  surname=rSet.getString(3);
				  id=rSet.getString(1);
				  about=rSet.getString(7);
				 
			}
			//ResultSet rSet2=stm.executeQuery("select person_photo from person_photoes where persons_id="+idNum+";");
			//byte[] photo=getPhoto(idN);
			pers=new Person(name, mail, surname, id, sex, date, null);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	return pers;
	
	}
}
