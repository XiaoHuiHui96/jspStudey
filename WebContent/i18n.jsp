<%@page import="java.util.ResourceBundle"%>
<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<title>国际化测试</title>
</head>
<%
	//request.getLocale()获取访问用户所在的国家地区
	ResourceBundle myResourcesBundle=ResourceBundle.getBundle("myproperties.myproperties",request.getLocale());
%>
<body>
	<form>
		<%=myResourcesBundle.getString("username") %>: <%=myResourcesBundle.getString("password") %>
	</form>

<fmt:setBundle basename="myproperties.myproperties"  var="bundle"/>
<fmt:message bundle="${bundle }" key="username"></fmt:message> : <fmt:message bundle="${bundle }" key="password"></fmt:message>
</body>
</html>