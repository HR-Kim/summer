<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link type="text/css" rel="stylesheet" href="/summer/finrec/paging/simplePagination.css"/>
<script type="text/javascript" src="/summer/finrec/paging/jquery.simplePagination.js"></script>


 
 
	 <div class="col-md-3 d-flex align-items-stretch">
	 <div class = "row flex-grow">
              <div class="card">
                <div class="card-body">
                                	<h2 class="card-title">적금 검색</h2>
                	
                	     <!-- 
						<input type = "radio"  name = "fin_recommend_type" value="consume" />소비데이터로 추천받기
						<input type = "radio" name = "fin_recommend_type" value = "direct" checked="checked" />직접 입력하여 추천받기
						<p>
						 -->
						 <form name="searchFrm" id="searchFrm" method="get">
						<b>금리유형</b>
						<input type = "radio" name = "intrRateType" value = "S" />단리
						<input type = "radio" name = "intrRateType" value = "M" />복리
						<p>
						<b>적립유형</b>
						<input type = "radio" name = "rsrvType" value = "S" />정액적립식
						<input type = "radio" name = "rsrvType" value = "F" />자유적립식
						<p>
						<b>최소금리</b>
						<input type = "text" class = "form-control" name = "intrRateMin" maxlength="5" />
						<p>
						<b>최고우대금리</b>
						<input type = "text" class = "form-control"  name = "intrRateMax" maxlength="5" />
						</form>
						<p>
						<button id = "search" type="submit" class="btn btn-success mr-2" onclick="javascript:savingList(1);">검색</button>
						</div>
					</div>
		</div>
	</div>
	
 <div class="col-md-7 grid-margin stretch-card" style="margin-right:none;">
              <div class="card">
                <div class="card-body">
                  <h2 class="card-title">적금 목록</h2>
                  <div id = "loadingImage" style="display:none"><img src="/summer/finrec/img/loadingImage.gif"></div>
                  <div class="table-responsive" id = "searchResult"></div>
                    
                    <div id = "pageArea"></div>
                    
                    </div>
                    </div>
                    </div>
	</div>
	


<script type ="text/javascript">

function savingList(pageNum){
	
	$("#loadingImage").show();
	
	var dataToSend = $("form[name=searchFrm]").serialize();
	
	$.ajax({
		type:"GET",
		async: false,
		url:"/summer/finrec/saving/doSelectList.do",
		dataType:"html",
		data:dataToSend,
		success:function(data){//성공
			
			console.log('data='+data);
			var tableText = "<table><tbody>";
			var table = document.getElementById('searchResult');
			if(data == '데이터 없음'){ //해당 검색 결과 없음
				
			}else {
				var list = $.parseJSON(data);
				tableText = "";
				for(i = 0 ; i < list.length ; i++){
					console.log(list[i].finPrdtNm);
					tableText = tableText + '<tr><td>' + list[i].korCoNm + '|<h4>' + list[i].finPrdtNm + '</h4><br/>' 
					+ list[i].intrRateTypeNm + '|' + list[i].rsrvTypeNm
					+ '</td><td><button type="submit" class="btn btn-light btn-fw">상세보기</button>'+
					'<button type="submit" class="btn btn-primary btn-fw">즐겨찾기</button></td></tr>';
				}
				tableText = tableText + '</tbody></table>';
				table.innerHTML = tableText;
			}//--if-else
		
		},
		complete:function(data){//무조건
			$("#loadingImage").hide();

		},
		error:function(xhr,status,error){//실패시
			console.log("실패 |" + error);
		}		
	});//ajax
	
}//--savingList

function paging(){	
//	var totalCnt = $("#totalCnt").val();
//	var pageSize = $("#pageSize").val();
//	var pageNum = $("#pageNum").val();

   var totalCnt = 20;
	var pageSize = 5;
	var pageNum = 1;

//	console.log("pageSize="+pageSize);
//	console.log("pageNum="+pageNum);
	
    $('#pageArea').pagination({
        items: totalCnt,
        itemsOnPage: pageSize,
        currentPage : pageNum,
	    cssStyle: 'light-theme',
        onPageClick: function(pageNum){
        	savingList(pageNum);
        	console.log('onPageClick:pageNum='+pageNum);
        }
    });

}//--paging


$(document).ready(function(){
	alert("ready?");
	paging();
	
});


</script>
