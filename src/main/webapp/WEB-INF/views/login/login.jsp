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
<p align="right" ><a href="/homepage/homepage">메인페이지</a> </p>
<p align="right" ><a href="/login/create">회원가입</a> </p>
<form action="login" method="post">

	<div align="center">
   <h3>로그인</h3>
   <table>
      <tr>
        <td>이메일:</td>
        <td><input type="email" id="email" name="email" maxlength="23" placeholder="Email">
        </td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" name="password" id="password" size="13" maxlength="16" placeholder="pw" > <input type="submit" id="submit" value="로그인"> </td> 
      </tr>
 	</table>
  </div>
</form>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>


</script>
</html>