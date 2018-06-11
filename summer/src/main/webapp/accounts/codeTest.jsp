
<%@page import="com.summer.comm.DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.summer.codes.dao.CodeDao"%>
<%@page import="com.summer.codes.domain.CodeVO"%>
<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
Logger log = LoggerFactory.getLogger(this.getClass());



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  	<form class="form-inline" name="frm1" id="frm1" method="get">
  		<button class="btn btn-sm btn-success" onclick="javascript:doSearch();">조회</button>
  	</form>

  	<!-- List ------------------------------------------------------------->
  
	     <div class="table-responsive">
	     	

	        		
	       	<c:choose>
	        		<c:when test="${list.size()>0 }">
			        		<select name="trade_id" id="trade_id">
				        		<c:forEach var="code" items="${list }">
				        			<option value="${code.cdDtlNm }">${code.cdDtlNm}</option>
				        		</c:forEach>
			        		</select>
		         	</c:when>
	         </c:choose>
	         	

	        
	      </div>
	    

   <!--// List ----------------------------------------------------------->


<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		//리스트 조회
		function doSearch(){
			var frm = document.frm1;
			
			frm.action = "do_selectList.do";
			
			frm.submit();
		}
		
		</script>

</body>
</html>