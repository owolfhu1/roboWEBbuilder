<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>${resume.getName()}</h1>
<h2>${resume.getEmail()}</h2>

${body}


<br>
<a href="newEdu.jsp">add an education field</a><br>
<a href="newWork.jsp">add a work field</a><br>
<a href="newSkill.jsp">add a skill field</a><br>
</body>
</html>