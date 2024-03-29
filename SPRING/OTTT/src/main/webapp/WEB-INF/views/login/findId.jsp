<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>아이디 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/login/findid.css" >
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
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
<body style="background-color: #202020;">
	<div class="wrap">
		<%@ include file="../fix/header.jsp" %>
		
		<section class="sec00">
			<form method="get" action="<c:url value="/login/checkID" />" id="membership" onsubmit="return check_findId()">
				<h1 style="font-size: 21px; display: inline-block;">아이디 찾기</h1>
                <div class="email">
                	<input type="email"name="user_email" class="email_input"  id="email" title="EM" placeholder="이메일"  pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" required>
                 	<span>
                  		<select id="domain" name="직접입력">
		                    <option value="select">직접입력</option>
		                    <option value="naver.com">네이버</option>
		                    <option value="gmail.com">구글</option>
                  		</select>
                 	</span> 
               	<button id="send-verification-code" type="button">인증번호 발송</button>
               	<div class="emailChk">
							<span class="errorMsg" id="emailErrorMsg" style="position: absolute; left: 950px;"></span>
					    	<span class="email_input_re_1">등록되어 있지 않은 이메일입니다.</span>
							<span class="email_input_re_2">등록되어 있는 이메일입니다.</span>
					    </div>
               	</div>
                
                <div class="Certification">
                	<input type="text" id="Certification" title="인증번호" maxlength="6"  placeholder="인증번호"  pattern="\d{6}" required>
                	<button id="completion" type="button">인증확인</button>
                </div>
                
                <div class="back" style="display: inline-block; pointer-events: none;">
                	<a href="<c:url value="/login" />" style="pointer-events: none;">
                		<input type="button" value="이전" style="pointer-events: auto;">
               		</a>
           		</div>
           		
                <div class="complate">
                	<input type="submit" value="다음">
               	</div>
       	   </form>
   	   </section>
   </div>
  
  
 	<script> 	
 	
 	var code = "";		// 이메일 전송 인증번호 저장위한 코드
	
	/* 유효성 검사 통과유무 변수 */
	var emailCheck = false;		//이메일 중복검사

	$(document).ready(function() {
		
		document.getElementById('domain').addEventListener('change', function() {
			var domain = this.value;
			if (domain !== 'select') {
				document.getElementById('email').value += '@' + domain;
			}
		});
		
	/* 입력 이메일 형식 유효성 검사 */
	$("#email").on("blur", function(){
		var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var emailValue = $(this).val();
		
		if(!emailRegex.test(emailValue)){
			$("#emailErrorMsg").text('올바른 형식의 이메일을 입력해주세요.');
		} else{
			$("#emailErrorMsg").text('');
		}
	})
	
	//이메일 중복검사
	$('.email_input').on("propertychange change keyup paste input", function(){
		
		var user_email = $('.email_input').val();			// .id_input에 입력되는 값
	  	var data = {user_email : user_email};				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	  
	  	$.ajax({
	  		type : "post",
		    url : "/signin/emailChk",
		    data : data,
		    success : function(result){
		    	
		    	/* console.log("성공 여부" + result);	 */				    	
				if(result != 'success'){
					$('.email_input_re_1').css("display","inline-block");
					$('.email_input_re_2').css("display", "none");
					emailCheck = true;
				} else {
					$('.email_input_re_2').css("display","inline-block");
					$('.email_input_re_1').css("display", "none");
					emailCheck = false;
				}
	     
			}// success 종료
	
		}); // ajax 종료
	
	});// function 종료
	
	/* 인증번호 이메일 전송 */
	$("#send-verification-code").click(function() {
	    var email = $("#email").val();    // 입력한 이메일
	    var checkBox = $("#Certification");    // 인증번호 입력란
	    
	    if (emailCheck) {
	        $(".body").html("등록되어 있는 이메일이 아닙니다.");
	        $('#Modal').modal('show');
	    } else {
	        if (!/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/.test(email) || email == null) {
	            $(".body").html("올바른 이메일을 입력해주세요.");
	            $('#Modal').modal('show');
	        } else {
	            $(".body").html("인증번호를 발송했습니다.");
	            $('#Modal').modal('show');
	            $.ajax({
	                type: "GET",
	                url: "/signin/mailCheck?email=" + email,
	                success: function(data) {
	                    code = data;
	                }
	            });
	        }
	    }
	});
	
		
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
        
    });

	function check_findId(){
	
		var inputCode = $("#Certification").val()
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
