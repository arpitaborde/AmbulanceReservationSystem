<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Ambulance Reservation System</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Colors CSS -->
<link rel="stylesheet" href="css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="host_version">
	<jsp:include page="header.jsp"></jsp:include><br>
	<div class="container">
		<!-- <div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Forgot Password</h4>
			</div>
		</div> -->
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12"></div>
			<div class="col-md-6 col-sm-6 col-xs-12">

				<div class="panel panel-info">
					<div class="panel-heading">Password Recovery</div>
					<%
						String email = request.getParameter("email");
						String password = null;
						ResultSet resultPassword = DatabaseConnection.getResultFromSqlQuery("select uname,upass from tblpatient where patient_email='" + email + "'");
						if (resultPassword.next()) {
							password = resultPassword.getString("upass");
					%>
					<div class="panel-body">
						<div class="form-group">
							<label>Your Password .: <font color="blue"><%=password%></font></label><br>
							<a href="patient-login.jsp">Click here to patient login</a>
						</div>
					</div>
					<%
						} else {
							String fail = "Your email id is wrong, unable to get password.";
							session.setAttribute("error", fail);
							response.sendRedirect("patient-forgot-password.jsp");
						}
					%>

				</div>
			</div>
		</div>
	</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});
</script>
<script>
	$(document).ready(function() {
		$("#btnValidate").click(function() {
			var txtEmail = $("#txtEmail").val();
			if (txtEmail === "") {
				$("#txtEmail").css("border-color", "red");

				alert("Your email id is mandatory.");
				return false;
			}
		});
	});
</script>
<script>
	$(document).ready(function(e) {
		$('#btnValidate').click(function() {
			var sEmail = $('#txtEmail').val();
			if ($.trim(sEmail).length === 0) {
				alert('Please enter valid email address');
				e.preventDefault();
			}
			if (validateEmail(sEmail)) {
				//alert('Email is valid');
			} else {
				alert('Invalid Email Address');
				e.preventDefault();
			}
		});
	});

	function validateEmail(sEmail) {
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(sEmail)) {
			return true;
		} else {
			return false;
		}
	}
</script>
</html>