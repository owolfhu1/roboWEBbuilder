<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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