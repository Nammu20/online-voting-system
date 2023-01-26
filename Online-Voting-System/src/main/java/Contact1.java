


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Contact1
 */
public class Contact1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Contact1() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		//create object called db
		DbManager db = new DbManager();
		//make connection
		java.sql.Connection con = db.getConnection();
		
		String name = request.getParameter("uName");
		String number = request.getParameter("pNumber");
		String email = request.getParameter("email");
		String comments = request.getParameter("comments");
		
		try {
			//creating sql query
			 //contact is table name in workbench
			PreparedStatement st = con.prepareStatement("insert into contact(uName,pNumber,email,cmnt)values(' "+name+ " ' , ' "+number+ " ' , ' "+email+ " ', ' "+comments+ " ' )");
		    st.executeUpdate();
		    response.sendRedirect("index.jsp");
		}catch(Exception e) {
			e.printStackTrace(); // to check error
			
		}

		
	}

}
