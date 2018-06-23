<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 	//로그인 세션 처리
	//String id = "testuser";
	String id = null;
	
	if (session.getAttribute("id") == null) {
		response.sendRedirect("http://localhost:8080/summer/user/login.jsp");
	} else {
		id = session.getAttribute("id").toString();
	}
%>
<div class = "container">

<h3>즐겨찾기 목록 페이지</h3>
${list}<p>
로그인ID : <%= id %>

</div>