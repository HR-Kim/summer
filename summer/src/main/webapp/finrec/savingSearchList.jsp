<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="content-wrapper">
 
 
	 <div class="col-md-3 d-flex align-items-stretch">
	 <div class = "row flex-grow">
              <div class="card">
                <div class="card-body">
                                	<h2 class="card-title">적금 검색</h2>
                	
						<input type = "radio"  name = "fin_recommend_type" value="consume" />소비데이터로 추천받기
						<input type = "radio" name = "fin_recommend_type" value = "direct" checked="checked" />직접 입력하여 추천받기
						<p>
						<b>금리유형</b>
						<input type = "radio" name = "intr_rate_type" value = "S" />단리
						<input type = "radio" name = "intr_rate_type" value = "M" />복리
						<p>
						<b>적립유형</b>
						<input type = "radio" name = "rsrv_type" value = "S" />정액적립식
						<input type = "radio" name = "rsrv_type" value = "F" />자유적립식
						<p>
						<b>저축금리</b>
						<input type = "text" class = "form-control" name = "intr_rate" maxlength="5" />
						<p>
						<b>최고우대금리</b>
						<input type = "text" class = "form-control"  name = "intr_rate_max" maxlength="5" />
						<p>
						<button type="submit" class="btn btn-success mr-2">검색</button>
						</div>
					</div>
		</div>
	</div>
	
 <div class="col-md-7 grid-margin stretch-card" style="margin-right:none;">
              <div class="card">
                <div class="card-body">
                  <h2 class="card-title">적금 목록</h2>
                  <div class="table-responsive">
                    <table class="table">
                    	<tbody>
                    		<tr>
                    			<td>
                    			  적금 aaaa<br/>
                    			  정보 블라블라
                    			  </td>
                    			<td>
                    						<button type="submit" class="btn btn-light btn-fw">상세보기</button>
                    						<button type="submit" class="btn btn-primary btn-fw">즐겨찾기</button>
                    			</td>
                    		</tr>
                    		<tr>
                    			<td>
                    			  적금 bbbb<br/>
                    			  정보 블라블라
                    			  </td>
                    			<td>
                    						<button type="submit" class="btn btn-light btn-fw">상세보기</button>
                    						<button type="submit" class="btn btn-primary btn-fw">즐겨찾기</button>
                    			</td>
                    		</tr>
                    		<tr>
                    			<td>
                    			  적금 cccc<br/>
                    			  정보 블라블라
                    			  </td>
                    			<td>
                    						<button type="submit" class="btn btn-light btn-fw">상세보기</button>
                    						<button type="submit" class="btn btn-primary btn-fw">즐겨찾기</button>
                    			</td>
                    		</tr>                    		
                    		
                    	</tbody>
                    </table>
                    </div>
                    </div>
                    </div>
	</div>
	
</div>
</body>
</html>