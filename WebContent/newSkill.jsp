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
			<h2>Add a new skill: </h2>
		skill: 	<input type="text" name="skill"/><br>
		level: 	<input type="text" name="level"/><br>
				<input type="hidden" name="act" value="addSkill"/>
				<input type="submit" value="add Skill"/>
	</form>
	<br><a href="viewer.jsp">cancel</a>

</body>
</html>