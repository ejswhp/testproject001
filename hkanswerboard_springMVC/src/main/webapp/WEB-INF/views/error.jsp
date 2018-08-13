<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류 화면</title>
</head>
<body>
<h2>시스템 오류.(내용:${msg})</h2>
<h3>관리자에게 문의하세요.</h3>
<a href="index.jsp">메인으로 이동</a>
</body>
</html>