package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BackClasses.DatabaseClass;
import BackClasses.Shop;

/**
 * Servlet implementation class ShopPageForPerson
 */
@WebServlet("/ShopPageForPerson")
public class ShopPageForPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopPageForPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int shopid = Integer.parseInt((String)request.getParameter("shopid"));
		String page = (String)request.getParameter("page");
		DatabaseClass dc = new DatabaseClass();		
		Shop shop = dc.getShop(shopid);
		request.setAttribute("ShopObject", shop);	
		if(page!=null){
			RequestDispatcher rd = request.getRequestDispatcher("ShopHomePage.jsp?page="+page+"&shopid="+shopid);
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("ShopHomePage.jsp?shopid="+shopid);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
