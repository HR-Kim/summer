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
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<br>
<br>
<br>
<div class="container">
                  <h2>적금 상세</h2>
                  <!--  hidden -->
      					<input type="hidden" id = "userId" value = "<%=session.getAttribute("id")%>"/>	  
   					  <form id="f${outVO.finPrdtCd}" method="get">
   					  	<input type="hidden" class = "id" name = "id" />
   					  	<input type="hidden" name = "finPrdtCd" value="${outVO.finPrdtCd}"/>
   					  	</form>
   					  	<!-- hidden-->
   					  	
   					  	<!--  table  -->
                  <div class="table-responsive" id = "searchResult">
                    <table class="table table-striped table-bordered table-hover">
                    <tbody>
                    <tr>
                    <th  colspan="2">
                    	${outVO.korCoNm}<br/>
                    	<h3>${outVO.finPrdtNm}</h3>
                    </th>
                    </tr>
                    
                    <tr>
                    <th> 가입 방법</th><th> ${outVO.joinWay}</th>
                    </tr>
                    <tr>
                    <th>만기 후 이자율</th><th>  ${outVO.mtrtInt}</th>
                    </tr>
                    <tr>
                    <th>우대조건</th><th>  ${outVO.spclCnd}</th>
                    </tr>
                    
                    <tr>
                     <th>저축금리유형</th><th> ${outVO.intrRateTypeNm}</th>
                     </tr>
                     <tr>
                     <th>유형 </th><th> ${outVO.rsrvTypeNm}</th>
                     </tr>
                     <tr>
                     <th>최저금리 </th><th> ${outVO.intrRateMin}</th>
                     </tr>
                     <tr>
                     <th>최고우대금리</th><th>  ${outVO.intrRateMax}</th>
                    </tr>
                    
                    <tr >
                    <th colspan="2">
					기타 : ${outVO.etcNote}
                    </th>
                    </tr>
                    <c:choose>
	         			<c:when test="${userId ne null}">
                    <tr>
                    <th colspan="2">
                     	 <button type="submit" class="btn btn-primary btn-fw" onclick="javascript:addFinFav('f${outVO.finPrdtCd}');">즐겨찾기에 추가</button>
                     	 </th>
                      </tr>
                    </c:when>
	         		</c:choose>
                    </tbody>
                    </table>
                    </div>
					<!--  table  -->
					</div>
                  

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
</script>