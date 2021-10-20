<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<style>
	 .remove{   
		width: 38px;   
		font-size: 5px;   
		cursor: pointer;   
	}       
	  
	#p{   
	  position: relative;
	  top: 60px;       
	  font-size: 23px      
	}   

</style>
<body>
		<p id="p2" align="right"> <a href="/homepage/homepage">메인페이지</a> <br><p> 
 	  

<div class="container" role="main">
			<h2>getBoard</h2>

				<div class="mb-3">
					<p class="form-control">[NO.${board.bno}]------------------------------------[조회수${board.hit}]------------------------------------
											<fmt:setTimeZone value="Asia/Saul"/>
				<fmt:formatDate value="${board.writedate}" pattern="[yyyy.MM.dd HH:mm:ss]"/>         
					<p>    
				</div>
				<div class="mb-3">
					<p class="form-control">작성자: ${board.id}<p> 
				</div>
					<div class="mb-3">
					<p id="p1" class="form-control">제목: ${board.title}  <p>
				</div>
				<div class="mb-3"> 
					<label class="form-control">내용</label>
					<pre class="board_content">${board.content}</pre>
				</div>	
				<div class="mb-3">
				
				</div> 
			
</div>

 	<%-- 
 				<c:forEach var="comment" items="${comment}">  
						
						<fmt:setTimeZone value="Asia/Saul"/>
						<p>${comment.writer}<fmt:formatDate pattern="[yy-MM-dd HH:mm:ss]" value="${comment.reg_datetime}"/><p>  
						<pre><c:out value="${comment.comment}"/></pre>    
				</c:forEach>  --%>
				
	
	<c:forEach var="comment" items="${comment}" varStatus="status"> 	
				
			<tr>
				<td width="150">
					<div>
						<c:out value="${comment.writer}"/>
						<fmt:setTimeZone value="Asia/Saul"/>
						<font class="font" size="2" color="lightgray"> <fmt:formatDate pattern="MM.dd HH:mm:ss" value="${comment.reg_datetime}"/>
								<a class="remove" type="button" id="${status.index}">삭제</a>   
						</font>   
							  
							   
							 
					</div> 
				</td>  
		
				<td width="550"> 
					<div class="text_wrapper">
						<c:out value="${comment.comment}"/> 
					</div>
				</td>
			</tr>  
		</c:forEach>
			
	<% if(session.getAttribute("USER")!=null) {
%>
		<p id="p3"><%@ include file="../homepage/comment.jsp"%><p>
<%} else{%>
		<p id="p" align="center">로그인 후 댓글 작성 가능합니다<p>  
<%} %>		
</body>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script>
	
		$(document).ready(function(){
			
			
			var nickName = "<%=request.getAttribute("NickName")%>";
			var boardNum = "<%=request.getAttribute("BNO")%>";
			var id = "<%=request.getAttribute("ID")%>";
			
			if(nickName!=null){
				$('#p2').append("${USER.nickName}님 환영합니다")		   
				
			}
			if(id==nickName&&id!="null"&&nickName!="null"){
				$('#p1').append("<a href='/homepage/modify?bno=${board.bno}'>[게시글 수정]</a>")  
				$('#p1').append("<a id='delete' href='/homepage/delete?bno=${board.bno}'>[게시글 삭제]</a>")    
			}

			$('#delete').click(function(){
				var check = confirm("정말 삭제 하시겠습니까?")
				if(check){
					return true;   	
				}
				else{return false;}
			})
			
			var cmt =new Array();
			<c:forEach var="comment" items="${comment}" varStatus="status">
				cmt.push({cno:"${comment.cno}",
						writer:"${comment.writer}",
						comment:"${comment.comment}"});
			</c:forEach>
				console.log(cmt)
				
			$('.remove').click(function(){

				var index = $(this).attr('id'); 
				var data={cno:cmt[index].cno,
						writer:cmt[index].writer,
						user:nickName}
				
				if(nickName=="null"){
					alert("로그인이 필요한 기능입니다.")  
					return false;
				}
				if(nickName==cmt[index].writer){
					$.ajax({
						type : "post",
						url : "/homepage/deleteComment",
						data : data, 
						success : function(result){
							alert("삭제완료") 
							location.reload();		
						}
					})  	
				}
				else{
					alert("작성자만 삭제 가능합니다")  
					return false
				}
				 
			}) 
			
			
 
    		   
		})
		
	</script> 

</html>
