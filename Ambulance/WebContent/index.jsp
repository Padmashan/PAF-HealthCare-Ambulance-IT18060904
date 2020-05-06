
    
  <%@page import="AmbulanceService.controller.Ambulances"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ambulance Details</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Ambulances.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Ambulance Details</h1>
				<form id="formAmbulances" name="formAmbulances">
				
					Hospital ID: <input id="H_ID" name="H_ID" type="text"
						class="form-control form-control-sm"> <br>
					Admin ID: <input id="Admin_Id" name="Admin_Id" type="text"
						class="form-control form-control-sm"> <br>
					Ambulance No : <input id="Amb_No" name="Amb_No"
						type="text" class="form-control form-control-sm"> <br>
					Ambulance Contact : <input id="Amb_Cont" name="Amb_Cont"
						type="text" class="form-control form-control-sm"> <br>
					Driver Name: <input id="Driver_Name"
						name="Driver_Name" type="text"
						class="form-control form-control-sm"> <br> 
					Ride Date : <input id="Ride_Date" name="Ride_Date"
						type="text" class="form-control form-control-sm"> <br>
						
						<input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> 
						
						<input type="hidden"
						id="hidAmb_IDSave" name="hidAmb_IDSave" value="">
						
			
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divAmbulancesGrid">
				<%
					Ambulances AmbulancesObj = new Ambulances();
					out.print(AmbulancesObj.readAmbulances());
					%>
				</div>

			</div>
		</div>
	</div>

</body>
</html>