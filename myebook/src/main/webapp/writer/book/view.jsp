<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>kubg Admin</title>

<!-- <script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js">

</script> -->

<style>
body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

div#root {
	width: 90%;
	margin: 0 auto;
}

header#header {
	font-size: 60px;
	padding: 20px 0;
}

header#header h1 a {
	color: #000;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
}

aside ul li a:hover {
	background: #eee;
}

footer#footer {
	background: #f9f9f9;
	padding: 20px;
}

footer#footer ul li {
	display: inline-block;
	margin-right: 10px;
}

.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#gdsDes {
	width: 400px;
	height: 180px;
}

.oriImg{
width:300px; height:auto;
}

.thumbImg{
width:300px;
}
</style>

</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../header.jsp"%>
			</div>
		</header>
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../nav.jsp"%>
			</div>
		</nav>	
		<section id="container">
			<aside>
				<%@ include file="../aside.jsp"%>
			</aside>

			<div id="container_box">

				<h2>상품 정보</h2>

				<form role="form" method="post" autocomplete="off">
				<input type="hidden" name="bkid" id = "bkid" value="${book.bkid}" />
				<input type="hidden" name="id" id = "id" value="${member.id}" />
				
				
				<div class="inputArea"> 
				 <label>대분류</label>
				 <span class="category1">${book.level}</span>        
				 <label>소분류</label>
				 <span class="category2">${book.cate_name}</span>
				</div>

				<div class="inputArea">
				 <label for="bookname">책 이름</label>
				 <span>${book.bookname}</span>
				</div>

				<div class="inputArea">
				 <label for="price">책 가격</label>
				 <span><fmt:formatNumber value="${book.price}" pattern="###,###,###"/></span>
				</div>
				
				<div class="inputArea">
				 <label for="gdsStock">책 수량</label>
				 <span><fmt:formatNumber value="${book.gdsStock}" pattern="###,###,###"/></span>
				</div>
				
				<div class="inputArea">
				 <label for="gdsDes">책 설명</label>
				 <span>${book.gdsDes}</span>
				</div>
				
				<div class="inputArea">
 				<label for="gdsImg">이미지</label>
				 <p>원본 이미지</p>
				
 				<img src="${book.gdsImg}" class="oriImg"/>
 
 				<p>썸네일</p>
 				<img src="${book.thumbImg}" class="thumbImg"/>
				</div>

				<div class="inputArea">
				 <label for="reg_dt">등록날짜</label>
				 <span>${book.reg_dt}</span>
				</div>
				
				
				<div class="inputArea">
				 <label for="sellingtype">판매 유형</label>
				 <span>${book.sellingtype}</span>
				</div>

			<div class="inputArea">
			 <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
			 <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
				
	 <script>
	  var formObj = $("form[role='form']");	  
	  $("#modify_Btn").click(function(){
		  alert($('#bkid').val());
		  var bkid = $('#bkid').val();
		  var url = "${pageContext.request.contextPath}/bookmodify.do";
			url = url + "?bkid="+bkid;
			alert(url);
			location.href = url;
		  
	  // formObj.attr("action", "/bookmodify.do");
	   //formObj.attr("method", "get")
	  // formObj.submit();
	  });
	  
	  $("#delete_Btn").click(function(){ 
		  var con = confirm("정말로 삭제하시겠습니까?");		  
		  if(con){
	   formObj.attr("action", "${pageContext.request.contextPath}/bookdelete.do");
	   formObj.submit();
		  }
	  });
	 </script>
			
			</div>

		</form>
			</div>
		</section>

		<footer id="footer">
			<div id=footer_box>
				<%@ include file="../footer.jsp"%>
			</div>
		</footer>
	</div>

	<script>
	
</script>

</body>

</html>

