package AmbulanceService.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/AmbulancesAPI")
public class AmbulancesAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Ambulances AmbulancesObj = new Ambulances();

	public AmbulancesAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException
			{
			 String output = AmbulancesObj.insertAmbulances(
			request.getParameter("H_ID"),
			request.getParameter("Admin_Id"),
			request.getParameter("Amb_No"),
			request.getParameter("Amb_Cont"),
			request.getParameter("Driver_Name"),
			request.getParameter("Ride_Date"));
			response.getWriter().write(output);
			}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	
	
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		
	{
		Map paras = getParasMap(request);
		System.out.println("ID: ");
		System.out.println("ID: "+paras.get("hidAmb_IDSave").toString());
		String output = AmbulancesObj.updateAmbulances(
				
		paras.get("hidAmb_IDSave").toString(),
		paras.get("H_ID").toString(),
		paras.get("Admin_Id").toString(),
		paras.get("Amb_No").toString(),
		paras.get("Amb_Cont").toString(),
		paras.get("Driver_Name").toString(),
		paras.get("Ride_Date").toString());
		
		response.getWriter().write(output);
		}


	
	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	
	/*
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	// TODO Auto-generated method stub
	{
		Map paras = getParasMap(request);
		String output = AmbulancesObj.deleteAmbulances(paras.get("Amb_ID").toString());
		response.getWriter().write(output);
	}
	*/

	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			String[] params = queryString.split("&");
			for (String param : params) {

				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {
		}
		return map;
	}

	
	
}


