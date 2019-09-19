<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<html>
<head>
<title>상품리스트</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: '맑은 고딕', verdana;
}

a {
	color: #05f;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}

ul, lo, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

/* ---------- */
div#root {
	width: 900px;
	margin: 0 auto;
}

header#header {
	
}

nav#nav {
	
}

section#container {
	
}

section#content {
	float: right;
	width: 900px;
	position: -80px;
}

aside#aside {
	float: left;
	width: 180px;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

footer#footer {
	background: #eee;
	padding: 20px;
}

/* ---------- */
nav#nav div#nav_box {
	font-size: 14px;
	padding: 10px;
	text-align: right;
}

nav#nav div#nav_box li {
	display: inline-block;
	margin: 0 10px;
}

nav#nav div#nav_box li a {
	color: #333;
}

section#container {
	
}

aside#aside h3 {
	font-size: 22px;
	margin-bottom: 20px;
	text-align: center;
}

aside#aside li {
	font-size: 16px;
	text-align: center;
}

aside#aside li a {
	color: #000;
	display: block;
	padding: 10px 0;
}

aside#aside li a:hover {
	text-decoration: none;
	background: #eee;
}

aside#aside li {
	position: relative;
}

aside#aside li:hover {
	background: #eee;
}

aside#aside li>ul.low {
	display: none;
	position: absolute;
	top: 0;
	left: 180px;
	 
}

aside#aside li:hover>ul.low {
	display: block;
}

aside#aside li:hover>ul.low li a {
	background: #eee;
	border: 1px solid #eee;
}

aside#aside li:hover>ul.low li a:hover {
	background: #fff;
}

aside#aside li>ul.low li {
	width: 180px;
}

footer#footer {
	margin-top: 100px;
	border-radius: 50px 50px 0 0;
}

footer#footer div#footer_box {
	padding: 0 20px;
}
</style>
<style>
section#content ul li {
	display: inline-block;
	margin: 10px;
}

section#content div.goodsThumb img {
	width: 150px;
	height: 200px;
}

section#content div.goodsName {
	padding: 10px 0;
	text-align: center;
}

section#content div.goodsName a {
	color: #000;
}
</style>

<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var cate_name = "${cate_name}";
		var level = "${level}";
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/list.do";
		url = url + "?cate_name=" + cate_name;
		url = url + "&level=" + level;
		url = url + "&page=" + page;
		url = url + "&range=" + range;

		location.href = encodeURI(url);
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword,
			cate_name) {
		var cate_name = "${cate_name}";
		var level = "${level}";
		var url = "${pageContext.request.contextPath}/list.do";
		url = url + "?cate_name=" + cate_name;
		url = url + "&level=" + level;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = encodeURI(url);
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var cate_name = "${cate_name}";
		var level = "${level}";
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/list.do";
		url = url + "?cate_name=" + cate_name;
		url = url + "&level=" + level;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = encodeURI(url);

	}

	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var cate_name = "${cate_name}";
		var level = "${level}";
		var url = "${pageContext.request.contextPath}/list.do";
		url = url + "?cate_name=" + cate_name;
		url = url + "&level=" + level;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = encodeURI(url);
		console.log(url);
	});
</script>
</head>
<body>
	<nav id="nav">
		<div id="nav_box"></div>
		<input type="hidden" id="cate_name" value="${cate_name}" /> <input
			type="hidden" id="level" value="${level}" />

	</nav>

	<section id="container">
		<div id="container_box">
			<section id="content">

				<ul>
					<c:forEach items="${list}" var="list">
						<li>
							<div class="goodsThumb">
								<img src="${list.thumbImg}">
							</div>
							<div class="goodsName">
								<a href="./view.do?n=${list.bkid}">${list.bookname}</a>
							</div>
						</li>
					</c:forEach>
				</ul>

				<!-- pagination{s} -->

				<div id="paginationBox">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
						</c:if>

						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="idx">
							<li
								class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
								class="page-link" href="#"
								onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
									${idx} </a></li>
						</c:forEach>

						<c:if test="${pagination.next}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
						</c:if>
					</ul>
				</div>

				<!-- pagination{e} -->
				<!-- search{s} -->

				<div class="form-group row justify-content-center">
					<div class="w100" style="padding-right: 10px">
						<select class="form-control form-control-sm" name="searchType"
							id="searchType">
							<option value="bookname">책이름</option>
							<option value="sellingtype">판매유형(이북,종이책)</option>
						</select>

					</div>
					<div class="w300" style="padding-right: 10px">
						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword">
					</div>
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch"
							id="btnSearch">검색</button>
					</div>

				</div>

				<!-- search{e} -->
			</section>



			<aside id="aside">
				<%@ include file="/include/aside.jsp"%>
			</aside>

		</div>
	</section>



	<footer id="footer">
		<div id=footer_box>
			<%@ include file="/include/footer.jsp"%>
		</div>
	</footer>



</body>

</html>

