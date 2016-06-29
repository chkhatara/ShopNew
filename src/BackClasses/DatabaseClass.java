/**
 * 
 */
package BackClasses;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
				//item= new ItemCart(rSet.getString(2), rSet.getString(5), rSet.getInt(6), itemQuantity, null);
				item= new ItemCart(rSet.getString("item_name"), rSet.getString("item_description"), rSet.getInt("item_price"), itemQuantity, null,rSet.getInt("item_id"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		
		return item;
	}
	//gets item by id
	public Item getItemById(int id){
		Statement stm;
		Item item = null;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet = stm.executeQuery("select * from item  where item_id=" + id + ";");
			String itemName= null;
			String itemSubCategory = null;
			String itemCategory = null;
			String itemDescription = null;
			int itemQuantity = 0;
			int itemPrice = 0;
			int itemId= 0;
			if (rSet.next()) {
				itemId= rSet.getInt("item_id");
				itemName = rSet.getString("item_name");
				itemDescription = rSet.getString("item_description");
				itemPrice = rSet.getInt("item_price");
				itemQuantity = rSet.getInt("item_quantity");
				itemCategory = getCategoryName(getCategoryId(rSet.getInt("item_sub_category")));
				itemSubCategory = getSubCategoryName(rSet.getInt("item_sub_category"));
				item = new Item(itemName, itemPrice, itemQuantity, itemDescription, itemCategory, itemSubCategory,itemId);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		int itemId= 0;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet=stm.executeQuery(
					"select * from item where shop_id='"+id+"';");
			while(rSet.next()){
				itemId= rSet.getInt("item_id");
				itemName = rSet.getString("item_name");
				itemDescription = rSet.getString("item_description");
				itemPrice = rSet.getInt("item_price");
				itemQuantity = rSet.getInt("item_quantity");
				itemCategory = getCategoryName(getCategoryId(rSet.getInt("item_sub_category")));
				itemSubCategory = getSubCategoryName(rSet.getInt("item_sub_category"));
				Item item = new Item(itemName, itemPrice, itemQuantity, itemDescription, itemCategory, itemSubCategory,itemId);
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
					item = new Item(rSet.getString("item_name"), rSet.getInt("item_price"), rSet.getInt("item_quantity"), rSet.getString("item_description"), name, getSubCategoryName(rSet.getInt("item_sub_category")),rSet.getInt("item_id"));		
					items.add(item);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return items;
	}
	
	public boolean addItemToPersonCart(int cartId,int personId,int quantity){
		Connection con = DataBaseInfo.getConnection();

		PreparedStatement stmt;
		boolean returnBool=true;
		try {
			stmt = con.prepareStatement(
					"INSERT INTO person_cart_items (person_id,item_id,item_quantity,is_bought) "
							+ "values (?,?,?,?)");
			stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			stmt.setInt(1,cartId);
			stmt.setInt(2,personId);
			stmt.setInt(3,quantity);
			stmt.setInt(4, 0);
			stmt.executeUpdate();
		} catch (SQLException e) {
			returnBool=false;
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return returnBool;
	}
	
	public ArrayList<String> getAllCategories(){		
		ArrayList <String> categories = new ArrayList<String>();
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			
			ResultSet rSet = stm.executeQuery("select * from item_category" + ";");			
			while (rSet.next()) {
				categories.add(rSet.getString("item_category_name"));
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return categories;
	}
	//gets item by sub category id
	public ArrayList<Item> getItemsBySubCategoryId(int id){
		ArrayList<Item> arr = new ArrayList<Item>();
		Statement stm;
		Connection con = DataBaseInfo.getConnection();
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			
			ResultSet rSet = stm.executeQuery("select * from item where item_sub_category = " +id+ ";");			
			while (rSet.next()) {
				Item item = getItemById(rSet.getInt("item_id"));
				arr.add(item);
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return arr;
	}
	//adds  picture to shop 
	public void addCompPicture(String mail, InputStream in) {
		int id=0;
		try {
			Statement st;
			Connection con = DataBaseInfo.getConnection();
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			id = getShopId(mail);
			java.sql.PreparedStatement prs = con.prepareStatement("insert into shop_photoes (shop_id, shop_photo) values(?,?)");
			prs.setInt(1, id);
			prs.setBlob(2, in);
			prs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//adds picture to item
	public void addItemPicture(int id, InputStream in) {
		try {
			Statement st;
			Connection con = DataBaseInfo.getConnection();
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			java.sql.PreparedStatement prs = con.prepareStatement("insert into item_photoes (item_id, item_photo) values(?,?)");
			prs.setInt(1, id);
			prs.setBlob(2, in);
			prs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public byte [] getPhoto(int idNum){
		 Statement stm;
		 byte[] photo=null;
		 try {
			 Connection con = DataBaseInfo.getConnection();
				stm=con.createStatement();
				stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			
				ResultSet rSet=stm.executeQuery("select shop_photo from shop_photoes where shop_id="+idNum+";");
				if(rSet.next()){
					Blob blob = rSet.getBlob(1);
				    photo =  blob.getBytes(1, (int) blob.length());
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		 	return photo;
	}
}
	

