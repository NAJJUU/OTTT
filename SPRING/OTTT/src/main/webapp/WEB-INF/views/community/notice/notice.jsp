<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/community/notice/notice.css" >
    <script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

</head>
<body style="background-color: #202020;">
     
    <div class="wrap">
      <header >
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
              <a href="<c:url value="/community" />" style="color: #33ff33;">게시판</a>
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
              <a href="<c:url value='${loginoutlink}' /> " class="${loginout}">
                <!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              </a>
            </li>
          </ul>
        </div>
      </header>

        <div id="line-1" >
          <nav class="nav">
          <a class="nav-link1" href="<c:url value='/community' />">자유게시판</a>
          <a class="nav-link1" href="<c:url value='/community/endmovie/tving' />">종료예정작</a>
          <a class="nav-link1" href="<c:url value='/community/priceInfoTving' />">가격정보</a>
          <a class="nav-link1" href="<c:url value='/community/QnA' />">Q&A</a>
          <a class="nav-link1" href="<c:url value='/community/notice' />" style="color: #33ff33;">공지사항</a>
        </nav>
        </div>



        <!--글작성 관련 시작-->
      <div class="qa-main">
        <!-- 검색 배너-->
        <div class="search-var">
          <span>제목+내용</span>
          <input  type="text" class="search-input"/>
          <button type="button" class="btn btn-outline-success">검색</button>
        </div>
        
        <c:if test="${userDTO.admin.toString() == 'Y' }">
	        <div style="margin-top:30px; justify-content: flex-end; display: flex;">
	          <button type="button" class="btn btn-outline-success" style="position: relative; left: -100px;">글작성</button> 
	        </div>
        </c:if>
        
    
        <!-- 글목록 배너-->
        <div class="title-region">
          	<div class="title-mainline" style="display: flex; justify-content: space-around; font-size: 20px;">
            	<div>제목</div>
        	    <div>날짜</div>
    	     </div>		
    	     <c:forEach var="articleDTO" items="${list}">
				<div class="title-line" style="display: flex; justify-content: space-around; font-size: 20px;">
			        <div><a href="<c:url value="/community/notice/read${pr.sc.queryString}&article_no=${articleDTO.article_no }" />">${articleDTO.article_title}</a></div>
		           	<div><fmt:formatDate value="${articleDTO.article_create_dt}" pattern="yyyy-MM-dd" type="date"/></div>
		       	</div>					
			</c:forEach>
	         
		     <c:if test="${totalCnt == null || totalCnt == 0}">
				<div class="title-line" style="text-align: center;">
	  	         	등록된 공지사항이 없습니다.
	    	   	</div>
			</c:if>    
			<c:if test="${totalCnt != null || totalCnt != 0}">
				<!-- 페이지 번호 배너-->
		        <div class="page-num" style="margin-top: 20px;">
		          <nav aria-label="Page navigation example" class="d-flex flex-row justify-content-center">
		            <ul class="pagination">
		            <c:if test="${pr.showPrev}">
			            <li class="page-item">
			                <a class="page-link" href='<c:url value="/community/notice${pr.sc.getQueryString(pr.beginPage-1)}" />' aria-label="Previous">
			                  <span aria-hidden="true">&laquo;</span>
			                </a>
			              </li>
		            </c:if>
		            <c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
		            	<li class="page-item"><a class="page-link" href='<c:url value="/community/notice${pr.sc.getQueryString(i)}" />'>${i}</a></li>
		            </c:forEach>
		              <c:if test="${pr.showNext}">
			              <li class="page-item">
			                <a class="page-link" href='<c:url value="/community/notice${pr.sc.getQueryString(pr.endPage-1)}" />' aria-label="Next">
			                  <span aria-hidden="true">&raquo;</span>
			                </a>
			              </li>
		              </c:if>
		              
		            </ul>
		          </nav>
		        </div>
			</c:if>
		</div>

        
      </div>

  </body>
</html>