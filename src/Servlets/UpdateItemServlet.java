package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BackClasses.DatabaseClass;
import BackClasses.Item;

/**
 * Servlet implementation class UpdateItemServlet
 */
@WebServlet("/UpdateItemServlet")
public class UpdateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name=(String)request.getParameter("itemname");
		String subCat=(String)request.getParameter("subcategory");
		String price=(String)request.getParameter("itemprice");
		String quantity = (String)request.getParameter("itemquantity");
		String about=(String)request.getParameter("itemabout");
		String category= null;
		if(price==null){
			price="0";
		}
		if(quantity==null){
			quantity="1";
		}
		if(about==""){
			about="";
		}
		DatabaseClass db=  new DatabaseClass();
		try {			
			if(name==null||name.length()==0){
				RequestDispatcher rd=request.getRequestDispatcher("iShopMain.jsp");
				rd.forward(request, response);
			}else{				
				category=db.getCategoryName(db.getCategoryId(db.SubCatId(subCat)));
		        Item item = new Item(name, Integer.parseInt(price), Integer.parseInt(quantity), "ggg", category, subCat,Integer.parseInt((String)request.getParameter("id")));
		       
		        db.updateItem(item,  db.SubCatId(subCat));
		        
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
