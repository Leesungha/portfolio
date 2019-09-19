<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<html>
<head>

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
</style>


<style>
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
#container_box table td { 
width:300px; 
}
</style>
<style>
#container_box table{
width:900px;
}
#container_box table th{
font-size:20px;
font-weight:bold;
text-align:center;
padding:10px;
border-botton:2px solid #666;
}
#container_box table tr:hover{
background:#eee;
}
#container_box table td{
padding:10px;
text-align:center;
}
#container_box table img{
width:150px; 
height:200px;
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
			<table>
				 <thead>
					  <tr>
				 	  <th>썸네일</th>
					   <th>번호</th>
					   <th>책 이름</th>
					   <th>대분류</th>
					   <th>소분류</th>
					   <th>가격</th>
					   <th>수량</th>
					   <th>등록일</th>
					   <th>유형</th>
					  </tr>
				 </thead>
	 <tbody>
	  <c:forEach items="${booklist}" var="booklist">
				 
				 <tr>
				  <td><img src ="${booklist.thumbImg}">
				  </td>
				   <td>${booklist.bkid}</td>		  
				    <td>
				    <a href="#" onClick="book_contentView(<c:out value="${booklist.bkid}"/>)">
				    <c:out value="${booklist.bookname}"></c:out></a>
				   </td>	
				   <td>${booklist.level}</td>
				   <td>${booklist.cate_name}</td>
				   <td>
				   <fmt:formatNumber value = "${booklist.price}" pattern = "###,###,###"/>
				   </td>
				   <td>${booklist.gdsStock}</td>
				   <td>${booklist.reg_dt}</td>
				   <td>${booklist.sellingtype}</td>
				 </tr>   
 	 </c:forEach>
	 </tbody>
	</table>			

			</div>
		</section>

		<footer id="footer">
			<div id=footer_box>
				<%@ include file="../footer.jsp"%>
			</div>
		</footer>
	</div>

	<script>
	function book_contentView(bkid){
		var url = "${pageContext.request.contextPath}/bookview.do";
		url = url + "?bkid="+bkid;
		alert(url);
		location.href = url;
	}
</script>

</body>

</html>

