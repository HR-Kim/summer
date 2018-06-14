<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===================================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===================================");
	
	String pageSize = "10";//페이지 사이즈
	String pageNum  = "1";//현재 페이지
	String searchWord ="";//검색어
	String searchDiv ="";//검색구분
	
	int totalCnt = 0;
	int bottomCount = 10;
	
	SearchVO searchVO = new SearchVO();
	
	if(null != request.getAttribute("searchVO")){
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("searchVO:"+searchVO.toString());
	
	pageSize = StringUtil.nvl(searchVO.getPageSize(),"10");
	pageNum = StringUtil.nvl(searchVO.getPageNum(),"1");
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
	
	int o_pageSize = Integer.parseInt(pageSize);
	int o_pageNum = Integer.parseInt(pageNum);
	
	String o_TotalCnt = (null == request.getAttribute("totalCnt"))?"0":request.getAttribute("totalCnt").toString();
	totalCnt = Integer.parseInt(o_TotalCnt);
	
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>:::사용자 관리:::</title>

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
	<div class="container">
		<!-- Title-------------------------------------------- -->
		 <h3>회원관리</h3>
		<!--// Title------------------------------------------ -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-success btn-sm" onclick="javascript:doSearch();">조회</button>
		 	<!-- <button class="btn btn-success btn-sm" id="do_upsert">등록</button> -->
		 	<!-- <button class="btn btn-success btn-sm" id="do_save">등록</button>
		 	<button class="btn btn-success btn-sm" id="do_update">수정</button>-->
		 	<!-- <button class="btn btn-success btn-sm" id="do_delete">삭제</button> -->
		 	<!-- <button class="btn btn-success btn-sm" onclick="javascript:doExcelDown();">엑셀다운</button> -->
		 </div>
		<!--// Button------------------------------------------ -->

		<!-- Search------------------------------------------- -->
		<form class="form-inline" name="frm" id="frm" method="get">
			<input type="hidden" name="pageNum" id="pageNum"
				value="${searchVO.pageNum}" />
			<table class="table">
				<tr>
					<td class="text-center">구분
						<div class="form-group col-lg6 col-sm6">
							<select name="searchDiv" id="searchDiv" class="form-control input-sm">
								<option value="">전체</option>
								<option value="10"
									<c:if test="${searchVO.searchDiv == '10'}">selected='selected'</c:if>>ID</option>
								<option value="20"
									<c:if test="${searchVO.searchDiv == '20'}">selected='selected'</c:if>>이름</option>
							</select> 
							<input type="text" class="form-control input-sm" name="searchWord" id="searchWord" value="${searchVO.searchWord}" />
							<select name="pageSize" id="pageSize" class="form-control input-sm">
								<option value="10"
									<c:if test="${searchVO.pageSize == '10'}">selected='selected'</c:if>>10</option>
								<option value="30"
									<c:if test="${searchVO.pageSize == '30'}">selected='selected'</c:if>>30</option>
								<option value="50"
									<c:if test="${searchVO.pageSize == '50'}">selected='selected'</c:if>>50</option>
								<option value="100"
									<c:if test="${searchVO.pageSize == '100'}">selected='selected'</c:if>>100</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<!--// Search----------------------------------------- -->

		<!-- List--------------------------------------------  -->
		<div class="table-responsive">
			<table id="listTable" class="table  table-striped table-bordered table-hover">
				<thead class="bg-primary">
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">이름</th>
						<th class="text-center">별명</th>
						<th class="text-center">성별</th>
						<th class="text-center">생년월일</th>
						<th class="text-center">이메일</th>
						<th class="text-center">연락처</th>
						<th class="text-center">등급</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size()>0 }">
							<c:forEach var="userVO" items="${list}">
								<tr>
									<td class="text-center">${userVO.id}</td>
									<td class="text-left">${userVO.name}</td>
									<td class="text-left">${userVO.nickname}</td>
									<td class="text-left">${userVO.gender}</td>
									<td class="text-right">${userVO.birth}</td>
									<td class="text-left">${userVO.email}</td>
									<td class="text-right">${userVO.phone}</td>
									<td class="text-right">${userVO.grade}</td>
									<td class="text-center">${userVO.regdt}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="99" class="text-center">등록된 게시글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!--// List------------------------------------------  -->
		
		<!-- Paging-------------------------------------------- -->
		<div class="form-inline text-center">
			<%=StringUtil.renderPaging(totalCnt, o_pageNum, o_pageSize, bottomCount, "do_selectList.do", "search_page")%>
		</div>
		<!--// Paging------------------------------------------ -->
		
		
		
		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<!-- <button class="btn btn-success btn-sm" onclick="javascript:doSearch();">조회</button>-->
		 	<!-- <button class="btn btn-success btn-sm" id="do_upsert">수정</button> -->
		 	<!-- <button class="btn btn-success btn-sm" id="do_save">등록</button> -->
		 	<button class="btn btn-success btn-sm" id="do_update">수정</button>
		 	<button class="btn btn-success btn-sm" id="do_delete">삭제</button>
		 	<!-- <button class="btn btn-success btn-sm" onclick="javascript:doExcelDown();">엑셀다운</button> -->
		 </div>
		<!--// Button------------------------------------------ -->
			<form class="form-horizontal" name="frmEdit" id="frmEdit"
				method="post">
				
				<div class="form-group">
					<label class="col-lg-4 control-label">아이디</label>
					<div class="col-lg-8">
						<input type="text" disabled="disabled" name="id" id="id"
							class="form-control input-sm" placeholder="아이디" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">등록일</label>
					<div class="col-lg-8">
						<input type="text" disabled="disabled" name="regdt" id="regdt"
							class="form-control input-sm" placeholder="등록일" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">이름</label>
					<div class="col-lg-8">
						<input type="text" name="name" id="name"
							class="form-control input-sm" placeholder="이름" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">별명</label>
					<div class="col-lg-8">
						<input type="text" name="nickname" id="nickname"
							class="form-control input-sm" placeholder="별명" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">이메일</label>
					<div class="col-lg-8">
						<input type="text" name="email" id="email"
							class="form-control input-sm" placeholder="이메일" maxlength="200" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">연락처</label>
					<div class="col-lg-8">
						<input type="text" name="phone" id="phone"
							class="form-control input-sm" placeholder="연락처" maxlength="50" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">등급</label>
					<div class="col-lg-8">
						<input type="text" name="grade" id="grade"
							class="form-control input-sm" placeholder="등급" maxlength="50" />
					</div>
				</div>
			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		</div>
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		//초기화
		function onReset(){
			$("#id").prop("disabled",false);
		}
	
		//Null check
		function isEmpty(value) {
			if (!value) {
				alert("값을 입력하세요.");
				return true;
			}
		}
		
		//엑셀 다운
		function doExcelDown(){
			var frm = document.frm;
			frm.action = "do_excelDownload.do";
			frm.submit();
		}

		//조회
		function doSearch() {
			var frm = document.frm;
			frm.action = "do_selectList.do";
			frm.submit();
		}

		//Paging 이동 : StringUtil.renderPaging
		function search_page(url, pageNum) {
			//console.log(url+"|"+pageNum)
			var frm = document.frm;
			frm.pageNum.value = pageNum;
			frm.action = url;
			frm.submit();
		}

		
		$(document).ready(function() {
			
			//등록
			$("#do_upsert").on("click", function() {
				console.log("do_upsert")

				if (false == confirm("등록 하시겠습니까?"))
					return;

				$.ajax({
					type : "POST",
					url : "do_upsert.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"hId" : $("#hId").val(),
						"hName" : $("#hName").val(),
						"hPasswd" : $("#hPasswd").val(),
						"hLogin" : $("#hLogin").val(),
						"hRecommend" : $("#hRecommend").val(),
						"hEmail" : $("#hEmail").val(),
						"levelInt" : $("#level").val()
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);

						if (parseData.msgId == "1") {
							alert(parseData.message);
							doSearch();
						} else {
							alert(parseData.message);
						}

					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_save error: " + error);
					}

				});//--그리드 click -> ajax

			});//--등록

			//삭제
			$("#do_delete").on("click", function() {
				console.log("do_delete")

				if (false == confirm("삭제 하시겠습니까?"))
					return;

				$.ajax({
					type : "POST",
					url : "do_delete.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"id" : $("#id").val(),
					
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);

						if (parseData.msgId == "1") {
							alert(parseData.message);
							doSearch();
						} else {
							alert(parseData.message);
						}

					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_delete error: " + error);
					}

				});//--그리드 click -> ajax
			});//--삭제

			//등록
			$("#do_save").on("click", function() {
				console.log("do_save")

				if (false == confirm("등록 하시겠습니까?"))
					return;

				$.ajax({
					type : "POST",
					url : "do_save.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"hId" : $("#id").val(),
						"hName" : $("#name").val(),
						"hPasswd" : $("#pwd").val(),
						"hEmail" : $("#email").val()
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);

						if (parseData.msgId == "1") {
							alert(parseData.message);
							doSearch();
						} else {
							alert(parseData.message);
						}

					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_save error: " + error);
					}

				});//--그리드 click -> ajax

			});//--등록

			//수정
			$("#do_update").on("click", function() {
				console.log("do_update")

				console.log($("#id").val());
				if (false == isEmpty($("#id").val())) {
					$("#id").focus();
					return;
				}

				console.log("name:" + $("#name").val());
				if (false == isEmpty($("#name").val())) {
					$("#name").focus();
					return;
				}
				console.log("nickname:" + $("#nickname").val());
				if (false == isEmpty($("#nickname").val())) {
					$("#nickname").focus();
					return;
				}
				console.log("email:" + $("#email").val());
				if (false == isEmpty($("#email").val())) {
					$("#email").focus();
					return;
				}
				console.log("phone:" + $("#phone").val());
				if (false == isEmpty($("#phone").val())) {
					$("#phone").focus();
					return;
				}
				console.log("grade:" + $("#grade").val());
				if (false == isEmpty($("#grade").val())) {
					$("#grade").focus();
					return;
				}

				if (false == confirm("수정 하시겠습니까?"))
					return;

				$.ajax({
					type : "POST",
					url : "do_update.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"id" : $("#id").val(),
						"name" : $("#name").val(),
						"nickname" : $("#nickname").val(),
						"email" : $("#email").val(),
						"phone" : $("#phone").val(),
						"grade" : $("#grade").val()
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);

						if (parseData.msgId == "1") {
							alert(parseData.message);
							doSearch();
						} else {
							alert(parseData.message);
						}

					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_searchOne error: " + error);
					}

				});//--그리드 click -> ajax

			});//--수정

			//그리드 click
			$("#listTable>tbody").on("dblclick", "tr", function() {
				//console.log("listTable")

				var tr = $(this);
				var tds = tr.children();

				var id = tds.eq(0).text();

				//console.log("listTable id=" + id);
				if (id == "")
					return;
				if (false == confirm("(" + id + ")조회 하시겠습니까?"))
					return;

				$.ajax({
					type : "GET",
					url : "do_searchOne.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"id" : id
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);
						$("#id").val(parseData.id);
						$("#pwd").val(parseData.pwd);
						$("#name").val(parseData.name);
						$("#nickname").val(parseData.nickname);
						$("#gender").val(parseData.gender);
						$("#birth").val(parseData.birth);
						$("#email").val(parseData.email);
						$("#phone").val(parseData.phone);
						$("#grade").val(parseData.grade);
						$("#regdt").val(parseData.regdt);
						
//						var levelINtVal = 1;
//						//level
//						if (parseData.level == "BASIC") {
//							levelIntVal = 1;
//						} else if (parseData.level == "SILVER") {
//							levelIntVal = 2;
//						} else if (parseData.level == "GOLD") {
//							levelIntVal = 3;
//						}

//						$("#level").val(levelIntVal);
					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_searchOne error: " + error);
					}

				});//--그리드 click -> ajax

			});//--#listTable>tbody

		});//--document.ready
	</script>
</body>
</html>