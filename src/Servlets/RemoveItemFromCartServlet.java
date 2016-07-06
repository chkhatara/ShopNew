package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BackClasses.Authorizations;
import BackClasses.DatabaseClass;

/**
 * Servlet implementation class RemoveItemFromCartServlet
 */
@WebServlet("/RemoveItemFromCartServlet")
public class RemoveItemFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveItemFromCartServlet() {
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
		DatabaseClass db = new DatabaseClass();
		Authorizations aut = new Authorizations();
		int personId = aut.getPersonId((String)request.getSession().getAttribute("email"));
		String remove = request.getParameter("removebut");
		String buy = request.getParameter("buybut");
		System.out.println(remove);
		if (remove != null) {
			int itemid = Integer.parseInt(remove);
			db.removeItemPersonConnection(personId, itemid);
			response.sendRedirect("http://localhost:8080/ShopNew/ShoppingCartServlet");
		}else if(buy != null){
			
		}
		 
		
		
	}

}
