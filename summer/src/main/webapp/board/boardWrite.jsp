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
    <title>:::글쓰기:::</title>

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
		 <h3>글쓰기</h3>
		<!--// Title------------------------------------------ -->


		
		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frm" id="frm"
				method="post">
				<div class="form-group">
					<label class="col-lg-4 control-label">구분</label>
					<div class="col-lg-8">
						<input type="text"  name="category" id="category"
							class="form-control input-sm" placeholder="구분" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">제목</label>
					<div class="col-lg-8">
						<input type="text" name="title" id="title"
							class="form-control input-sm" placeholder="제목" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">작성자</label>
					<div class="col-lg-8">
						<input type="text" name="id" id="id" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("grade") %>" maxlength="200" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">글내용</label>
					<div class="col-lg-8">
						<textarea class="form-control" id="content" name="content" rows="15"></textarea>
					</div>
				</div>
			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		
				
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-success btn-sm" id="do_add" >완료</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/boardMain.jsp'" >취소</button>
		 </div>
		<!--// Button------------------------------------------ -->
		</div>
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">


		
		$(document).ready(function() {

			//등록
			$("#do_add").on("click", function() {
				console.log("do_add")
				if (false == confirm("등록 하시겠습니까?"))
					return;

				$.ajax({
					type : "POST",
					url : "do_add.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"category" : $("#category").val(),
						"title" : $("#title").val(),
						"id" : $("#id").val(),
						"content" : $("#content").val()
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);

						if (parseData.msgId == "1") {
							alert(parseData.message);
							
							var frm = document.frm;
							frm.action = '${CONTEXT}'+"/board/boardMain.jsp";
							frm.submit();	
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
		});//--document.ready
	</script>
</body>
</html>