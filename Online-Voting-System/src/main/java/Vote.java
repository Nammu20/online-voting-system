

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Vote
 */
public class Vote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbManager db = new DbManager();
		java.sql.Connection con = db.getConnection();
		
		
		String vNumber = request.getParameter("voterNumber");
		String partie = request.getParameter("partie");
		
		try {
			PreparedStatement st  = con.prepareStatement("select * from voters where vNumber = '"+vNumber+"'");
			ResultSet rs = ((java.sql.Statement) st).executeQuery("select * from voters where vNumber = '"+vNumber+"'");
			
			if(rs.next()) {
				PreparedStatement st1 = con.prepareStatement("insert into temp_vc_number(vNumber)values('"+vNumber+"')");
		    	PreparedStatement st2 = con.prepareStatement("insert into vote(vNumber,partie)values ('"+vNumber+"','"+partie+"')");
		    	
		    	st1.executeUpdate();
		    	st2.executeUpdate();
		      
		        response.sendRedirect("index.jsp"); //if voter no is added to temp vc table & he voted
			}else {
				response.sendRedirect("invalid.jsp");//if voter no is not added to temp vc table
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	}


