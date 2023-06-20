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
    <title>비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/login/findpwd.css" >
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
		/* 모달 */
.modal-content{
    background-color: #202020;
}

.modal-body{
    font-size: 26px;
    text-align: center;
    border: 1px solid #fff;
}

.modal-header{
    border: 1px solid #fff;
}

.modal-footer{
    border: 1px solid #fff;
    display: flex;
    justify-content: flex-end;
}
 
.modi-del{
	display: flex;
    justify-content: flex-end;
}


.qa-main p{
    display: flex;
    justify-content: flex-end;
    font-weight: bold;
}

.btn{
    color: #fff;
    background-color: transparent;
    border-style: none;
    border-color: #fff; 
    font-size: 23px; 
    text-decoration: none;
}


.btn:hover{
    border-color: #33FF33;
    background-color: transparent;
    border-style: solid;
    color: #33FF33; 
}
</style>
</head>

<!--  body  --------------------->
<body style="background-color: #202020;">
	<div class="wrap">
		<header>
			<div class="logo">
				 <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="로고">
          </a>
        </div>
        <nav class="gnb">
          <ul>
            <li>
              <a href="<c:url value="/genre/movie" />">영화</a>
            </li>
            <li>
              <a href="<c:url value="/genre/drama" />">드라마</a>
            </li>
            <li>
              <a href="<c:url value="/genre/interest" />">예능</a>
            </li>
            <li>
              <a href="<c:url value="/genre/animation" />">애니</a>
            </li>
            <li>
              <a href="<c:url value="/community/freecommunity" />">게시판</a>
            </li>
          </ul>
        </nav>
        <div class="h-icon">
          <ul>
            <li>
              <a href="<c:url value='/search' />">
                <!-- <img src="./images/icon/search02.png" alt="검색"> -->
              </a>
            </li>
            <li>
              <a href="<c:url value='/mypage' />">
                <!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              </a>
            </li>
          </ul>
        	</div>
		</header>
		
		<section class="sec00">
			<form method="post" action="<c:url value='/login/checkPwd' />" id="membership">
				<h1 style="font-size: 21px; display: inline-block;">비밀번호 찾기</h1>
				<div class="Id">
					<input type="text" name="user_id" id="id" title="ID" maxlength="15"  placeholder="아이디 입력" pattern="^[a-zA-Z0-9]{6,}$" required>
					<p id="idError" style="color: red;"></p>
              	</div>
              	
                <div class="email">
                	<input type="email" name="user_email" id="email" title="EM" maxlength="20"  placeholder="이메일" pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" required>
	                 	<span>
		                  	<select id="domain" name="직접입력">
			                    <option value="select">직접입력</option>
			                    <option value="naver.com">네이버</option>
			                    <option value="gmail.com">구글</option>
		                    </select>
	                    </span>
                    <button id="send-verification-code">인증번호 발송</button>
				</div>
				
                <div class="Certification">
                	<input type="text" id="Certification" title="EM" maxlength="20" placeholder="인증번호" pattern="\d{6}" required>
                	<button id="completion">인증확인</button>
               	</div>
               	
          
       			
                <div class="complate">
                	<input type="submit" value="다음">
               	</div>
           	 </form>
       	 </section>
  	 </div>
  	 
  	 <script type="text/javascript">
	  	document.getElementById('domain').addEventListener('change', function() {
				var domain = this.value;
				if (domain !== 'select') {
					document.getElementById('email').value += '@' + domain;
				}
			});
	  	
	  	var code = "";
   		
   		/* 인증번호 이메일 전송 */
   		$("#send-verification-code").click(function(){
   			var email = $("#email").val()		// 입력한 이메일
   			var checkBox = $("#Certification")	// 인증번호 입력란
	               			
   			$.ajax({
   				type: "GET",
   				url: "/ottt/signin/mailCheck?email="+email,
   				success:function(data){
   					
   					if (!/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/.test(email) || email == null) {
   					    $(".body").html("올바른 이메일을 입력해주세요.");
   					    $('#Modal').modal('show');
   					}else{
   						//console.log("data : "+data)
   						$(".body").html("인증번호를 발송했습니다.");
   				   	    $('#Modal').modal('show');
   						code=data
   					}							
   				}
   			})
   		})
	               		
	               			
      		/* 인증번호 비교 */
       		$("#completion").click(function(){
       			var inputCode = $("#Certification").val()		// 입력코드		
       			if(inputCode == code && inputCode != ''){
       				$(".body").html("인증번호가 일치합니다.");
       		   	    $('#Modal').modal('show');
       			}else{
       				$(".body").html("인증번호가 일치하지 않습니다.<br>다시 확인해주세요.");
       		   	    $('#Modal').modal('show');
       			}
	               			
       		})
       		
       		//비밀번호 재확인이랑 비밀번호랑 같지 않을 때 회원가입 안되게 하기
			function check_num(){
				var inputCode = $("#Certification").val()		// 입력코드
				  if(inputCode != code){
					  $(".body").html("인증번호가 일치하지 않습니다.<br>다시 확인해주세요.");
				   	  $('#Modal').modal('show');
				   	  return false;
				  }
				  return true;
			}
  	 </script>
  	 
  	 <!-- Modal -->
	        <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	          <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	              </div>
	              <div class="modal-body body">
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	              </div>
	            </div>
	          </div>
	        </div>
  </body>
</html>
