<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===========================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===========================");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>**Chart 리스트 테스트**</h3>
	
	<!-- Button -->
	<div class ="form-inline pull-left">
		<button class="btn btn-sm" onclick="javascript:doCtgList();">차트일간</button>
		<button class="btn btn-sm" onclick="javascript:doCtgList();">차트주/월간</button>
	</div>
	<!-- //Button -->
	
	<!-- List -->
	<div class="table-responsive">
		<form name="frm" id="frm" method="get">
			<input type="hidden"  name="chartUserId"  id="chartUserId" />
		<table id="listTable" class="table table-striped table-bordered table-hover">
			<thead class="bg-primary">
				<th class="text-center">분류</th>
				<th class="text-center">총액</th>
				<th class="text-center">퍼센트</th>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size()>0}">
						<c:forEach var="Chart" items="${list}">
							<tr>
								<td class="text-left">${Chart.cdDtlNm}</td>
								<td class="text-center">${Chart.ctgTotal}</td>
								<td class="text-right">${Chart.percent}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		</form>
	</div>
	<!-- //List -->
	
	<script type = "text/javascript">
		function doCtgList(){
			alert("doCtgList 누름")
			var frm = document.frm;
			frm.action = "doCtgList.do";
	 		frm.submit();
		}
	</script>
</body>
</html>