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

<form action="create" method="post">

		<div align="center">
   <h3>회원가입</h3>
   <table>
      <tr>
        <td>이메일:</td>
        <td><input type="email" id="email" name="email" maxlength="23" placeholder="Email">
            <input type="button" id="email_check" value="중복확인"> 
        </td>
      </tr>
      
      <tr>
        <td>한글닉네임(1~6자):</td>
        <td><input type="text" id="nickName" name="nickName" size="12" maxlength="6" placeholder="닉네임">
            <input type="button" id="nickName_check" value="중복확인"> 
        </td>
      </tr>
      
      <tr>
        <td>비밀번호(8~16자리):</td>
        <td><input type="password" name="password" id="password" size="15" maxlength="16" placeholder="비밀번호 " value=""></td>
      </tr>
      <tr>
        <td>비밀번호 확인:</td>
        <td><input type="password" name="passwordcheck"  id="passwordcheck" size="15" maxlength="16" placeholder="비밀번호 확인"> </td>
      </tr>
      <tr>
        <td>이 름:</td>
        <td><input type="text" id="name" name="name" maxlength="6" size="6">  </td>
      </tr>
      <tr>
        <td>생년월일</td>
        <td><input type="date" size="6" id="birth" name="birth">
        </td>
      </tr>
      <tr>
        <td>휴대전화:</td>
        <td>
        	<input type="text" id="phone" name="phone" maxlength="13" placeholder="핸드폰번호" style="ime-mode:disabled">
        </td>
      </tr>  
      <tr align="center"> 
        <td colspan="2">
           <input type="reset" id="reset" value="초기화">  
           <input type="submit" id="submit" value="회원가입">
        </td>        
      </tr>
   </table>
 </div>
 
</form>
<p align="center" ><a href="/homepage/homepage">메인페이지</a> </p>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

	$(document).ready(function(){

		$("#reset").click(function(){
			$("#email_check").attr("value","중복확인");
			$("#nickName_check").attr("value","중복확인");
		});
		
		$("#phone").keyup(function(event){
		    var inputVal = $(this).val();
		    $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		}); 
		$("#email").keyup(function(event){
			$("#email_check").attr("value","중복확인");	    
		});
		$("#nickName").keyup(function(event){
			$("#nickName_check").attr("value","중복확인");	    
		}); 

//===============================================================================================================================
		$("#submit").click(function(e){
			var pw = $("#password").val();
			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var nickNameTest = /^[가-힣]{2,6}$/;
			var nickName = $("#nickName").val();
			var nameTest = /^[가-힣]{2,4}$/;
			var name = $("#name").val();
			var getPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			var checkButton = $("#email_check").val();
			var checkButton2 = $("#nickName_check").val(); 
			
			if($("#email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if(checkButton == "중복확인") {
				alert("이메일 중복확인 버튼을 눌러주세요");
				$("#email").focus();
				return false;
			}
			
			if($("#nickName").val()==""){
				alert("닉네임을 입력해주세요.");
				$("#nickName").focus();
				return false;
			}
			if(nickNameTest.test(nickName)==false) { 
				alert("2~6자리의 한글 닉네임만 입력 가능합니다");
				$("#nickName").focus();
				return false;
			}
			if(checkButton2 == "중복확인") {
				alert("닉네임 중복확인 버튼을 눌러주세요");
				$("#nickName").focus();
				return false;
			}
			
			if($("#password").val()=="") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if($("#passwordcheck").val()=="") {
				alert("비밀번호확인 을 입력해주세요.");
				$("#passwordcheck").focus();
				return false;
			}
			
			if($("#password").val()!=$("#passwordcheck").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#password").focus();
				return false;
			}
			if(false === reg.test(pw)) {
				alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				$("#password").focus();
				return false;
			}
			if(/(\w)\1\1\1/.test(pw)){
				alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
				$("#password").focus();
				return false;
			}
			if(pw.search(/\s/) != -1){
			 	alert("비밀번호는 공백 없이 입력해주세요.");
			 	$("#password").focus();
			 	return false;
			}
			if(hangulcheck.test(pw)){
			 	alert("비밀번호에 한글을 사용 할 수 없습니다.");
			 	$("#password").focus();
			 	return false;
			}
			
			if($("#name").val()=="") { 
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			}	
			if(nameTest.test(name)==false) { 
				alert("2~4자리의 한글 이름만 입력 가능합니다");
				$("#name").focus();
				return false;
			}
			if($("#birth").val()=="") {
				alert("생년월일을 입력해주세요.");
				$("#birth").focus();
				return false;
			}
			if($("#phone").val()=="") {
				alert("휴대폰 번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			}   
			if(getPhone.test($("#phone").val())==false){
				alert("휴대폰번호를 다시 입력해주세요");
				$("#phone").focus();
				return false;
			}	
			if (checkButton2 == "사용가능"||checkButton == "사용가능") {
				alert("회원가입이 정상적으로 되었습니다. 환영합니다.")
				return true;
			}
			else{
				alert("010-4139-1656 로 연락 바람")
			}

		})
//===============================================================================================================================	
	});
//===============================================================================================================================	
	
	$("#email_check").click(function(){
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var email = $('#email').val();
		var data = {email : email}
		var check = 0;
		$.ajax({
			type : "post",
			url : "/login/emailCheck",
			data : data,
			success : function(result){
			 if(result=='success' && getMail.test(email)){
					check = 1;
					$("#email_check").attr("value","사용가능");
					$("#email_check").css("background-color","silver");
					alert("사용 가능한 이메일입니다.");
					$("#password").focus();
				}
			 	else{
			 		if(result=="fail"){
			 			alert("중복된 이메일입니다.");
			 			$("#email").focus();
			 		}
			 		else{
			 			alert("잘못된 이메일 형식입니다.")
			 		}
				}
			}
		})
	})
		
	$("#nickName_check").click(function(){
		var getNickName = /^[가-힣]{2,6}$/;
		var nickName = $('#nickName').val();
		var data = {nickName : nickName}
		var check1 = 0;
		$.ajax({
			type : "post",
			url : "/login/nickNameCheck",
			data : data,
			success : function(result){
			 if(result=='success' && getNickName.test(nickName)){
					check1 = 1;
					$("#nickName_check").attr("value","사용가능");
					$("#nickName_check").css("background-color","silver");
					alert("사용 가능한 닉네임입니다.");
					$("#password").focus();
				}
			 	else{
			 		if(result=="fail"){
			 			alert("중복된 닉네임입니다.");
			 			$("#nickName").focus();
			 		}
			 		else{
			 			alert("잘못된 닉네임 형식입니다.")
			 		}
				}
			}
		})
	})

</script>
</html>