package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BackClasses.DatabaseClass;
import BackClasses.Item;

/**
 * Servlet implementation class SearchPageServlet
 */
@WebServlet("/SearchPageServlet")
public class SearchPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPageServlet() {
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
		int price = Integer.parseInt((String) request.getParameter("price"));
		String itemName = (String) request.getParameter("itemname");
		String subCat = (String) request.getParameter("subcategory");
		String query = "select * from item ";
		if((String) request.getParameter("price")!=null && (String)request.getParameter("subcategory")!=null && (String) request.getParameter("itemname")!=null){
			int subId = db.SubCatId(subCat);
			query += " where  item_price<"+price +" and item_sub_category= "+subId+" and item_name LIKE '%" + itemName + "%'";
		}
		ArrayList<Item> items = db.getSearchedItems(query);
		request.setAttribute("SearchedObj", items);
		if(items!=null){
			RequestDispatcher rd=request.getRequestDispatcher("SearchPages.jsp");
			rd.forward(request, response);
		}
				
	}

}
