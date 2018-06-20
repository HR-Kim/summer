<%@page import="com.summer.chart.dao.ChartDao"%>
<%@page import="com.summer.chart.domain.Chart"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
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

<%-- CONTEXT --%>
<c:set var="CONTEXT" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
 	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    	<title>:::(일)차트 테스트:::</title>
    	<!-- 부트스트랩 -->
    	<link href="${CONTEXT}/resources/css/bootstrap.min.css" rel="stylesheet">
    	<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    	<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    	<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    	<![endif]-->
	</head>
<body>
	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/jquery-dropdate.js"></script>
	<script src="${CONTEXT}/resources/js/date.format.js"></script>

	<h3>**Chart 리스트 테스트**</h3>
	<table class="table">
		<tr>
			<td class="text-left">
				<!-- Button -->
				<div class ="form-inline pull-left">
					<button class="btn btn-sm" onclick="javascript:doDayList();">차트일간</button>
				</div>
				<!-- //Button -->
			</td>
		</tr>
	</table>

	<form align="center">
  		<button type="button" class="show">Show</button>
	</form>

	<input type="text" name="birthday" value="" class="dropdate">
	<script>
	$(document).ready(function(){
		$('.dropdate').dropdate({
			dateFormat:'mm/dd/yyyy'
		});
	});

	$(document).on('click', '.show', function(e){
	    alert('Result: ' + $('.dropdate').val());
	});	

	/* $(document).on('click', '.show', function(e){
	    var date = $('.dropdate').val()
	    var year = date.substring(0,3);
	    var month = date.substring(5,6);
	    var day = date.substring(8,9);

	    $.ajax({
	         type:"GET",
	         url:"doCtgList.do",
	         dataType:"html",
	         async: false,

	         data:{
   		         "year"		: year,
   		      	 "month"	: month,
   		   		 "day"		: day
	         },

	         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
	        	 console.log("삭제 성공");

		         	//json parsing
	         		var parseData = $.parseJSON(data);

					if(parseData.msgId == "1"){
						alert(parseData.message);
					}else {
						alert(parseData.message);
					}
	         },

	         complete: function(data){//무조건 수행
	         },

	         error: function(xhr,status,error){
	         }

	    }); //--ajax
	}); */

	</script>

	<div id="dayPieChart" style="width: 900px; height: 500px;"></div>

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
								<td class="text-right">${Chart.percent}%</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		</form>

	</div>
	<!-- //List -->

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Category_Nm', 'Total per category'],
          	['${list.get(0).cdDtlNm}', ${list.get(0).ctgTotal}],
          	['${list.get(1).cdDtlNm}', ${list.get(1).ctgTotal}],
          	['${list.get(2).cdDtlNm}', ${list.get(2).ctgTotal}],
          	['${list.get(3).cdDtlNm}', ${list.get(3).ctgTotal}],
          	['${list.get(4).cdDtlNm}', ${list.get(4).ctgTotal}],
			['${list.get(5).cdDtlNm}', ${list.get(5).ctgTotal}],
			['${list.get(6).cdDtlNm}', ${list.get(6).ctgTotal}],
			['${list.get(7).cdDtlNm}', ${list.get(7).ctgTotal}],
			['${list.get(8).cdDtlNm}', ${list.get(8).ctgTotal}],
			['${list.get(9).cdDtlNm}', ${list.get(9).ctgTotal}],
			['${list.get(10).cdDtlNm}', ${list.get(10).ctgTotal}],
			['${list.get(11).cdDtlNm}', ${list.get(11).ctgTotal}],
			['${list.get(12).cdDtlNm}', ${list.get(12).ctgTotal}],
			['${list.get(13).cdDtlNm}', ${list.get(13).ctgTotal}],
			['${list.get(14).cdDtlNm}', ${list.get(14).ctgTotal}]
		]);

		var options = {
			title: '나의 지출 패턴'
		};

		var chart = new google.visualization.PieChart(document.getElementById('dayPieChart'));
		chart.draw(data, options);
	};

	function doDayList(){
		var frm = document.frm;
		frm.action = "doCtgList.do";		
		frm.submit();
		//--ajax
	}
	</script>
</body>
</html>