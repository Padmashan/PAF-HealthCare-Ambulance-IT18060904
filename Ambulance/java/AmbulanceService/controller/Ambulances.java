package AmbulanceService.controller;

import java.sql.*;

public class Ambulances {
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/paf_project", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public String readAmbulances()
	 {
	 String output = "";
	 try
	 {
	 Connection con = connect();
	 if (con == null)
	 {
	 return "Error while connecting to the database for reading.";
	 }
	// Prepare the html table to be displayed
	 output = "<table border='1'><tr><th>H_ID</th>"
	 + "<th>Admin_Id</th>"
	 + "<th>Amb_No</th>"	
	 + "<th>Amb_Cont</th>"
	 + "<th>Driver_Name</th>"
	 + "<th>Ride_Date</th>"+" "
	 + "<th>Update</th>"+ 
	 "<th>Remove</th></tr> ";
	 		

	 
	 String query = "select * from ambulance_service";
			 Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(query);
			 // iterate through the rows in the result set
			 while (rs.next())
			 {
			 String Amb_ID = Integer.toString(rs.getInt("Amb_ID"));
			 String H_ID = Integer.toString(rs.getInt("H_ID"));
			 String Admin_Id = Integer.toString(rs.getInt("Admin_Id"));
			 String Amb_No = rs.getString("Amb_No");
			 String Amb_Cont = Integer.toString(rs.getInt("Amb_Cont"));
			 String Driver_Name = rs.getString("Driver_Name");
			 String Ride_Date = rs.getString("Ride_Date");
			// Add into the html table
			
			 output += "<tr><td><input id='hidAmb_IDUpdate'        "
			   		  + "name='hidAmb_IDUpdate'          "
			   		  + "type='hidden' value='" + Amb_ID
			   		  + "'>"  + H_ID +   "</td>";  
			 
			 output += "<td>" + Admin_Id + "</td>";
			 output += "<td>" + Amb_No + "</td>";
			 output += "<td>" + Amb_Cont + "</td>";
			 output += "<td>" + Driver_Name + "</td>"; 
			 output += "<td>" + Ride_Date + "</td>"; 
			
			// buttons
			 output += "<td><input name='btnUpdate' type='button' "
			+ "value='Update'"
			+ "class='btnUpdate btn btn-secondary'></td> "
			+ "<td><input name='btnRemove' type='button' "
			+ "value='Remove'"
			+" class='btnRemove btn btn-danger' data-Amb_ID='"
			+ Amb_ID + "'>" + "</td></tr>"; 
			 
			 }
			 con.close();
			 // Complete the html table
			 output += "</table>";
			 }
			 catch (Exception e)
			 {
			 output = "Error while reading the items.";
			 System.err.println(e.getMessage());
			 }
			 return output;
			 }

	public String insertAmbulances(String H_ID, String Admin_Id, String Amb_No, String Amb_Cont,
			String Driver_Name , String Ride_Date) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = " insert into ambulance_service (`Amb_ID`,`H_ID`,`Admin_Id`,`Amb_No`,`Amb_Cont`, `Driver_Name` , `Ride_Date`)"
					+ " values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setInt(2, Integer.parseInt(H_ID));
			preparedStmt.setInt(3, Integer.parseInt(Admin_Id));
			preparedStmt.setString(4, Amb_No);
			preparedStmt.setInt(5, Integer.parseInt(Amb_Cont));
			preparedStmt.setString(6, Driver_Name);
			preparedStmt.setString(7, Ride_Date);
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newAmbulances = readAmbulances();
			output = "{\"status\":\"success\", \"data\": \"" + newAmbulances + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the Ambulances.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updateAmbulances(String Amb_ID, String H_ID, String Admin_Id, String Amb_No,
			String Amb_Cont, String Driver_Name , String Ride_Date) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE ambulance_service SET H_ID=?,Admin_Id=?,Amb_No=?,Amb_Cont=?, Driver_Name=? , Ride_Date=? WHERE Amb_ID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, H_ID);
			preparedStmt.setString(2, Admin_Id);
			preparedStmt.setString(3, Amb_No);
			preparedStmt.setString(4, Amb_Cont);
			preparedStmt.setString(5, Driver_Name);
			preparedStmt.setString(6, Ride_Date);
			preparedStmt.setInt(7, Integer.parseInt(Amb_ID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newAmbulances = readAmbulances();
			output = "{\"status\":\"success\", \"data\": \"" + newAmbulances + "\"}";
		} catch (Exception e) {
			System.out.println("error is "+e);
			output = "{\"status\":\"error\", \"data\": \"Error while updating the Ambulance.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	
	public String deleteAmbulances(String Amb_ID) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "delete from ambulance_service where Amb_ID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(Amb_ID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newAmbulances = readAmbulances();
			output = "{\"status\":\"success\", \"data\": \"" + newAmbulances + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
}