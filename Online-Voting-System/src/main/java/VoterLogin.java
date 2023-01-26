

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class VoterLogin
 */
public class VoterLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbManager db = new DbManager();
		java.sql.Connection con = db.getConnection();
		
		String vNumber = request.getParameter("voterNumber");
		
		try {
			
			PreparedStatement st1 = con.prepareStatement("select vNumber from temp_vc_number where vNumber = '"+vNumber+"'");
	       //if this no already registered in temp vc no table(voted id table) then it means person is already voted 
			ResultSet rs1= st1.executeQuery("select vNumber from temp_vc_number where vNumber = '"+vNumber+"'");
			if(rs1.next()) {
				response.sendRedirect("voted.jsp");
			}else {
				
				PreparedStatement st  = con.prepareStatement("select * from voters where vNumber = '"+vNumber+"'");
				ResultSet rs = ((java.sql.Statement) st).executeQuery("select * from voters where vNumber = '"+vNumber+"'");
				//if registered voter no is there to vote
				if(rs.next()) {
					response.sendRedirect("voterWelcome.jsp");
				}else {
					response.sendRedirect("invalid.jsp"); //if no is not registered
				}
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}


	}


