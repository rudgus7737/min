<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<style>

.pageInfo{
		 list-style : none;
		display: inline-block;
		margin: 50px 0 0 100px;      
	}
	.pageInfo li{
		float: left;
		font-size: 20px;
		margin-left: 18px;
		padding: 7px;
		font-weight: 500;
	}
	a:link {color:black; text-decoration: none;}
	a:visited {color:black; text-decoration: none;}
	a:hover {color:black; text-decoration: underline;}
	.active{
		background-color: #cdd5ec;
	}
	.search_area{
		display: inline-block;
		margin-top: 36px;
		margin-left: 260px;
	}
	.search_area input{
		height: 36px;
		width: 250px;
	}
	.search_area button{
		width: 100px;
		height: 36px;
	}
	.search_area select{
		height:36px;
	}   

	body {
		padding-top: 20px;
		padding-bottom: 20px; 
	}
</style>
<body>
<% if(session.getAttribute("USER")!=null) {
%>
		${USER.nickName}님 환영합니다
		<p align="right">
		<button type="button" class="btn btn-sm btn-primary" id="logoutBtn" >로그아웃</button> </p> 
<%} else{%>

	<p align="right"><button type="button" class="btn btn-sm btn-primary" id="createBtn" >회원가입</button>  
	<button type="button" class="btn btn-sm btn-primary" id="loginBtn" >로그인</button> </p> 
<% }%>
		



<article>
		
	<div class="container">
		<div class="table-responsive">  
		<h2>자유게시판</h2>	
			<table class="table table-striped table-sm">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:auto;" />
				<col style="width:15%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${boardList}">
					<tr>
						<td><c:out value="${list.bno}"/></td>
						<td><a href='/homepage/getBoard?bno=${list.bno}'>${list.title}  </a></td>
						<td><c:out value="${list.id}"/></td>
						<td><c:out value="${list.hit}"/></td>
						<fmt:setTimeZone value="Asia/Saul"/>
						<td><fmt:formatDate pattern="yy-MM-dd HH:mm:ss" value="${list.writedate}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="writeBtn">글쓰기</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList">목록으로</button>
			
		</div>
		<div class="search_wrap">
									<div class="search_area">
										<select name="type">
											<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
											<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
											<option value="O" <c:out value="${pageMaker.cri.type eq 'O'?'selected':'' }"/>>내용</option>
											<option value="A" <c:out value="${pageMaker.cri.type eq 'A'?'selected':'' }"/>>닉네임</option>
											<option value="TO" <c:out value="${pageMaker.cri.type eq 'TO'?'selected':'' }"/>>제목 + 내용</option>
											<option value="TA" <c:out value="${pageMaker.cri.type eq 'TA'?'selected':'' }"/>>제목 + 내용</option>
											<option value="TOA" <c:out value="${pageMaker.cri.type eq 'TOA'?'selected':'' }"/>>제목 + 내용 + 닉네임</option>
										</select>  
										<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
										<button class="btn btn-success">검색 <i class="fas fa-search"></i> </button>
									</div>
								</div>    
		
	</div>
		
</div>
</article>
		
							<div class="pageInfo_wrap" >
									<div class="pageInfo_area">
									 	<ul id="pageInfo" class="pageInfo">
									 	
											<!-- 이전페이지 버튼 -->
											<c:if test="${pageMaker.prev}">
												<li class="pageInfo_btn previous"><a href="homepage?pageNum=${pageMaker.startPage-1}">이전</a></li>
											</c:if>
											
											<!-- 각 번호 페이지 버튼 -->
											<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="homepage?pageNum=${num}">${num}</a></li>
                							</c:forEach>
											
											<!-- 다음페이지 버튼 -->
											<c:if test="${pageMaker.next}">
												<li class="pageInfo_btn next"><a href="homepage?pageNum=${pageMaker.endPage + 1 }">다음</a></li>
											</c:if>  
											  
									 	</ul>
									</div>
								</div>
                               	<form id="moveForm" method="get">
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
									<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
									<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
									<input type="hidden" name="type" value="${pageMaker.cri.type }">
                               	</form>    
			
</body>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	
	
		$(document).ready(function(){
			var user = "<%=session.getAttribute("USER")%>";
			console.log(user); 
			$('#writeBtn').click(function(){
				if(user=="null"){
					alert("글쓰기는 로그인후 가능합니다")
					location.href = "/login/login"
				}
				else{
					location.href = "/homepage/write"
				}
				
			})
			$('#loginBtn').click(function(){
				location.href = "/login/login"
			})
			$('#logoutBtn').click(function(){
				location.href = "/login/logout"
			})
			$('#createBtn').click(function(){
				location.href = "/login/create"
			})
			$('#btnList').click(function(){
				location.href = "/homepage/homepage"  
			})
			
			
			$(".search_area button").click(function(e){
					e.preventDefault();
         	
                		var type = $(".search_area select").val();
                		var keyword = $(".search_area input[name='keyword']").val();
                		if(!type){
                			alert("검색 종류를 선택하세요.");
                			return false;
                		}
                		if(!keyword){
                			alert("키워드를 입력하세요.");
                			return false;
                		}
                		
                		$("input[name='type']").val(type);
                		$("input[name='keyword']").val(keyword);
                		$("input[name='pageNum']").val(1);
                		moveForm.submit();
               })
			
			
		})
				
	</script>


</html>
