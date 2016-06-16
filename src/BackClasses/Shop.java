/**
 * 
 */
package BackClasses;

/**
 * @author Davit
 *
 */
public class Shop {
	private String shopName;
	private String email;
	//private String password;
	private String site;
	private String info;
	
	public Shop(String shopName,String email,String site,String info){
		this.shopName=shopName;
		this.email=email;
		this.site=site;
		this.info=info;
		
	}
	public void setShopName(String shopName){
		this.shopName=shopName;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public void setSite(String site){
		this.site=site;
	}
	public void setInfo(String info){
		this.info=info;
	}
	public String getName(){
		return this.shopName;
	}
	public String getSite(){
		return this.site;
	}
	public String getInfo(){
		return this.info;
	}
	public String getEmail(){
		return this.email;
	}

}
