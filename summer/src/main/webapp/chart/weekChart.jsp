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
    	<title>:::(주/월)차트 테스트:::</title>
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
		<h3>**Chart 테스트**</h3>
		<table class="table">
			<tr>
				<td class="text-left">
					<!-- Button -->
					<div class ="form-inline pull-left">
						<button class="btn btn-sm" onclick="javascript:doWeekMonthChart();">차트주/월간</button>
						<button class="btn btn-sm" onclick="javascript:makeWeekSelectOptions();">주별날짜</button>
					</div>
					<!-- //Button -->
				</td>
			</tr>
		</table>

		<div>
			<select name="sh_year" id="sh_year" onchange="makeWeekSelectOptions();">
			<option value='2013'>2013년</option>
			<option value='2014'>2014년</option>
			<option value='2015'>2015년</option>
			<option value='2016'>2016년</option>
			<option value='2017'>2017년</option>
			<option value='2018' selected='selected'>2018년</option>
			</select>

			<select name="sh_month" id="sh_month" onchange="makeWeekSelectOptions();">
			<option value='01'>01월</option>
			<option value='02'>02월</option>
			<option value='03'>03월</option>
			<option value='04'>04월</option>
			<option value='05'>05월</option>
			<option value='06' selected='selected'>06월</option>
			<option value='07'>07월</option>
			<option value='08'>08월</option>
			<option value='09'>09월</option>
			<option value='10'>10월</option>
			<option value='11'>11월</option>
			<option value='12'>12월</option>
			</select>

			<select name="sh_week" id="sh_week" onchange="javascript:changeWeekSelectOptions();">
			</select>
		</div>

		<div id="weekMonthPieChart" style="width: 900px; height: 500px;"></div>

		<div id="monthBarChart" style="width: 800px; height: 600px;"></div>

		<!-- List -->
		<div class="table-responsive">
			<form name="frmEdit" id="frmEdit" method="get">
				<input type="hidden"  name="chartUserId"  id="chartUserId" />
				<table style="display:none" id="listTable" class="table table-striped table-bordered table-hover">
					<thead class="bg-primary">
						<th class="text-center">월</th>
						<th class="text-center">총액</th>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${list.size()>0}">
							<c:forEach var="Chart" items="${list}">
								<tr>
									<td class="text-center">${Chart.month}</td>
									<td class="text-right">${Chart.monthTotal}</td>
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
			['Month', 'Total per Month'],
          	['${list.get(0).month}', ${list.get(0).monthTotal}],
          	['${list.get(1).month}', ${list.get(1).monthTotal}],
          	['${list.get(2).month}', ${list.get(2).monthTotal}],
          	['${list.get(3).month}', ${list.get(3).monthTotal}],
          	['${list.get(4).month}', ${list.get(4).monthTotal}],
			['${list.get(5).month}', ${list.get(5).monthTotal}],
			['${list.get(6).month}', ${list.get(6).monthTotal}],
			['${list.get(7).month}', ${list.get(7).monthTotal}],
			['${list.get(8).month}', ${list.get(8).monthTotal}],
			['${list.get(9).month}', ${list.get(9).monthTotal}],
			['${list.get(10).month}', ${list.get(10).monthTotal}],
			['${list.get(11).month}', ${list.get(11).monthTotal}]
		]);

		var options = {
			title: '나의 지출 패턴'
		};
		var chart = new google.visualization.PieChart(document.getElementById('weekMonthPieChart'));
		chart.draw(data, options);
	};

    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawStuff);

	function drawStuff() {
		var data = new google.visualization.arrayToDataTable([
			['Month', 'Total per Month'],
          	['${list.get(0).month}', ${list.get(0).monthTotal}],
          	['${list.get(1).month}', ${list.get(1).monthTotal}],
          	['${list.get(2).month}', ${list.get(2).monthTotal}],
          	['${list.get(3).month}', ${list.get(3).monthTotal}],
          	['${list.get(4).month}', ${list.get(4).monthTotal}],
			['${list.get(5).month}', ${list.get(5).monthTotal}],
			['${list.get(6).month}', ${list.get(6).monthTotal}],
			['${list.get(7).month}', ${list.get(7).monthTotal}],
			['${list.get(8).month}', ${list.get(8).monthTotal}],
			['${list.get(9).month}', ${list.get(9).monthTotal}],
			['${list.get(10).month}', ${list.get(10).monthTotal}],
			['${list.get(11).month}', ${list.get(11).monthTotal}]
      ]);

      var options = {
        width: 800,
        legend: { position: 'none' },
        chart: {
          title: '',
          subtitle: '' },
        axes: {
          x: {
            0: { side: 'top'} // Top x-axis.
          }
        },
        bar: { groupWidth: "90%" }
      };
      var chart = new google.charts.Bar(document.getElementById('monthBarChart'));
      // Convert the Classic options to Material options.
      chart.draw(data, google.charts.Bar.convertOptions(options));
    };

	function doWeekMonthChart(){
		var frmEdit = document.frmEdit;
		frmEdit.action = "doCtgChart.do";
		frmEdit.submit();
	};

	function makeWeekSelectOptions() {
		var year = document.getElementById("sh_year").value;
		var month = document.getElementById("sh_month").value;
		var today = new Date();

		var sdate = new Date(year, month-1, 01);
		var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth()+1, 0)).getDate();
		var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);

		var week = sdate.getDay();
		sdate.setDate(sdate.getDate() - week);
		var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());

		var obj = document.getElementById("sh_week");
		obj.options.length = 0;
		var seled = "";
		while(endDate.getTime() >= edate.getTime()) {
			var sYear = sdate.getFullYear();
			var sMonth = (sdate.getMonth()+1);
			var sDay = sdate.getDate();

			sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
			sDay = (sDay < 10) ? "0"+sDay : sDay;

			var stxt = sYear + "-" + sMonth + "-" + sDay;

			edate.setDate(sdate.getDate() + 6);

			var eYear = edate.getFullYear();
			var eMonth = (edate.getMonth()+1);
			var eDay = edate.getDate();

			eMonth = (eMonth < 10) ? "0"+eMonth : eMonth;
			eDay = (eDay < 10) ? "0"+eDay : eDay;

			var etxt = eYear + "-" + eMonth + "-" + eDay;

			if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
				seled = stxt+"|"+etxt;
			}

			obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);

			sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
			edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
		}	
		if(seled) obj.value = seled;
		changeWeekSelectOptions();
	}

	function changeWeekSelectOptions() {
		var sValue = document.getElementById("sh_week").value;
		alert(sValue);
	};
  </script>
</body>
</html>