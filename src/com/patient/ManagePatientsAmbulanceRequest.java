package com.patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;



/**
 * Servlet implementation class ManagePatientsAmbulanceRequest
 */
@WebServlet("/ManagePatientsAmbulanceRequest")
public class ManagePatientsAmbulanceRequest extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int statusMode = 0;
			ResultSet rs =DatabaseConnection.getResultFromSqlQuery("select ambulance_status from tblpatient where patient_id='" + request.getParameter("pantietId") + "'");
			while (rs.next()) {
				if (rs.getString("ambulance_status").equals("Pending")) {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set ambulance_status='Assigned' where patient_id='" + request.getParameter("pantietId") + "' and avn='"+request.getParameter("id")+"'");
				} else {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set ambulance_status='Pending' where patient_id='" + request.getParameter("pantietId") + "' and avn='"+request.getParameter("id")+"'");
				}
			}
			if (statusMode > 0) {
				response.sendRedirect("patient-request-driver-for-ambulance.jsp");
			} else {
				response.sendRedirect("patient-request-driver-for-ambulance.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
