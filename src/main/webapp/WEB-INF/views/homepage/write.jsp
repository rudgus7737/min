<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<title>board</title>

<style>

body {
  padding-top: 70px;
  padding-bottom: 30px;
}

</style>
</head>
<body>
<p align="right">${USER.nickName}님 환영합니다</p>	
	<article>
		<div class="container" role="main">
			<h2>글쓰기</h2>
			<form name="form" id="form" role="form" method="post" action="/homepage/write">
				<div class="mb-3">
					<label for="title" id="test_cnt">제목--(0 / 30) 최대30자</label> 
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="id" id="id" value="${userName}" readonly>
				</div>
				<div class="mb-3">
					<label for="content"id="content_cnt">내용--(0 / 21845) 최대21845자</label> 
					<textarea wrap="hard" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>				
				<div >
				<button type="reset"  class="btn btn-sm btn-primary" id="reset" >초기화</button>
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">등록</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
			</form>  
			  
		</div>
	</article>
</body>
			<script>
			$(document).ready(function(){

				
				$('#btnSave').click(function(){
					var title = $('#title').val()
					var content = $('#content').val()
					if(title.length==0||content.length==0){
							alert("제목, 내용 입력요망")
							return false;
					}
							
				})
				
				
				$('#btnList').click(function(){
					location.href = "/homepage/homepage"
				})
				$('#title').keyup(function(){ 
					$('#test_cnt').html("제목("+$('#title').val().length+" / 30) 최대30자");
					if($('#title').val().length>30){	
						$('#title').val($('#title').val().substring(0, 30));
					}
				})
				
				$('#content').keyup(function(){ 
					$('#content').val().replace(/(\r\n|\n|\r)/gm, "");
					$('#content_cnt').html("내용("+$('#content').val().length+" / 21845) 최대21845자");
					if($('#content').val().length>21845){	
						$('#content').val($('#content').val().substring(0, 21845));
					}
				})
				
				
				
			})
			
			</script>
</html>


