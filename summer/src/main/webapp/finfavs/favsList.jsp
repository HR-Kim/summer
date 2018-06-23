<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class = "container">

<h3>즐겨찾기 목록 페이지</h3>
${list}<p>
session값은 뭐냐 <%= session.getAttribute("id")%>
</div>