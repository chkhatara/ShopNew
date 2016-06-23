/**
 * 
 */
package BackClasses;

/**
 * @author Davit
 *
 */
public class ItemCart {
	private String itemName;
	private String itemDescription;
	private int itemPrice;
	private int itemQuantity;
	private byte[] photo;
	
	public ItemCart(String itemName,String itemDescription,int itemPrice,int itemQuantity,byte[] photo){
		this.itemName=itemName;
		this.itemDescription=itemDescription;
		this.itemPrice=itemPrice;
		this.itemQuantity=itemQuantity;
		this.photo=photo;		
	}
	public String getName(){
		return this.itemName;
	}
	public String getItemDescription(){
		return this.itemDescription;
	}
	public int getPrice(){
		return this.itemPrice;
	}
	public int getQuantity(){
		return this.itemQuantity;
	}
	public byte[] getPhoto(){
		return this.photo;
	}
	public void setName(String itemName){
		this.itemName=itemName;
	}
	public void setDescription(String itemDescription){
		this.itemDescription=itemDescription;
	}
	public void setPrice(int itemPrice){
		this.itemPrice=itemPrice;
	}
	public void setQuantity(int quantity){
		this.itemQuantity=quantity;
	}
	public void setPhoto(byte [] photo){
		this.photo = photo;
	}

}
