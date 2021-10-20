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
   
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments </strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                        	<input type="hidden" name="bno" id="bno" value="${board.bno}">
                        	<input type="hidden" name="writer" id="writer" value="${USER.nickName}">
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <button type="button" id="send" class="btn pull-right btn-success">등록</button>  
                            </div>
                        </td>
                    </tr>   
                </table>
            </div>
        </div>
        
    </form>
</div>

</body>
 
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){

	$("#send").click(function(){
		var comment = $("#comment").val();
		var pattern = /^[\s]+$/gi; 
		 if(comment==""||pattern.test(comment)){    	 
			alert("공백 댓글 금지 ")
			$("#comment").val("")  
			return false;  
		} 

		$.ajax({
	        type:'post',
	        url : "/homepage/addComment", 
	        data:$("#commentForm").serialize(),    
	        success : function(result){
	                location.reload();   
	                 
	        }
		})
		$("#comment").val("");  
	})   
	
	
	
	
	
	
})   
	

</script>
 

</html>
