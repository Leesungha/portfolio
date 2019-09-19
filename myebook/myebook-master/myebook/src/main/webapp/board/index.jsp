<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">

<style>
article {
	padding-top: 60px;
}
</style>
<c:url var="getBoardListURL" value="/getBoardList"></c:url>

<script>


$(document).on('click', '#btnSave', function(e){
	var cate_cd = "${cate_cd}";
	var admin_status = "${admin_status}";
	
	alert(cate_cd);
	alert(admin_status);
	
	if(cate_cd=="공지"){
		if(admin_status==true){
			
					e.preventDefault();
					$("#form").submit();	
					alert("못보내는거야?");
					alert(cate_cd);
					goback_Board(cate_cd);
					return 1;
	}else{
		alert("관리자만 작성할 수 있습니다.");
		return -1;}
	}
	else{	
		e.preventDefault();
		$("#form").submit();
		
		goback_Board(cate_cd);
		
		
	}
});


	function input_Text(cate_cd, admin_status){		
			
			if(cate_cd=="자유"){
				 var url = "${pageContext.request.contextPath}/boardForm.do";
				 url = url + "?cate_cd=" + cate_cd;
				 location.href = encodeURI(url);
			}else if(cate_cd == "구매"){
				 var url = "${pageContext.request.contextPath}/boardForm.do";
				 url = url + "?cate_cd=" + cate_cd;
			 	 location.href = encodeURI(url);}
			else{
				
				alert(cate_cd);
				alert(admin_status);
				
				if(admin_status=="true"){
						var url = "${pageContext.request.contextPath}/boardForm.do";
						 url = url + "?cate_cd=" + cate_cd;
					 	 location.href = encodeURI(url);
					 	 return 1;
				}else{
					alert("관리자만 작성할 수 있습니다.");
					return -1;
				}
					
			}
				
		}
		
	function fn_contentView(cate_cd, bid){
		var url = "${pageContext.request.contextPath}/getBoardContent.do";
		url = url + "?cate_cd="+cate_cd+ "&bid="+bid;
		location.href = encodeURI(url);
	}
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
			var cate_cd = "${cate_cd}";
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/getBoardList.do";
			url = url + "?cate_cd="+cate_cd;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			
			location.href = encodeURI(url);
	}

    //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword, cate_cd) {
			var cate_cd = "${cate_cd}";	
    		var url = "${pageContext.request.contextPath}/getBoardList.do";
			url = url + "?cate_cd=" + cate_cd;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			location.href = encodeURI(url);	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
			var cate_cd = "${cate_cd}";
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/getBoardList.do";
			url = url + "?cate_cd=" +cate_cd;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			location.href = encodeURI(url);

	}
	
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var cate_cd = "${cate_cd}";
		var url = "${pageContext.request.contextPath}/getBoardList.do";
		url = url + "?cate_cd=" + cate_cd;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = encodeURI(url);
		console.log(url);
	});	

</script>

</head>
<c:choose>
	<c:when test="${cate_cd eq '자유'}">
		<title>자유게시판</title>
	</c:when>
	<c:when test="${cate_cd eq '공지'}">
		<title>공지게시판</title>
	</c:when>
	<c:when test="${cate_cd eq '구매'}">
		<title>구매문의</title>
	</c:when>
</c:choose>
<body>

	<article>
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">

					<c:choose>
						<c:when test="${cate_cd eq '자유'}">
							<h3>자유게시판</h3>
						</c:when>
						<c:when test="${cate_cd eq '공지'}">
							<h3>공지게시판</h3>
						</c:when>
						<c:when test="${cate_cd eq '구매'}">
							<h3>구매문의</h3>
						</c:when>
					</c:choose>

					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>

					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>

					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty boardList }">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty boardList}">

								<c:forEach var="list" items="${boardList}" varStatus="number">
									<tr>
										<td><c:out
												value="${fn:length(requestScope.boardList)-number.index}" /></td>
										<td><a href="#"
											onClick="fn_contentView('${cate_cd}',<c:out value="${list.bid}"/>)">
												<c:out value="${list.title}" />
										</a></td>
										<td><c:out value="${list.nickname}" /></td>
										<td><c:out value="${list.view_cnt}" /></td>
										<td><c:out value="${list.reg_dt}" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>

			</div>
			<div>

				<input type="hidden" id="cate_cd" value="${cate_cd}" />

				<button type="button" class="btn btn-sm btn-primary"
					onclick='input_Text("${cate_cd}","${admin_status}")'
					id="btnWriteForm">글쓰기</button>
				<input type="hidden" id="cate_cd" value="${cate_cd}" /> <input
					type="hidden" id="admin_status" value="${admin_status}" />

			</div>


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
						<option value="title">제목</option>
						<option value="content">본문</option>
						<option value="nickname">작성자</option>
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

		</div>

	</article>
</body>

</html>

