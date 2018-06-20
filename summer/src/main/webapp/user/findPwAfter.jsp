<%@page import="com.summer.comm.StringUtil"%>
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
	

	//if (session.getAttribute("id") == null) {
	//	response.sendRedirect("login.jsp");
	//}
	
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
    <title>:::비밀번호기찾기:::</title>

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
		 <h3>비밀번호기찾기</h3>
		 
		<!--// Title------------------------------------------ -->
		<!-- TEST -->

		
		<!--// TEST -->


		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frm" id="frm"
				method="post">				
				<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호</label>
					<div class="col-lg-8">
						<input type="text" disabled="disabled" name="pwd" id="pwd"
							class="form-control input-sm" value="${User.pwd}" maxlength="20" />
									<c:if test="${null == User.pwd}">
		 							일치하는 정보가 없습니다.
									 </c:if>
					</div>
				</div>
			</form>
		</div>
		
		
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/login.jsp'">로그인</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/signUp.jsp'">회원가입</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/findId.jsp'">아이디 찾기</button>
		 </div>
		<!--// Button------------------------------------------ -->		
		
		</div>
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {			
			
		});//--document.ready
	</script>
</body>
</html>