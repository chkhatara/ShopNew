package Servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BackClasses.Authorizations;

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
		String password_confirm=(String)request.getParameter("password_confirmation");
		String first_name=(String)request.getParameter("first_name");
		String surname=(String)request.getParameter("last_name");
		String id=(String)request.getParameter("id_number");
		String sex=request.getParameter("inlineRadioOptions");
		String tel = (String)request.getParameter("tele");
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int day=Integer.parseInt(request.getParameter("day"));
		Date date = (Date) new GregorianCalendar(year, month, day).getTime();
		Date date1=new Date(day,month,year);		
		Authorizations aut= new Authorizations();
		try {
			boolean contains=aut.searchPerson(email,password);			
			if(contains==true||password.length()==0
					||password_confirm.length()==0||!password.equals(password_confirm)||surname.length()==0||email.length()==0|first_name.length()==0){
				RequestDispatcher rd=request.getRequestDispatcher("personRegister.jsp");
				rd.forward(request, response);
			}else{
				HttpSession session = request.getSession(false);			        
		        if(session != null){
		            session.invalidate();
		        }
		        aut.addPerson(first_name, surname, password, id, new java.sql.Date(date1.getTime()), email, sex);
//				DataForPerson data=new DataForPerson();
//				Person p=data.getPerson(data.getPersonId(email));
//				session=request.getSession();
//				session.setAttribute("person", p);
//				session.setAttribute("first_name", first_name);
//				session.setAttribute("last_name", surname);
//				session.setAttribute("email", email);
//				response.sendRedirect("http://localhost:8080/HR-Geo/PersonServlet");			
			}
		} catch (Exception e) {
			e.printStackTrace();
}
	}

}
