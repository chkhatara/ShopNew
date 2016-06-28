package Servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import BackClasses.DatabaseClass;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FILE_PATH = "C:";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		response.setContentType("text/html");
    	String mail = request.getParameter("mail");
    	String id = request.getParameter("id");
    	String type = request.getParameter("type");
        String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
//        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();
        File file = new File(FILE_PATH+"/that.jpg");
        OutputStream outputStream = new FileOutputStream(file);
        IOUtils.copy(fileContent, outputStream);
        FileInputStream inputStream= new FileInputStream(file);
        outputStream.close();
        if (id==null && mail!=null) {
	        DatabaseClass db = new DatabaseClass();
	        //d.addPicture(mail, inputStream);
        } else if(id!=null) {
        	 DatabaseClass db = new DatabaseClass();
        	//dp.addPicture(id, inputStream);
}
        inputStream.close();
        file.delete();
        response.getWriter().print("<html><h1>file: "+description+" was successfully uploaded</h1></html>");
	}

}
