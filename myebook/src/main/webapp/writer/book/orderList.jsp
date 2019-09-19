<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 /*section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }*/
div#container_box {
	float: left;
	
}
 section#content ul li {
 width: 900px;
 margin-right : 20px; 
 border:5px solid #eee; 
 padding:10px 20px; 
 margin-bottom:20px; 
 float : left;
}
 section#content .orderList span {
 float:left;  font-size:20px; font-weight:bold; 
 display:inline-block; width:90px; margin-right:10px; }
 
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
				<%@ include file="/writer/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
		<aside id = "aside">
				<%@ include file="/writer/aside.jsp"%>
			</aside>
			<div id = "container_box">
					<section id="content">
 
					 <ul class="orderList">
					  <c:forEach items="${orderList}" var="orderList">
					  <li>
					  <div>
					   <p><span>주문번호</span><a href="./orderView?n=${orderList.odid}">${orderList.odid}</a></p>
					   <p><span>수령인</span>${orderList.orderRec}</p>
					   <p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
					   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
					   <p><span>상태</span>${orderList.delivery}</p>			 
					  </div>
					  </li>
					  </c:forEach>
					 </ul>

			</section>
			
			
			</div>
		</section>

		<footer id="footer">
			<div id=footer_box>
				<%@ include file="/writer/footer.jsp"%>
			</div>
		</footer>

</div>
	
</body>

</html>

