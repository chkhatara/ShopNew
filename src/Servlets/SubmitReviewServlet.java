package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BackClasses.DatabaseClass;

/**
 * Servlet implementation class SubmitReviewServlet
 */
@WebServlet("/SubmitReviewServlet")
public class SubmitReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitReviewServlet() {
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

		String personName = (String) request.getParameter("personName");

		String Rating = (String)request.getParameter("rating");

		Rating = Rating.charAt(0)+"";

		String review = (String) request.getParameter("review");

		DatabaseClass db = new DatabaseClass();
		if(review==null|| review.length()==0||personName==null||personName.length()==0 || db.checkReview(personName, Rating, review, request.getParameter("id"))==false){
			RequestDispatcher rd=request.getRequestDispatcher("ItemPage.jsp?id="+request.getParameter("id"));
			rd.forward(request, response);
		}else{
			db.addReview(personName,Rating,review,request.getParameter("id"));
			RequestDispatcher rd=request.getRequestDispatcher("ItemPage.jsp?id="+request.getParameter("id"));
			rd.forward(request, response);
			
		}
	}

}
