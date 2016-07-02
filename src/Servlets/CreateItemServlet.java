package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BackClasses.Authorizations;
import BackClasses.DatabaseClass;
import BackClasses.Item;
import BackClasses.Person;

/**
 * Servlet implementation class CreateItemServlet
 */
@WebServlet("/CreateItemServlet")
public class CreateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateItemServlet() {
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
		String name=(String)request.getParameter("name");
		String subCat=(String)request.getParameter("SubCategory");
		String price=(String)request.getParameter("price");
		String quantity = (String)request.getParameter("quantity");
		String about=(String)request.getParameter("about");
		DatabaseClass db=  new DatabaseClass();
		System.out.println(request.getParameter("shoEmail"));
		try {			
			if(name.length()==0||subCat.length()==0){
				RequestDispatcher rd=request.getRequestDispatcher("iShopMain.jsp");
				rd.forward(request, response);
			}else{
				
				HttpSession session = request.getSession(false);			        
		        if(session != null){
		            session.invalidate();
		        }
//		        db.getCategory(name);
//		        Item item = new Item(name, price, Integer.parseInt(quantity), about, itemCategory, itemSubCategory, id)
//		        db.addItem(item, shopId, subCategoryId);
//				Person p=aut.getPerson(aut.getPersonId(email));
//				session=request.getSession();
//				session.setAttribute("person", p);
//				session.setAttribute("user", "person");
//				session.setAttribute("first_name", first_name);
//				session.setAttribute("last_name", surname);
//				session.setAttribute("email", email);
				RequestDispatcher rd=request.getRequestDispatcher("iShopMain.jsp");
				rd.forward(request, response);			
			}
		} catch (Exception e) {
			e.printStackTrace();
}
		
	}

}
