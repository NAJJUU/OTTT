<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/login/registercomple.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <style>
    	.ott-logo-img:hover,
		.ott-logo-img.active {
			outline: 3px solid #33ff33;
		}
    </style>
    <title>회원가입 완료</title>
</head>
<body style="background-color: #202020;">
	<div class="wrap">
		<%@ include file="../fix/header.jsp" %>
      
        <div class = "Login">
        	<img src = "${path}/resources/images/logo/OTTT.png" width="420" height="120">
        	<h1 style="font-size: 30px; display: inline-block;">환영합니다!</h1>
        	
        	<form method="post" action="<c:url value='/signin/complete' />" id="login-form">
        		<input type="text" style="border:0 solid black; color: #fff;" name="user_id" placeholder="아이디">
            	<input type="password" style="border:0 solid black;" name="user_pwd" style="border:0 solid black" placeholder="비밀번호">
            	<input type="submit" value="로그인">
           	</form>
       	</div>
   	</div>
         
</body>
</html>
