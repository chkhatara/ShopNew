/**
 * 
 */
package BackClasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author Davit
 *
 */
public class DatabaseClass {
	
	public ArrayList<ItemCart> getShoppingCartItemsOfPerson(String email){
		ArrayList<ItemCart> arr = new ArrayList<ItemCart>();
		Authorizations aut = new Authorizations();
		int personId = aut.getPersonId(email);
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet=stm.executeQuery(
					"select * from person_cart_items where person_id='"+personId+"';");
			while(rSet.next()){
				arr.add(getItemCart(rSet.getInt(2),rSet.getInt(3),rSet.getInt(4)));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		
		return arr;
	}

	private ItemCart getItemCart(int itemId, int itemQuantity ,int isBought) {
		ItemCart item = null;
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet=stm.executeQuery(
					"select * from item where item_id='"+itemId+"';");
			if(rSet.next()){
				System.out.println(rSet.getString(2));
				item= new ItemCart(rSet.getString(2), rSet.getString(5), rSet.getInt(6), itemQuantity, null);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		
		return item;
	}

}
