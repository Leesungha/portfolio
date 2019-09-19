<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<html>
<head>
<title>상품정보</title>
<script type="text/javascript">
	$(function() {
		$("#replyForm").submit(function() {
			if ($.trim($("#content").val())) {
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		})
	});

	function replyList() {
		alert("성공!!??");
		var bkid = ${view.bkid};
		$.getJSON("./view/replyList" + "?n=" + bkid,
						function(data) {
							var str = "";

							$(data).each(function() {

												console.log(data);

												var date = new Date(this.reg_dt);

								str += "<li data-repNum'" + this.rid + "'>"
									+ "<div class='userInfo'>"
									+ "<span class='nickname'>"
									+ this.nickname
									+ "</span>"
									+ "<span class='reg_dt'>"
									+ "/"
									+ this.reg_dt
									+ "</span>"
									+ "<div class='starpoint'>"
									+ "<span class='star'>"
									+ this.star
									+ " "
									+ "</span>"
									+ "<span class='starimage'>"
									+ "<img src = 'images/star45.png'>"
									+ "</span>"
									+ "</div>"
									+ "<div class='content'>"
									+ this.content
									+ "</div>"
									+ "<c:if test = '${member !=null}'>"
									+ "<div class='replyFooter'>"
									+ "<button type='button' class='modify' data-repNum='" + this.rid + "'>M</button>"
									+ "<button type='button' class='delete' data-repNum='" + this.rid + "'>D</button>"
									+ "</div>"
									+ "</c:if>"
									+ "</li>";
								});

							$("section.replyList ol").html(str);
						});

		numberOfStar();

	}

	function numberOfStar() {

		var url = "${pageContext.request.contextPath}/numberOfLike";
		var paramData = {
			"n" : "${view.bkid}"
		};

		$.ajax({
			type : 'POST',
			url : url,
			data : paramData,
			dataType : 'json',
			success : function(result) {
				var htmls = "";

				if (result.length < 1) {
					//htmls.push("등록된 댓글이 없습니다.");
				} else {
					$(result).each(
							function() {
								htmls += '<h4 align="justify">평점' + this.star
										+ '</h4>';
							}); //each end
				}
				$("#avestar").html(htmls);

			}
		});
	} // Ajax end

	function numberOfLike() {

		var url = "${pageContext.request.contextPath}/numberOfLike";
		var paramData = {
			"n" : "${view.bkid}"
		};

		$.ajax({
			type : 'POST',
			url : url,
			data : paramData,
			dataType : 'json',
			success : function(result) {
				var htmls = "";

				if (result.length < 1) {
					//htmls.push("등록된 댓글이 없습니다.");
				} else {
					$(result).each(function() {
						//    htmls += '<a class="btn btn-outline-white heart">';
						htmls += '좋아요 "' + this.likey + '"';
						//     htmls += '<img id="heart" name = "heart" src="">';
						//     htmls += '<input type="hidden" id = "likey" value="'+this.likey+'"/>';
						//     htmls += '<input type="hidden" id = "loveorhate" value="'+this.loveorhate+'"/>';	
						//  	htmls += '</a>';
					}); //each end
				}
				$("#spanlikey").html(htmls);
				alert("????");

			}
		});
	} // Ajax end
</script>
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

section#container_box {
	
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
header#header div#header_box {
	text-align: center;
	padding: 30px 0;
}

header#header div#header_box h1 {
	font-size: 50px;
}

header#header div#header_box h1 a {
	color: #000;
}

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
div.goods div.goodsImg {
	float: left;
	width: 350px;
}

div.goods div.goodsImg img {
	width: 250px;
	height: auto;
}

div.goods div.goodsInfo {
	float: left;
	width: 330px;
	font-size: 22px;
}

div.goods div.goodsInfo p {
	margin: 0 0 20px 0;
}

div.goods div.goodsInfo p span {
	display: inline-block;
	width: 100px;
	margin-right: 15px;
}

div.goods div.goodsInfo p.cartStock input {
	font-size: 22px;
	width: 50px;
	padding: 5px;
	margin: 0;
	border: 1px solid #eee;
}

div.goods div.goodsInfo p.cartStock button {
	font-size: 26px;
	border: none;
	background: none;
}

div.goods div.goodsInfo p.addToCart {
	text-align: right;
}

div.goods div.gdsDes {
	font-size: 18px;
	clear: both;
	padding-top: 30px;
}
</style>

<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.goodsInfo {
	 
}

section.replyList div.goodsInfo .nickname {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.goodsInfo .reg_dt {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.content {
	padding: 10px;
	margin: 20px 0;
}

section.replyList div.replyFooter button {
	font-size: 14px;
	border: 1px solid #999;
	background: none;
	margin-right: 10px;
}
</style>

<style>
div.replyModal {
	position: relative;
	z-index: 1;
	display: none;
}

div.modalBackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

div.modalContent {
	position: fixed;
	top: 20%;
	left: calc(50% - 250px);
	width: 500px;
	height: 320px;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

div.modalContent textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 477px;
	height: 200px;
}

div.modalContent button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

div.modalContent button.modal_cancel {
	margin-left: 20px;
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>

</head>
<body>
	<nav id="nav">
		<div id="nav_box"></div>
	</nav>

	<section id="container">
		<div id="container_box">
			<section id="content">

				<form role="form" method="post">
					<input type="hidden" id = "bkid" name="bkid" value="${view.bkid}" />
				</form>
				<!-- 장바구니 기능을 만들기 위해 숨겨둔 코드 -->

				<div class="goods">

					<div class="goodsImg">
						<img src="${view.gdsImg}">
					</div>

					<div class="goodsInfo">

						<p class="bookname">
							<span>책 이름 </span>${view.bookname}</p>
						<p class="price">
							<span>가격 </span>
							<fmt:formatNumber pattern="###,###,###" value="${view.price}" />
							원
						</p>

						<p class="reg_dt">
							<span>등록 날짜 </span>${view.reg_dt}</p>

						<p class="sellingtype">
							<span>판매 유형 </span>${view.sellingtype}</p>

						<p class="gdsStock">
							<span>남은 수량 </span>${view.gdsStock}</p>

						<c:if test="${view.gdsStock != 0}">
							<p class="cartStock">
								<span>구입 수량</span>
								<button type="button" class="plus">+</button>
								<input type="number" class="numBox" min="1" max="10" value="1"
									readonly="readonly" />
								<button type="button" class="minus">-</button>

								<script>
									$(".plus").click(function() {
										var num = $(".numBox").val();
										var plusNum = Number(num) + 1;

										if (plusNum >= 11) {
											$(".numBox").val(num);
										} else {
											$(".numBox").val(plusNum);
										}
									});

									$(".minus").click(function() {
										var num = $(".numBox").val();
										var minusNum = Number(num) - 1;

										if (minusNum <= 0) {
											$(".numBox").val(num);
										} else {
											$(".numBox").val(minusNum);
										}
									});
								</script>

							</p>
							<p class="addToCart">
								<button type="button" class="addCart_btn">카트에 담기</button>
							</p>
							<script>
								$(".addCart_btn").click(function() {
									var bkid = $("#bkid").val();
									var cartStock = $(".numBox").val();

									var data = {
										"bkid" : bkid,
										"cartStock" : cartStock
									};

									$.ajax({
										url : "./view/addCart",
										type : "post",
										data : data,
										success : function(result) {

											if (result == 1) {
												alert("카트 담기 성공");
												$(".numBox").val("1");
											} else {
												alert("회원만 사용할 수 있습니다.");
												$(".numBox").val("1");
											}
										},
										error : function() {
											alert("카트 담기 실패");
										}
									});
								});
							</script>
							<div id="numberOfLike" style="text-align: right;">
								<a class="btn btn-outline-white heart"> <span id="spanlikey">좋아요
										${view.likey}</span> <img id="heart" name="heart" src=""> <input
									type="hidden" id="likey" value="${view.likey}" /> <input
									type="hidden" id="loveorhate" value="${loveorhate}" />
								</a>
							</div>
							<script>
								$(document)
										.ready(
												function() {
													var heartval = $(
															"#loveorhate")
															.val();
													alert(heartval);

													if (heartval == 0) {

														$("#heart")
																.prop("src",
																		"images/heart3.png");
														$(".heart").prop(
																'name',
																heartval)
													} else {
														$("#heart")
																.prop("src",
																		"images/heart4.png");
														$(".heart").prop(
																'name',
																heartval)
													}

													$(".heart")
															.on(
																	"click",
																	function() {

																		var that = $(".heart");

																		var sendData = {
																			'bkid' : '${view.bkid}',
																			'heart' : that
																					.prop('name')
																		};

																		$
																				.ajax({
																					url : '${pageContext.request.contextPath}/heart',
																					type : 'POST',
																					data : sendData,
																					success : function(
																							data) {
																						that
																								.prop(
																										'name',
																										data);
																						if (data == 1) {
																							$(
																									'#heart')
																									.prop(
																											"src",
																											"images/heart4.png"); //차있는하트
																							numberOfLike();
																						} else {
																							$(
																									'#heart')
																									.prop(
																											"src",
																											"images/heart3.png"); //빈하트
																							numberOfLike();
																						}
																					}
																				});
																	});
												});
							</script>
						</c:if>
						<c:if test="${view.gdsStock == 0}">
							<p>상품 수량이 부족합니다.</p>
						</c:if>
					</div>

					<div class="gdsDes">${view.gdsDes}</div>

					<br></br>
					<div class="avestar" id="avestar">
						<h4 align="justify">평점 ${view.star}</h4>
					</div>

				</div>


				<div id="reply">
					<c:if test="${member == null}">
						<p>
							소감을 남기시려면 <a href="/login_form.do">로그인</a>해주세요
						</p>
					</c:if>

					<c:if test="${member != null}">
						<section class="replyForm" name="replyForm" id="replyForm">
							<form role="form" method="post" autocomplete="off"
								action="${pageContext.request.contextPath}view/save.do">
								<input type="hidden" name="bkid" id=bkid value="${view.bkid}">
								<input type="hidden" name="point" id="point" />

								<div class="starRev">
									<span class="starR1 on" id="star1_Left" data-value="0.5">별1_왼쪽</span>
									<span class="starR2 on" id="star1_Right" data-value="1.0">별1_오른쪽</span>
									<span class="starR1 on" id="star2_Left" data-value="1.5">별2_왼쪽</span>
									<span class="starR2 on" id="star2_Right" data-value="2.0">별2_오른쪽</span>
									<span class="starR1 on" id="star3_Left" data-value="2.5">별3_왼쪽</span>
									<span class="starR2 on" id="star3_Right" data-value="3.0">별3_오른쪽</span>
									<span class="starR1 on" id="star4_Left" data-value="3.5">별4_왼쪽</span>
									<span class="starR2 on" id="star4_Right" data-value="4.0">별4_오른쪽</span>
									<span class="starR1 on" id="star5_Left" data-value="4.5">별5_왼쪽</span>
									<span class="starR2 on" id="star5_Right" data-value="5.0">별5_오른쪽</span>
								</div>

								<div class="input_area">
									<textarea name="content" id="content"></textarea>
								</div>

								<div class="input_area">
									<button type="button" id="reply_btn">소감 남기기</button>

									<script>
										$('.starRev>span').click(
												function() {
													$(this).parent().children(
															'span.on')
															.removeClass('on');
													$(this).addClass('on')
															.prevAll('span')
															.addClass('on');
													var bb = $(this).attr(
															'data-value');
													$("#point").val(bb); // 히든 인풋에 값 저장.
													alert(bb);
													return false;
												});

										$("#reply_btn")
												.click(
														function() {

															var star = $(
																	"#point")
																	.val();
															alert(star);
															if (star == "") {
																alert("별을 클릭하여 별점을 매겨주세요.");
																return 1;
															}
															var bkid = $(
																	"#bkid")
																	.val();
															alert(bkid);
															var content = $(
																	"textarea#content")
																	.val();
															alert(content);

															var data = {
																"star" : star,
																"bkid" : bkid,
																"content" : content
															};

															$
																	.ajax({
																		url : "./view/save.do",
																		type : "post",
																		data : data,
																		success : function(
																				result) {
																			if (result == 0) {
																				replyList();
																				alert("소감은 1회 입력 가능합니다.");
																			} else {
																				replyList();
																				$(
																						"textarea#content")
																						.val(
																								"");
																			}
																		}
																	});
														});
									</script>
								</div>
							</form>
						</section>
					</c:if>
					<section class="replyList">

						<ol>
							<%-- 
		  <c:forEach items = "${reply}" var = "reply">
		   <li>
		   	<div class = "userInfo">
		   		<span class = "nickname">${reply.nickname}</span>
		   		<span class = "date">${reply.reg_dt}</span>
		   	</div>
		   <div class = "content">${reply.content}</div>
		   </li>
		   
		   </c:forEach>--%>
						</ol>
						 

						<script>
							replyList();
						</script>



						<script>
							$(document).on(
									"click",
									".modify",
									function() {
										//$(".replyModal").attr("style", "display:block;");
										$(".replyModal").fadeIn(200);

										var rid = $(this).attr("data-repNum");
										var content = $(this).parent().parent()
												.children(".content").text();
										var bkid = "${view.bkid}";

										$(".modal_repCon").val(content);
										$(".modal_modify_btn").attr(
												"data-repNum", rid);

										// $(".starRev").addClass('on').prevAll('span').addClass('on');
										// $(".starRev").parent().children('span.on').removeClass('on');

									});

							$(document).on("click", ".delete", function() {

								var deleteConfirm = confirm("정말로 삭제하시겠습니까?");

								if (deleteConfirm) {

									var data = {
										rid : $(this).attr("data-repNum"),
										bkid : "${view.bkid}"
									};

									$.ajax({
										url : "./view/deleteReply",
										type : "post",
										data : data,
										success : function(result) {
											if (result == 1) {
												replyList();
												
											} else {
												alert("작성자 본인만 할 수 있습니다.");
											}
										},
										error : function() {
											alert("로그인하셔야합니다.");
										}
									});
								}
							});
						</script>
					</section>
				</div>
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

	<div class="replyModal">
<input type="hidden" id="bkid" name = "bkid" value="${view.bkid}" />
		<div class="modalContent">

			<div class="starRev">
				<span class="starR1 on" id="star1_Left" data-value="0.5">별1_왼쪽</span>
				<span class="starR2 on" id="star1_Right" data-value="1.0">별1_오른쪽</span>
				<span class="starR1 on" id="star2_Left" data-value="1.5">별2_왼쪽</span>
				<span class="starR2 on" id="star2_Right" data-value="2.0">별2_오른쪽</span>
				<span class="starR1 on" id="star3_Left" data-value="2.5">별3_왼쪽</span>
				<span class="starR2 on" id="star3_Right" data-value="3.0">별3_오른쪽</span>
				<span class="starR1 on" id="star4_Left" data-value="3.5">별4_왼쪽</span>
				<span class="starR2 on" id="star4_Right" data-value="4.0">별4_오른쪽</span>
				<span class="starR1 on" id="star5_Left" data-value="4.5">별5_왼쪽</span>
				<span class="starR2 on" id="star5_Right" data-value="5.0">별5_오른쪽</span>
			</div>
			<script>
				$(document).ready(function() {

					var bkid = "${view.bkid}";
			      	alert(bkid);
			          var url = "${pageContext.request.contextPath}/getStar";
			          url = url + "?n=" + bkid;
			      	
					$.ajax({
						url : url,
						type : 'GET',
						datatype : 'text',
						success : function(star) {
							alert(star);
						}
					});
				});

				$('.starRev>span').click(function() {
					$(this).parent().children('span.on').removeClass('on');
					$(this).addClass('on').prevAll('span').addClass('on');
					var bb = $(this).attr('data-value');
					$("#point").val(bb); // 히든 인풋에 값 저장.
					alert(bb);
					return false;
				});
			</script>
			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>

			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>

		</div>

		<div class="modalBackground"></div>

	</div>
	<script>
		$(".modal_cancel").click(function() {
			$(".replyModal").attr("style", "display:none;");
		});

		$(".modal_modify_btn").click(function() {
			var modifyConfirm = confirm("정말로 수정하시겠습니까?");

			if (modifyConfirm) {
				var data = {
					rid : $(this).attr("data-repNum"),
					content : $(".modal_repCon").val(),
					bkid : $("#bkid").val(),
					star : $("#point").val()
				}; // ReplyVO 형태로 데이터 생성

				$.ajax({
					url : "./view/modifyReply",
					type : "post",
					data : data,
					success : function(result) {

						if (result == 1) {
							
							replyList();
							
							$(".replyModal").fadeOut(200);
						} else {
							alert("작성자 본인만 할 수 있습니다.");
						}
					},
					error : function() {
						alert("로그인하셔야합니다.")
					}
				});
			}

		});
	</script>

</body>

</html>

