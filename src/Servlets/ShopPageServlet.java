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
 * Servlet implementation class ShopPageServlet
 */
@WebServlet("/ShopPageServlet")
public class ShopPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("user")!="shop"){
			response.sendRedirect("iShopMain.jsp");
			return;
		}
		HttpSession session=request.getSession();
		String email= (String)session.getAttribute("email");
		String page = (String)request.getParameter("page");
		DatabaseClass dc = new DatabaseClass();
		int id=0;
		id = dc.getShopId(email);			
		Shop shop = dc.getShop(id);
		request.setAttribute("ShopObject", shop);	
		if(page!=null){
			RequestDispatcher rd = request.getRequestDispatcher("ShopPage.jsp?page="+page);
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("ShopPage.jsp");
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
