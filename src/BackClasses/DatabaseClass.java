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
	
	public int getShopId(String email){
		Statement stm;
		int res = -1;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from shop where shop_email='" + email + "';");
			if (rSet.next()) {
				res = rSet.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return res;
	}
	
	public Shop getShop(int idN){
		Statement stm;
		Shop shop = null;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from shop  where shop_id=" + idN + ";");
			String site = null;
			String name = null;
			String mail = null;
			String tel = null;
			String info = null;
			if (rSet.next()) {
				name = rSet.getString("shop_name");
				mail = rSet.getString("shop_email");
				tel = rSet.getString("shop_tel");
				info=rSet.getString("shop_info");
				site=rSet.getString("shop_site");

			}

			shop = new Shop(name, mail, tel, site, info);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return shop;
	}
	public ArrayList<Item> getShopItems(int id){
		ArrayList<Item> items = new ArrayList<Item>();
		Statement stm;
		String itemName= null;
		String itemSubCategory = null;
		String itemCategory = null;
		String itemDescription = null;
		int itemQuantity = 0;
		int itemPrice = 0;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet=stm.executeQuery(
					"select * from item where shop_id='"+id+"';");
			while(rSet.next()){
				itemName = rSet.getString("item_name");
				itemDescription = rSet.getString("item_description");
				itemPrice = rSet.getInt("item_price");
				itemQuantity = rSet.getInt("item_quantity");
				itemCategory = getCategoryName(getCategoryId(rSet.getInt("item_sub_category")));
				itemSubCategory = getSubCategoryName(rSet.getInt("item_sub_category"));
				Item item = new Item(itemName, itemPrice, itemQuantity, itemDescription, itemCategory, itemSubCategory);
				items.add(item);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		
		return items;
	}
	//gets sub category name by sub category id
	public String getSubCategoryName(int idN){
		Statement stm;
		String subCategory = null;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from item_sub_category  where item_sub_category=" + idN + ";");			
			if (rSet.next()) {
				subCategory = rSet.getString("item_sub_name");				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return subCategory;
		
	}
	//gets category id by item sub category id
	public int getCategoryId(int idN){
		Statement stm;
		int category = 0;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from item_sub_category  where item_sub_category=" + idN + ";");			
			if (rSet.next()) {
				category = rSet.getInt("item_category_id");				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return category;
	}
	//gets item category name by item category id
	public String getCategoryName(int idN){
		Statement stm;
		String subCategory = null;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from item_category  where item_category_id=" + idN + ";");			
			if (rSet.next()) {
				subCategory = rSet.getString("item_category_name");				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return subCategory;
		
	}
	//gets category id by category name
	public int getCategory(String name){
		Statement stm;
		int category = 0;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from item_category  where item_category_name='" + name + "';");			
			if (rSet.next()) {
				
				category = rSet.getInt("item_category_id");
				System.out.println(category);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return category;
	}
	//search sub category ids by category name
	public ArrayList<Integer> searchSubCategories(String name){
		ArrayList<Integer> arr = new ArrayList<Integer>();
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
		int categoryId = getCategory(name);
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from item_sub_category  where item_category_id=" + categoryId + ";");			
			while (rSet.next()) {
				arr.add(rSet.getInt("item_sub_category"));				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return arr;
	}
	//search items by category name
	public ArrayList<Item> searchItems(String name){
		ArrayList <Integer> subCategoryIds = searchSubCategories(name);
		ArrayList <Item> items = new ArrayList<Item>();
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			for(int i=0;i<subCategoryIds.size();i++){
				int subId = subCategoryIds.get(i);
				Item item = null;
				ResultSet rSet = stm.executeQuery("select * from item where item_sub_category=" + subId + ";");			
				while (rSet.next()) {
					item = new Item(rSet.getString("item_name"), rSet.getInt("item_price"), rSet.getInt("item_quantity"), rSet.getString("item_description"), name, getSubCategoryName(rSet.getInt("item_sub_category")));		
					items.add(item);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return items;
	}
	
}
