<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OTTTlogin</title>  
    <script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
       
    <link rel="stylesheet" href="../resources/css/member/login.css" >   
    <script src="../resources/js/member/jquery-3.6.1.min.js"></script>
    <script src="../resources/js/member/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="wrap">
      <header>
        <div class="logo">
          <a href="/main">
            <img src="../resources/img/OTTT.png" alt="로고">
          </a>
        </div>
        <nav class="gnb">
          <ul>
            <li>
              <a href="#">영화</a>
            </li>
            <li>
              <a href="#">드라마</a>
            </li>
            <li>
              <a href="#">예능</a>
            </li>
            <li>
              <a href="#">애니</a>
            </li>
            <li>
              <a href="#">게시판</a>
            </li>
          </ul>
        </nav>
        <div class="h-icon">
          <ul>
            <li>
              <a class="p3" href="/search">
                <!-- <img src="./images/icon/search02.png" alt="검색"> -->
              </a>
            </li>
            <li>
              <a class="p4" href="/member/login">
               <!--  <img src="./images/icon/user01.png" alt="내 정보"> --> 
              </a>
            </li>
          </ul> 
        </div>
         
            <c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
         
        <div class = "Login">   
          <img src = "../resources/img/OTTTLOGIN.png" width="300" height="80">
          
       
      

          <form method="post" id="login_form">
          <div class="hihi">
            <input type="text"  name="memberId" placeholder="아이디" class="id_input">
            <input type="password"  name="memberPw"  placeholder="비밀번호" class="pw_input">
            <input type="submit" class="login_button
            " value="로그인" >

            </div>

            <a>
            <input type="button" value="회원가입" onClick="location.href='/member/agree'" class="join" >
            <input type="button" value="아이디 찾기" onClick="location.href='#'" class="join">
            <input type="button" value="비밀번호 찾기" onClick="location.href='#'" class="join">
            </a>
            
            <img src = "../resources/img/ㄴㅂ.png" width="290" height="40" class="naver">
            
        
            
            <img src = "../resources/img/카톡.png" width="290" height="40" class="kakao">
            
           
            
            <img src = "../resources/img/구글로그인.png" width="290" height="40" class="google">
            
        </form>
         </div>
 <script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
           	 
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
    });
 
</script>        


      
        

      </header>

  </body>
</html>