/**
 * 
 */
package BackClasses;

/**
 * @author Davit
 *
 */
public class Item {
	
	private String itemName;
	private int itemPrice;
	private int itemQuantity;
	private String itemDescription;
	private String itemCategory;
	private String itemSubCategory;
	
	public Item(String itemName,int itemPrice,int itemQuantity,String itemDescription,String itemCategory,String itemSubCategory){
		this.itemName=itemName;
		this.itemPrice=itemPrice;
		this.itemQuantity=itemQuantity;
		this.itemDescription=itemDescription;
		this.itemCategory=itemCategory;
		this.itemSubCategory=itemSubCategory;
	}
	public String getName(){
		return this.itemName;
	}
	public String getitemDescription(){
		return this.itemDescription;
	}
	public String getSubCategory(){
		return this.itemSubCategory;
	}
	public String getCategory(){
		return this.itemCategory;
	}
	public int getQuantity(){
		return this.itemQuantity;
	}
	public int getPrice(){
		return this.itemPrice;
	}
	

}
