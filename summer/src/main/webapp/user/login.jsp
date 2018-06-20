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
    <title>:::로그인:::</title>

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
		 <h3>로그인</h3>
		<!--// Title------------------------------------------ -->
		<!-- Button-------------------------------------------- -->
		<div class="form-inline pull-right">
			<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/signUp.jsp'">회원가입</button>
			<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/findId.jsp'">ID찾기</button>
			<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/findPw.jsp'">PW찾기</button>
		</div>
		<!--// Button------------------------------------------ -->
		<!-- Input Form--------------------------------------- -->
	<form name="frm" method="post">
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input name="id" id="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd" id="pwd"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="do_login">로그인</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
    </form>
		<!--// Input Form------------------------------------- -->
		

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		//Null check
		function isEmpty(value) {
			if (!value) {
				alert("값을 입력하세요.");
				return true;
			}
		}
		
		$(document).ready(function(){
	        $("#do_login").click(function(){
	            // 태크.val() : 태그에 입력된 값
	            // 태크.val("값") : 태그의 값을 변경 
	            var id = $("#id").val();
	            var pwd = $("#pwd").val();
	            if(id == ""){
	                alert("아이디를 입력하세요.");
	                $("#id").focus(); // 입력포커스 이동
	                return; // 함수 종료
	            }
	            if(pwd == ""){
	                alert("비밀번호를 입력하세요.");
	                $("#pwd").focus();
	                return;
	            }
	            
	         	var frm = document.frm;
	         	frm.action = '${CONTEXT}'+"/user/do_loginCheck.do";
	         	frm.submit();		
	            // 폼 내부의 데이터를 전송할 주소
	        });			
		});//--document.ready
	</script>
</body>
</html>