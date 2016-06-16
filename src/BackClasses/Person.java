/**
 * 
 */
package BackClasses;

import java.sql.Date;

/**
 * @author Davit
 *
 */
public class Person {
	private String name;
	private String mail;
	private String surname;
	private String id;
	private String sex;
	private Date date;
	private byte[] photo;
	
	public Person(String name,String mail,String surname,String id,String sex,Date date,byte[]photo){
		this.name=name;
		this.mail=mail;
		this.surname=surname;
		this.id=id;
		this.sex=sex;
		this.date=date;
		this.photo=photo;	
	}
	


	public Date getDate(){
		return date;
	}
	public String getName(){
		return name;		
	}
	
	public String getMail(){
		return mail;
	}
	
	public String getSurname(){
		return surname;
	}
	public byte[] getPhoto(){
		return photo;
	}
	
	public String getId(){
		return id;
	}
	public String getSex(){
		return sex;
	}
	
	public void setName(String name){
		this.name=name;
	}
	public void setSex(String sex){
		this.sex=sex;
	}
	
	public void setSurname(String surname){
		this.surname=surname;
	}
	public void setMail(String mail){
		this.mail=mail;
	}
	@SuppressWarnings("deprecation")
	public void setDate(java.util.Date date){
		this.date=new Date(date.getYear(), date.getMonth(), date.getDate());
	}
	
	public void setPhoto(byte [] photo) {
		this.photo = photo;
}
	
	
}
