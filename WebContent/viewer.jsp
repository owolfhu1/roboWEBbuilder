<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>resume editor</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
			.dropbtn { background-color: #4CAF50; color: white; padding: 16px; font-size: 16px; border: none; cursor: pointer; }
			.dropbtn:hover, .dropbtn:focus { background-color: #3e8e41; }
			.dropdown { position: absolute; display: inline-block; left: 400px; }
			.dropdown-content { display: none; position: absolute; background-color: #f9f9f9; min-width: 160px;
				 overflow: auto; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); right: 0; z-index: 1; }
			.dropdown-content a { color: black; padding: 12px 16px; text-decoration: none; display: block; }
			.dropdown a:hover { background-color: #f1f1f1 }
			.show { display:block; }
		</style>
	</head>
	<body>
		<div class="dropdown">
		<button onclick="myFunction()" class="dropbtn" style="width: 200px;">click for options</button>
 		<div id="myDropdown" class="dropdown-content">
			<button style="width: 200px;" onclick="location.href='newEdu.jsp';">add an education field</button><br>
			<button style="width: 200px;" onclick="location.href='newWork.jsp';">add a work field</button><br>
			<button style="width: 200px;" onclick="location.href='newSkill.jsp';">add a skill field</button><br>
			<form action="server" method="post">
				<input type="hidden" name="act" value="xEdu">
				<input style="width: 200px;" type="submit" value="delete an education">
			</form>
			<form action="server" method="post">
				<input type="hidden" name="act" value="xWork">
				<input style="width: 200px;" type="submit" value="delete a work">
			</form>
			<form action="server" method="post">
				<input type="hidden" name="act" value="xSkill">
				<input style="width: 200px;" type="submit" value="delete a skill">
			</form>
			<form action="server" method="post">
				<input type="hidden" name="act" value="save">
				<input style="width: 200px;" type="submit" value="save and quit">
			</form>
			<form action="server" method="post">
				<input type="hidden" name="act" value="delete">
				<input style="width: 200px;" type="submit" value="delete resume">
			</form>
			<form action="server" method="post">
				<input type="hidden" name="act" value="print">
				<input style="width: 200px;" type="submit" value="save and print">
			</form>
			<form action="server" method="post">
				<input type="hidden" name="act" value="logout">
				<input style="width: 200px;" type="submit" value="discared changes and quit">
			</form>
		</div></div>
			<h1>${resume.getName()}</h1>
			<h2>${resume.getEmail()}</h2>
			${body}
		<script>
		function myFunction() { document.getElementById("myDropdown").classList.toggle("show"); }
		window.onclick = function(event) { 
			if (!event.target.matches('.dropbtn')) {
			    var dropdowns = document.getElementsByClassName("dropdown-content");
			    var i;
			    for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
					  openDropdown.classList.remove('show');
					}
			    }
		  	}
		}
		</script>
	</body>
</html>