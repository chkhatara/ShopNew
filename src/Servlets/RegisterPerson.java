package Servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BackClasses.Authorizations;
import BackClasses.Person;

/**
 * Servlet implementation class RegisterPerson
 */
@WebServlet("/RegisterPerson")
public class RegisterPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterPerson() {
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
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		String first_name=(String)request.getParameter("name");
		String surname=(String)request.getParameter("surname");
		String id=(String)request.getParameter("idNumber");
		String tel = (String)request.getParameter("Phone");
	
		Authorizations aut=  new Authorizations();
		try {
			
			boolean containsPerson=aut.searchPerson(email,password);	
			boolean containsShop=aut.searchShop(email,password);
			if(containsPerson==true||containsShop==true){
				RequestDispatcher rd=request.getRequestDispatcher("PersonRegister.jsp");
				rd.forward(request, response);
			}else{
				
				HttpSession session = request.getSession(false);			        
		        if(session != null){
		            session.invalidate();
		        }
		        aut.addPerson(first_name, surname,email, password, id,tel, "MALE");
				Person p=aut.getPerson(aut.getPersonId(email));
				session=request.getSession();
				session.setAttribute("person", p);
				session.setAttribute("user", "person");
				session.setAttribute("first_name", first_name);
				session.setAttribute("last_name", surname);
				session.setAttribute("email", email);
				RequestDispatcher rd=request.getRequestDispatcher("iShopMain.jsp");
				rd.forward(request, response);			
			}
		} catch (Exception e) {
			e.printStackTrace();
}
	}

}
