package BackClasses;

import java.util.ArrayList;

public class test {

	public static void main(String[] args) {
		DatabaseClass db = new DatabaseClass();
		ArrayList<Item> arr =db.searchItems("cate name");
		for(int i=0;i<arr.size();i++){
			System.out.println(arr.get(i).getName());
		}
	}

}
