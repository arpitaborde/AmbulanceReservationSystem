package com.driver;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class DriverAccountCreate
 */
@WebServlet("/DriverAccountCreate")
public class DriverAccountCreate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driverId=request.getParameter("driverId");
		String dname = request.getParameter("dname");
		String demail = request.getParameter("demail");
		String dmobile = request.getParameter("dmobile");
		String daddress = request.getParameter("daddress");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs = request.getSession();
		
		try {
			int patientAccount=DatabaseConnection.insertUpdateFromSqlQuery("insert into tbldriver(driver_id,driver_name,driver_email,driver_mobile,driver_address,uname,upass) values('"+driverId+"','"+dname+"','"+demail+"','"+dmobile+"','"+daddress+"','"+uname+"','"+upass+"')");
			if(patientAccount>0) {
				String message="Driver account created successfully.";
				hs.setAttribute("success-message", message);
				response.sendRedirect("driver-register.jsp");
			}else {
				response.sendRedirect("driver-register.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
