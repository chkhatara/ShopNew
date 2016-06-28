package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homepage.jsp");
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
		String about=(String)request.getParameter("about");
		String phone = (String) request.getParameter("phone");
//		if(name.length()!=0 && !name.equals(""))currentPerson.setName(name);
//		if(lastName!=null && !lastName.equals("")) currentPerson.setSurname(lastName);
//		if(email!=null && !email.equals("")){
//			currentPerson.setMail(email);
//		}
//		if(date!=null && date.length()==10){
//			int year=Integer.parseInt(date.substring(0,4));
//			int day=Integer.parseInt(date.substring(8));
//			int month=Integer.parseInt(date.substring(5,7));
//			Date d=new GregorianCalendar(year, month-1, day).getTime();
//			currentPerson.setDate(d);
//		}
//		Boolean changePassword=false;
//		DBSelect db=new DBSelect();
//		if(db.searchPerson(sessionMail, currentPassword)){
//			if(password!=null && password.equals(confirmPassword) && !password.equals("")){
//				changePassword=true;
//			}
//		}
//		currentPerson.setSex(sex);
//		currentPerson.setAbout(about);
//		data.updatePerson(currentPerson, password, changePassword, sessionMail);
//		HttpSession ses=request.getSession();
//		ses.setAttribute("email", currentPerson.getMail());
//		ses.setAttribute("person", currentPerson);
//		response.sendRedirect("http://localhost:8080/HR-Geo/PersonServlet");
	}

}
