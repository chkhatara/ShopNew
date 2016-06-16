/**
 * 
 */
package BackClasses;

import java.sql.Date;

/**
 * @author Davit
 *
 */
public class Card {
	private String nameOnCard;
	private String cvv;
	private String cardNumber;
	private Date expirationDate;
	
	public Card(String nameOnCard,String cvv,String cardNumber,Date expirationDate){
		this.nameOnCard=nameOnCard;
		this.cvv=cvv;
		this.cardNumber=cardNumber;
		this.expirationDate=expirationDate;
	}
	
	public void setName(String name){
		this.nameOnCard=name;
	}
	public void setCvv(String cvv){
		this.cvv=cvv;
		
	}
	public void cardNumber(String cardNumber){
		this.cardNumber=cardNumber;
	}

	public String getName(){
		return nameOnCard;
	}
	public String getCvv(){
		return cvv;
	}
	public String getCardNumber(){
		return cardNumber;
	}
	public Date getExpirationDate(){
		return expirationDate;
	}
	@SuppressWarnings("deprecation")
	public void setDate(java.util.Date date){
		this.expirationDate=new Date(date.getYear(), date.getMonth(), date.getDate());
	}

}
