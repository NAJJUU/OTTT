<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OTTT</title>  

    <link rel="stylesheet" href="../resources/css/member/agree.css" >   
    <script src="./script/jquery-3.6.1.min.js"></script>
    <script src="./script/script.js"></script>
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
              <a href="#">영화&nbsp;&nbsp;</a>
            </li>
            <li>
              <a href="#">드라마&nbsp;</a>
            </li>
            <li>
              <a href="#">예능</a>
            </li>
            <li>
              <a href="#">애니&nbsp;</a>
            </li>
            <li>
              <a href="#">게시판</a>
            </li>
          </ul>
        </nav>
        <div class="h-icon">
          <ul>
            <li>
              <a href="search">
                <!-- <img src="./images/icon/search02.png" alt="검색"> -->
              </a>
            </li>
            <li>
              <a href="#">
                <!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              </a>
            </li>
          </ul>
        </div>
         
       
        
        <div class="wrapper">

          <h1 style="font-size: 21px; display: inline-block;">약관동의</h1>
          	
			<form id = "membership" action="/member/join">
            <label class="box1" style="position: absolute; bottom: 100%; left: 70%;">
              <input type="checkbox" id="agree-all">
              모두 동의
          </label>
          <div class="Agree1" style="overflow-y:scroll;  width:500px; height:150px;">
              <div style="border: 1px solid black; padding: 10px;">집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다</div>
          </div>
          <label class="box2" style="position: absolute; bottom: 67%; left: 70%;">
              <input type="checkbox" class="agreecheck" id="agreecheck2">
              약관 동의
          </label>
          <div class="Agree2" style="overflow-y:scroll;  width:500px; height:150px;">
              <div style="border: 1px solid black; padding: 10px;">집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다</div>
          </div>
          <label class="box3" style="position: absolute; bottom: 27%; left: 70%;">
              <input type="checkbox" class="agreecheck" id="agreecheck3">
              약관 동의
          </label>
         
  
   
          
          <script>
              const agreeAllCheckbox = document.getElementById('agree-all');
              const agreeCheckboxes = document.querySelectorAll('.agreecheck');
          
              agreeAllCheckbox.addEventListener('change', (event) => {
                  const isChecked = event.target.checked;
                  agreeCheckboxes.forEach((checkbox) => {
                      checkbox.checked = isChecked;
                  });
              });
              const membershipForm = document.getElementById('membership');

              membershipForm.addEventListener('submit', (event) => {
                const isAllAgreed = Array.from(agreeCheckboxes).every((checkbox) => checkbox.checked);
                if (!isAllAgreed) {
                  event.preventDefault();
                  alert('모든 약관에 동의해주세요.');
                }
              });
          </script>
          
                    
            
             
                <div class="back">
                	<a href="member/login">
                    <input type="button" value="이전">
                  </a>
                </div>
                <div class="complate">
                	<a href="/member/join">
                  	  <input type="submit" value="다음">
                  	</a>	
                </div>
            </form>
               </div>
           
    
              




      </header>

  </body>
</html>