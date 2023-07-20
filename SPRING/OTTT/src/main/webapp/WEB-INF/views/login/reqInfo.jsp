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
    <link rel="stylesheet" href="${path}/resources/css/login/reqinfo.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <style>
    	.ott-logo-img:hover,
		.ott-logo-img.active {
			outline: 3px solid #33ff33;
		}
    </style>
    <title>필수 정보 입력</title>
</head>
<body style="background-color: #202020;">
	<div class="wrap">
		<%@ include file="../fix/header.jsp" %>
		
		<section class="sec00">
			<form method="post" action="<c:url value='/signin/addInfo' />" id="membership">
				<h1 style="font-size: 21px; display: inline-block;">필수 정보 입력</h1>
				<div class="name">
					<input type="email" id="name" title="name" maxlength="20" placeholder="이름" >
						<span>
							<select name="성별">
								<option value="">선택</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
								<option value="비공개">비공개</option>
							</select>
						</span>
					
					<div class="nname">
						<input type="text" id="nname" title="nickname" maxlength="10"  placeholder="닉네임" >
					</div>
				</div>
				
				<div class="back" style="display: inline-block; pointer-events: none;">
					<a href="<c:url value='/login' />" style="pointer-events: none;">
						<input type="button" value="이전" style="pointer-events: auto;">
					</a>
				</div>
				
				<div class="complate">
					<input type="submit" value="다음">
				</div>
			</form>
		</section>
	</div>
             
</body>
</html>
