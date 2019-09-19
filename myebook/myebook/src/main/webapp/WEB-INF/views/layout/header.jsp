<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<style>
.navbar-brand{
	font-size: 1.0rem;
	}
.font-size14{
	font-size: 1.2rem;
    font-weight: 400;
    line-height: 1.5;
    }
.nav-link {
	display: block;
    padding: .5rem 1rem;
    padding-top: 0.5rem;
    padding-right: 2rem;
    padding-bottom: 0.5rem;
    padding-left: 2rem;
}
</style>

<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="http://localhost:8080/myebook/">Myebook.com</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample03" aria-controls="navbarsExample03"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${member == null}">
						<li class="nav-item">
						<a class="nav-link"
							href="./memberJoinForm.do">회원가입</a></li>
						<li class="nav-item">
						<a class="nav-link"
							href="./login_form.do">로그인</a></li>
						<li class="nav-item">
						<a class="nav-link"
							href="#">캐시충전</a></li>
					</c:when>

					<c:when test="${member.admin_status == true}">
						<li class="nav-item dropdown show"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown03"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">작가페이지(${member.user_id})</a>
							<div class="dropdown-menu" aria-labelledby="dropdown03">
								<a class="dropdown-item" href="./getUserList.do">회원 관리</a> 
										<a class="dropdown-item" href="./getBook.do">상품 관리</a> 							
									<a class="dropdown-item" href="./logout.do">로그아웃</a>
							</div></li>
					</c:when>

					<c:when test="${member.admin_status != true }">
						<li class="nav-item dropdown show"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown03"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지(${member.user_id})</a>
							<div class="dropdown-menu" aria-labelledby="dropdown03">
								<a class="dropdown-item" href="./mypage.do">마이페이지</a> 
								<a class="dropdown-item" href="./cartList.do">카트리스트</a> 
								<a class="dropdown-item" href="./myorder.do">주문리스트</a> 	
								<a class="dropdown-item" href="./bookshelf.do">내 서재</a> 
								<a class="dropdown-item" href="./logout.do">로그아웃</a>
							</div><li class="nav-item"><a class="nav-link" href="#">캐시충전</a>
     					 </li>
    			
				 </c:when>       
         </c:choose>  
       </ul>          
  </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample08" aria-controls="navbarsExample08"
			aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-md-center"
			id="navbarsExample08">
    <ul class="navbar-nav">
      <li class="nav-item font-size14">
        <a class="nav-link" href="./move_myebook.do">마이북</a>
      </li>
     	 <li class="nav-item font-size14">
     	  <a class="nav-link" href="#">이벤트</a>
      </li>
    	  <li class="nav-item font-size14">
      	  <a class="nav-link" href="#">연재관</a>
      </li>
       <li class="nav-item font-size14">
      	  <a class="nav-link" href="#">베스트</a>
      </li>
      		<li class="nav-item dropdown show">
        <a class="nav-link dropdown-toggle font-size14" href="#" id="dropdown03"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
        <div class="dropdown-menu" aria-labelledby="dropdown03">
            <a class="dropdown-item" id = "cate_cd" data-value ="자유">자유게시판</a>
          <a class="dropdown-item" id = "cate_cd" data-value ="공지">공지게시판</a>
          <a class="dropdown-item" id = "cate_cd" data-value = "구매">구매 문의</a>
          
        </div>   
         <script>
        $(document).on('click', '.dropdown-item', function(){   
        	var cate_cd = $(this).attr('data-value')
            var url = "${pageContext.request.contextPath}/getBoardList.do";
            url = url + "?cate_cd=" + cate_cd;
        		location.href = url;
        });
        </script>         
      </li>
    </ul>
  </div>
</nav>
</body></html>
