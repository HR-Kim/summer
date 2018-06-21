<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--CONTEXT --%>
<c:set var = "CONTEXT"  value = "${pageContext.request.contextPath}"></c:set>

  <link rel="stylesheet" href="${CONTEXT}/resources/theme/css/style.css">
<title>***<tiles:getAsString name="title"/>***</title>
</head>
<body>
<div class="container-scroller">
<tiles:insertAttribute name = "header" />
<div class="container-fluid page-body-wrapper">
      <div class="row row-offcanvas row-offcanvas-right">
		      <tiles:insertAttribute name = "menu" />
		      
		       <div class="content-wrapper">
        	<tiles:insertAttribute name = "body" />
				</div>
		</div> <!--  row row-offcanvas ends -->
		</div> <!--  container-fluid page-body-wrapper ends -->
		</div> <!--  container-scroller ends -->
						
		      
</body>
</html>