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
import BackClasses.Person;

/**
 * Servlet implementation class UpdatePersonProfile
 */
@WebServlet("/UpdatePersonProfile")
public class UpdatePersonProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePersonProfile() {
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
		String name=(String) request.getParameter("first_name");
		String lastName=(String)request.getParameter("last_name");
		String email=(String)request.getParameter("email");
		String currentPassword=(String)request.getParameter("current_password");
		String password=(String)request.getParameter("password");
		String confirmPassword=(String)request.getParameter("password_confirm");
		String idnumber=(String)request.getParameter("idnumber");
		String phone = (String) request.getParameter("phone");
		Authorizations aut = new Authorizations();
		Person currentPerson = aut.getPerson(aut.getPersonId(sessionMail));
		
		if(name.length()!=0 && !name.equals(""))currentPerson.setName(name);
		if(lastName!=null && !lastName.equals("")) currentPerson.setSurname(lastName);
		if(email!=null && !email.equals("")){
			currentPerson.setMail(email);
		}
		if(idnumber.length()!=0 && !idnumber.equals(""))currentPerson.setId(idnumber);
		if(phone.length()!=0 && !phone.equals(""))currentPerson.setTel(phone);
		Boolean changePassword=false;
		if(aut.searchPerson(sessionMail, currentPassword)){
			if(password!=null && password.equals(confirmPassword) && !password.equals("")){
				changePassword=true;
			}
		}
		aut.updatePerson(currentPerson, password, changePassword, sessionMail);
		HttpSession ses=request.getSession();
		ses.setAttribute("email", currentPerson.getMail());
		RequestDispatcher rd = request.getRequestDispatcher("iShopMain.jsp");
		rd.forward(request, response);
	}

}
