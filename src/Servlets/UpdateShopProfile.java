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
import BackClasses.Person;
import BackClasses.Shop;

/**
 * Servlet implementation class UpdateShopProfile
 */
@WebServlet("/UpdateShopProfile")
public class UpdateShopProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateShopProfile() {
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
		if(request.getSession().getAttribute("email")==null){
			System.out.println("dato");
			response.sendRedirect("iShopMain.jsp");
			return;
		}
		String sessionMail=(String)request.getSession().getAttribute("email");
		String name=(String) request.getParameter("name");
		String email=(String)request.getParameter("email");
		String currentPassword=(String)request.getParameter("current_password");
		String password=(String)request.getParameter("password");
		String confirmPassword=(String)request.getParameter("password_confirm");
		String site=(String)request.getParameter("site");
		String phone = (String) request.getParameter("phone");
		Authorizations aut = new Authorizations();
		DatabaseClass db = new DatabaseClass();
		Shop currentShop = db.getShop(db.getShopId(sessionMail));
		
		if(name.length()!=0 && !name.equals(""))currentShop.setShopName(name);
		if(email!=null && !email.equals("")){
			currentShop.setEmail(email);
		}
		
		if(phone.length()!=0 && !phone.equals(""))currentShop.setTel(phone);
		Boolean changePassword=false;
		if(aut.searchShop(sessionMail, currentPassword)){
			if(password!=null && password.equals(confirmPassword) && !password.equals("")){
				changePassword=true;
			}
		}
		aut.updateShop(currentShop, password, changePassword, sessionMail);
		HttpSession ses=request.getSession();
		ses.setAttribute("email", currentShop.getEmail());
		RequestDispatcher rd = request.getRequestDispatcher("iShopMain.jsp");
		rd.forward(request, response);
	}

}
