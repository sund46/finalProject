<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>템플릿 만들기</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath }/template.do">템플릿 예제 1</a></li>
		<li><a href="${pageContext.request.contextPath }/template2.do">템플릿 예제 2</a></li>
		<li><a href="${pageContext.request.contextPath }/template3.do">템플릿 예제 3</a></li>
		<li><a href="${pageContext.request.contextPath }/template4.do">템플릿 만들기</a></li>
	</ul>
	
	
	

</body>
</html>