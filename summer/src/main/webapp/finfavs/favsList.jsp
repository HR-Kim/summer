<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class = "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

<h3>즐겨찾기 목록 페이지</h3>

<!-- List ------------------------------------------------------------->
  
	     <div class="table-responsive">
	     	
	       <table id="listTable" class="table table-striped table-bordered table-hover">
	        	<thead class="bg-primary">
	        		<tr>
		         		<th class="text-center" width="150">은행</th>
		         		<th class="text-center" width="150">상품 이름</th>
		         		<th class="text-center" width="200"></th>
	         		</tr>
	        	</thead>
	        	<tbody>
	        		
	        	<c:choose>
	        		<c:when test="${list.size()>0}">
	        			<c:forEach var="vo" items="${list}">
			        		<tr>
			          		<td class="text-center">
				          	${vo.korCoNm}
			          		</td>
					          <td class="text-left">${vo.finPrdtNm}</td>
					          <td class="text-center">
					          	 	&nbsp; &nbsp; &nbsp;
					          	<button type="submit" class="btn btn-primary btn-fw" onclick="javascript:finFavsDelete('f${vo.favsNo}');">삭제</button>
					          </td>
							</tr>
							<form id = "${vo.favsNo}" method="post"><input type="hidden" name = "favsNo" value="${vo.favsNo}"/></form>
     						</c:forEach>
	         		</c:when>
	         		<c:otherwise>
	         			<tr>
		          		<td colspan="99" class="text-center">데이터가 없습니다.</td>
		         		</tr>
	         		</c:otherwise>
	         	</c:choose>
	         	
	         	
	        	</tbody>
	        </table>
	        
	      </div>
	    

   <!--// List ----------------------------------------------------------->

<script type ="text/javascript">
function finFavsDelete(favsNo){
	var finFavsNo = favsNo.substr(1);

	var frm = document.getElementById(finFavsNo);
	frm.action = '/summer/finfavs/doDelete.do';
	frm.submit();
}
</script>


</div>