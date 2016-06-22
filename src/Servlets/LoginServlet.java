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




/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		Authorizations aut = new Authorizations();
		boolean containsPerson = aut.searchPerson(email, password);
		boolean containsShop = aut.searchShop(email, password); 
		HttpSession session = request.getSession(false);			        
	    if(session != null){
	        session.invalidate();
	    }
		if(containsPerson == false && containsShop == false){
			 session = request.getSession(false);			        
		    if(session != null){
		        session.invalidate();
		    }
			RequestDispatcher rd=request.getRequestDispatcher("iShopMain.jsp");
			rd.forward(request,response);
		}else{
			
			if(containsPerson){
				 session = request.getSession(false);			        
			    if(session != null){
			        session.invalidate();
			    }
			    session=request.getSession();
			    session.setAttribute("email", email);
			    session.setAttribute("password", password);
			    session.setAttribute("user", "person");
			    RequestDispatcher rd = request.getRequestDispatcher("iShopMain.jsp");
			    rd.forward(request, response);
			}else{
				 session = request.getSession(false);			        
			    if(session != null){
			        session.invalidate();
			    }
			    session=request.getSession();
			    session.setAttribute("email", email);
			    session.setAttribute("password", password);
			    session.setAttribute("user", "shop");
			    RequestDispatcher rd = request.getRequestDispatcher("iShopMain.jsp");
			    rd.forward(request, response);								
			}
		
		}
	}
}
