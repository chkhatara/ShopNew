/**
 * 
 */
package BackClasses;

/**
 * @author Davit
 *
 */
public class Review {
	private String personName;
	private int star;
	private int itemId;
	private String review;
	public Review(String personName,int star,int itemId,String review){
		this.personName=personName;
		this.star=star;
		this.itemId=itemId;
		this.review=review;
	}
	public int getStar(){
		return this.star;
	}
	public int getItemId(){
		return this.itemId;
	}
	public String getPersonName(){
		return this.personName;
	}
	public String getReview(){
		return this.review;
	}
}
