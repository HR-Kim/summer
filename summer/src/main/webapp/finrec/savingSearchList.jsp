<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userId = (String)session.getAttribute("id");
	
	if(null == session.getAttribute("id")){
		userId = null;
	} else {
		userId = session.getAttribute("id").toString();
	}
%>
<c:set var="userId" value="<%=userId%>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<link type="text/css" rel="stylesheet"
	href="/summer/finrec/paging/simplePagination.css" />
<script type="text/javascript"
	src="/summer/finrec/paging/jquery.simplePagination.js"></script>
<br>
<br>
<br>
<div class="container">
<div class = "form-inline pull-left">
	<h3>적금 검색</h3>

	<!-- 
						<input type = "radio"  name = "fin_recommend_type" value="consume" />소비데이터로 추천받기
						<input type = "radio" name = "fin_recommend_type" value = "direct" checked="checked" />직접 입력하여 추천받기
						<p>
						 -->
	<form name="searchFrm" id="searchFrm" method="get">
		<b>금리유형</b> <input type="radio" name="intrRateType" value="S" />단리 <input
			type="radio" name="intrRateType" value="M" />복리 <input type="radio"
			name="intrRateType" checked="checked"  value = "all"/>모두
		<p>
			<b>적립유형</b> <input type="radio" name="rsrvType" value="S" />정액적립식 <input
				type="radio" name="rsrvType" value="F" />자유적립식 <input type="radio"
				name="rsrvType" checked="checked"  value = "all"/>모두
		<p>
			<b>최소금리</b> <input type="text" class="form-control"
				name="intrRateMin" id="intrRateMin" maxlength="5" />
		<p>
			<b>최고우대금리</b> <input type="text" class="form-control"
				name="intrRateMax" id="intrRateMax" maxlength="5" />
	</form>
	<p>
		<button id="search" type="submit" class="btn btn-default mr-2"
			onclick="javascript:savingList(1);">검색</button>
</div>

<div class = "form-inline">
	<h3>적금 목록</h3>
	
	<div id="loadingImage" style="display: none">
		<img src="/summer/finrec/img/loadingImage.gif">
	</div>
	<div class="table-responsive" id="searchResult">
	
	
	</div>
	<div id="pageArea" class="form-inline pull-right"></div>
	
	<input type="hidden" id = "userId" value = "<%=session.getAttribute("id")%>"/>
</div>



<!--  totalCnt and pageNum -->
<input type = "hidden" id = "totalCnt"/>
<input type = "hidden" id = "pageNum"/>

</div> <!-- div container -->
<script type="text/javascript">
	var isEmpty = function(value) {
		if (value == ""
				|| value == null
				|| value == undefined
				|| (value != null && typeof value == "object" && !Object
						.keys(value).length)) {
			return true
		} else {
			return false;
		}
	}
	
	function savingDetail(finNo){
		
		finNo.substr(1);
		console.log('finNo=' + finNo);
		var frm = document.getElementById(finNo);
		frm.submit();
	}

	function addFinFav(finNo){
		var userId = $('#userId').val();
		console.log('userId='+userId);
		console.log(isEmpty(userId));
		if((isEmpty(userId))) {
			alert('로그인을 먼저 해주세요');
		}	
		else {
			console.log('로그인했어요');
			var frm = document.getElementById(finNo);
			frm.action = "/summer/finfavs/doAdd.do";
			$('.id').val(userId);
			console.log('id='+$('.id').val());
			frm.submit();
		} 	
	}
	function savingList(pageNum) {

		$("#loadingImage").show();

		//var dataToSend = $("form[name=searchFrm]").serialize();
		//console.log("dataToSend="+dataToSend);

		var intrRateChecked = $(':radio[name="intrRateType"]:checked').val();
		var rsrvTypeChecked = $(':radio[name="rsrvType"]:checked').val();
		var intrRateMin = $("#intrRateMin").val();
		var intrRateMax =  $("#intrRateMax").val();
		if(isEmpty(intrRateMin)) intrRateMin = -1;
		if(isEmpty(intrRateMax)) intrRateMax = -1;

		console.log("intrRateChecked=" + intrRateChecked);
		console.log("rsrvTypeChecked=" + rsrvTypeChecked);
		console.log("intrRateMin=" + intrRateMin);
		console.log("intrRateMax=" + intrRateMax);

		$
				.ajax({
					type : "POST",
					async : false,
					url : "/summer/finrec/saving/doSelectList.do",
					dataType : "html",
					data : {
						"intrRateType" : intrRateChecked,
						"rsrvType" : rsrvTypeChecked,
						"intrRateMin" : intrRateMin,
						"intrRateMax" : intrRateMax,
						"pageNum":pageNum
					},
					success : function(data) {//성공

						console.log('data=' + data);
						
						var table = document.getElementById('searchResult');
						if (data == '데이터 없음') { //해당 검색 결과 없음

						} else {
							var list = $.parseJSON(data);
							var tableText ='<table class="table table-striped table-bordered table-hover"><tbody>';
							for (i = 0; i < list.length; i++) {
								tableText = tableText
										+ '<tr><td>'
										+ list[i].korCoNm
										+ '<h4>'
										+ list[i].finPrdtNm
										+ '</h4>'
										+ list[i].intrRateTypeNm
										+ ' | '
										+ list[i].rsrvTypeNm
										+ '</td><td>'
										+'<form id="f' + list[i].finPrdtCd + '" action = "doSelectOne.do" method = "get">'
										+  '<input type="hidden" class = "id" name = "id" ></input>'
										+ '<input type="hidden" name = "finPrdtCd" value="' + list[i].finPrdtCd + '"></input></form>'
										+ '<button type="submit" class="btn btn-light btn-fw" onclick="javascript:savingDetail(\'f' +  list[i].finPrdtCd +   '\');">상세보기</button>'
										+'<c:choose><c:when test="${userId ne null}">'
										+ '&nbsp; &nbsp; <button type="submit" class="btn btn-primary btn-fw" onclick="javascript:addFinFav(\'f' + list[i].finPrdtCd + '\');">즐겨찾기</button>'
										+'</c:when></c:choose>'
										+"</td></tr>";
							}
							tableText = tableText + '</tbody></table>';
							table.innerHTML = tableText;
							//console.log('tableText='+tableText);
							
							$("#totalCnt").val(list[0].totalCnt);
							console.log('totalCnt:'+$("#totalCnt").val());
							paging(pageNum);
							
						}//--if-else

					},
					complete : function(data) {//무조건
						console.log('data=' + data);
						$("#loadingImage").hide();

					},
					error : function(xhr, status, error) {//실패시
						console.log("실패 |" + error);
					}
				});//ajax

	}//--savingList

	function paging(pageNum) {
			var totalCnt = $("#totalCnt").val();
			console.log("pageNum="+pageNum);
		
		$('#pageArea').pagination({
			items : totalCnt,
			itemsOnPage : 5,
			currentPage : pageNum,
			cssStyle : 'light-theme',
			onPageClick : function(pageNum) {
				savingList(pageNum);
			}
		});

	}//--paging

//	$(document).ready(function() {
//		alert("ready?");
//	});
</script>
