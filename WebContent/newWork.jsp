<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add work</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<form action="server" method="post">
			<h2>Add a new Job: </h2>
		Company:<input type="text" name="company"/><br>
		Title:	<input type="text" name="title"/><br>
		Tasks:	<input type="text" name="tasks"/><br>
				<input type="hidden" name="act" value="addWork"/>
				<input type="submit" value="add job"/>
	</form>
	<br><a href="viewer.jsp">cancel</a>

</body>
</html>