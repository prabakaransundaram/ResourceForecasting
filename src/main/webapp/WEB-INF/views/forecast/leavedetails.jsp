<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link
	href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>	
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<form:form name="userDetailsScreenVO" method="POST"
		action="leaveDetails" modelAttribute="userDetailsScreenVO">
		<div class="rowClass">
			<label class="fieldName"><spring:message code="project.name" /></label>
			<c:out value="${userDetailsScreenVO.projectId}" />
		</div>
		<div class="rowClass">
			<label class="fieldName"><spring:message code="location" /></label>
			<form:select id="location" path="location" class="location" style="width:150px">
				<form:option value="0">
					<spring:message code="select.a.location" />
				</form:option>
				<c:forEach items="${userDetailsScreenVO.location_list}"
					var="element">
					<form:option value="${element.location_id}">${element.locationName}</form:option>
				</c:forEach>
			</form:select>
		</div>
		<div id="indLoc" style="display: none;" class="rowClass">
			<label class="fieldName"><spring:message
					code="india.location" /></label>
			<form:radiobutton style="margin-left: 0px;" path="subLocation"
				id="subLocation" />
			<label for="chennai"><spring:message code="chennai.label" /></label>
			<form:radiobutton style="margin-left: 0px;" path="subLocation"
				id="subLocation" />
			<label for="bangalore"><spring:message code="bangalore.label" /></label>
			<form:radiobutton style="margin-left: 0px;" path="subLocation"
				id="subLocation" />
			<label for="hyderabad"><spring:message code="hyderabad.label" /></label>
		</div>

		<div class="rowClass">
			<label class="fieldName"><spring:message
					code="current.assignment" /></label>
			<form:select id="assignment" path="assignment" style="width:150px">
				<form:option value="">
					<spring:message code="select.a.assignment" />
				</form:option>
			</form:select>
		</div>
		<div class="rowClass" style="padding-top: 20px;">
			<input type="button" class="button" value="Next" name="next"
				onClick="showDiv()" />
		</div>
		<div id="showLeaveDetails" style="display: none">
			<table class="table table-hover small-text" id="tb">
				<tr class="tr-header">
					<th><spring:message code="associate.name" /></th>
					<th><spring:message code="associate.id" /></th>
					<th><spring:message code="no.of.days" /></th>
					<th><spring:message code="month" /></th>
					<th><spring:message code="from.date" /></th>
					<th><spring:message code="to.date" /></th>
					<th><spring:message code="total.hours" /></th>
					<th><spring:message code="working.hours" /></th>
					<th><a href="javascript:void(0);" style="font-size: 18px;"
						id="addMore" title="Add More Rows"><span
							class="glyphicon glyphicon-plus"></span></a></th>
				<tr>
					<td><c:out value="${userDetailsScreenVO.fullname}" /></td>
					<td><c:out value="${userDetailsScreenVO.empID}" /></td>
					<td><form:input path="noOfDays" maxlength="2" style="width:50px"/></td>
					<td class="rowClass"><form:select id="month"
							path="selectedMonth" class="month" style="width:120px;height:26.5px">
							<form:option value="">Select a Month</form:option>
							<c:forEach items="${userDetailsScreenVO.month_list}"
								var="element">
								<form:option value="${element.month_id}">${element.month_name}</form:option>
							</c:forEach>
						</form:select></td>
					<td><form:input path="fromDate" id="fromdatepicker"
							class="fromdatepicker" /></td>
					<td><form:input path="toDate" id="todatepicker"
							class="todatepicker" /></td>
					<td><form:input path="totalHrs" style="width:75px"/></td>
					<td><form:input path="workingHrs" style="width:75px"/></td>
					<td><a href='javascript:void(0);' class='remove'><span
							class='glyphicon glyphicon-remove'></span></a></td>
				</tr>
			</table>
			<div class="rowClass" style="padding-top: 20px;">
				<input type="submit" class="button" value="Apply Leave Details"
					name="leaveDetails" onClick="validateLeave(this.form);" /> <input
					type="button" class="button" value="Edit Leave Details"
					name="editLeaveDetails" onClick="validateLeave(this.form);" />
			</div>
		</div>
	</form:form>
</body>
<script type="text/javascript">

	$('.location').on('click', function () {
		var locname=$('#location').val();
		 if (locname == '3') {
	       
	            $('#indLoc').show();
	           
	        
	    } else {
	        $('#indLoc').hide();
	    }
	});
	
	$(function(){
	    $('#addMore').on('click', function() {    
	              var data = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
	              data.find("input").val('');
	     });
	     $(document).on('click', '.remove', function() {
	         var trIndex = $(this).closest("tr").index();
	            if(trIndex>1) {
	             $(this).closest("tr").remove();
	           } else {
	             alert("Sorry!! Can't remove first row!");
	           }
	      });
	}); 
	/* $( ".fromdatepicker" ).datepicker({
		stepMonths: 0,
	});

	$( ".todatepicker" ).datepicker({
		stepMonths: 0,
	});*/
	
	
	function showDiv() {
		   document.getElementById('showLeaveDetails').style.display = "block";
		}

	/*function getSubLocation() {
		var locname=$('#location').val();
	   	 $.ajax({type : "POST",
	   		data : {
	   			"method" : "Login",
	   			"value" : locname,
	   			"subloc" : "true",
	   			},
	   		url : '/login',
	   		success: function(result){
	         var value = result;
	        alert(value.length);
	               
	             
	         },
	    error: function() {
	     }     });
	     } */
	
	
	function validateLeave(myform){
		myform.action="leaveDetails?method=applyLeaveDetails";
		myform.submit(); 
	}
	
    jQuery(document).ready(function(){
   	  $("#location").change(function() {
   		$assignment = $("select[name='assignment']");
   		if ($(this).val() == "0") {
   			$("select[name='assignment'] option").remove();
			$("<option>Select a Assignment</option>")
					.appendTo($assignment);
   			}
   		else if ($(this).val() == 3) {
   			$("select[name='assignment'] option").remove();
			$("<option value='Offshore'>Offshore</option>")
					.appendTo($assignment);	
		}
	   	else
   		{
	   		$("select[name='assignment'] option").remove();
			$("<option value='Onsite'>Onsite</option>")
					.appendTo($assignment);
   		}
   	  });
   	});
</script>

<style type="text/css">
.rowClass {
	padding-top: 20px;
	padding-left: 95px;
}

.button {
	background-color: #47c9af;
	border: none;
	color: white;
	padding: 10px 15px 10px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 70px;
	cursor: pointer;
	border-radius: 14px;
}

.fieldName {
	text-align: left;
	font-size: 16px;
}
</style>
</html>