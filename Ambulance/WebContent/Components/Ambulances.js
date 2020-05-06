// hide the divisions used to show the status messages on the page load
$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide(); 
}); 

//Save button 
$(document).on("click", "#btnSave", function(event)
{
	// Clear status msgesx
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
		 
	// Form validation
	var status = validateAmbulancesForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid
	//$("#formAmbulances").submit();
	var type = ($("#hidAmb_IDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
			{
			 url : "AmbulancesAPI",
			 type : type,
			 data : $("#formAmbulances").serialize(),
			 dataType : "text",
			 complete : function(response, status)
			 {
				 onAmbulancesSaveComplete(response.responseText, status);
			 }
			});
});

function onAmbulancesSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divAmbulancesGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidAmb_IDSave").val("");
	$("#formAmbulances")[0].reset(); 
}

//CLIENTMODEL
function validateAmbulancesForm()
{


	if ($("#H_ID").val().trim() == "")
	{
		return "Hospital ID";
	} 
	if ($("#Admin_Id").val().trim() == "")
	{
		return "Insert Admin ID";
	}
	if ($("#Amb_No").val().trim() == "")
	{
		return "Insert Ambulance No";
	}
	
	if ($("#Amb_Cont").val().trim() == "")
	{
		return "Insert Ambulance Contact";
	}
	if ($("#Driver_Name").val().trim() == "")
	{
		return "Insert Driver name";
	}
	if ($("#Ride_Date").val().trim() == "")
	{
		return "Insert ride date";
	}

	return true;
}



//update button
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidAmb_IDSave").val($(this).closest("tr").find('#hidAmb_IDUpdate').val());
	//$("#Amb_ID").val($(this).closest("tr").find('td:eq(0)').text());
	$("#H_ID").val($(this).closest("tr").find('td:eq(0)').text());
	$("#Admin_Id").val($(this).closest("tr").find('td:eq(1)').text());
	$("#Amb_No").val($(this).closest("tr").find('td:eq(2)').text());
	$("#Amb_Cont").val($(this).closest("tr").find('td:eq(3)').text());
	$("#Driver_Name").val($(this).closest("tr").find('td:eq(4)').text());
	$("#Ride_Date").val($(this).closest("tr").find('td:eq(5)').text());
});



//DELETE
$(document).on("click", ".btnRemove", function(event) {  
	
	$.ajax(  {   
		
		url : "AmbulancesAPI",   
		type : "DELETE",   
		data : "Amb_ID=" + $(this).data("amb_id"),   
		dataType : "text",   
		complete : function(response, status)   {    
			onAmbulancesDeleteComplete(response.responseText, status);   
			
		}  
	}); 
	
}); 

function onAmbulancesDeleteComplete(response, status) {  
	
	if (status == "success")  {   
		
		var resultSet = JSON.parse(response); 

			if (resultSet.status.trim() == "success")   {    
				
				$("#alertSuccess").text("Successfully deleted.");    
				$("#alertSuccess").show(); 
				$("#divAmbulancesGrid").html(resultSet.data);   
				
			} else if (resultSet.status.trim() == "error")   {    
				
				$("#alertError").text(resultSet.data);    
				$("#alertError").show();   
				
			} 

	} else if (status == "error")  {   
		
		$("#alertError").text("Error while deleting.");   
		$("#alertError").show();  
		
	} else  {   
		
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show();  
		
	} 
	
}

