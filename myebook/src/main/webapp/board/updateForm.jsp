<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>board</title>
<style>
	body{
	padding-top:0px;
	padding-bottom:30px;
	}
	article{
	padding-top:60px;
	}
</style>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

	$(document).on('click', '#btnSave', function(e) {
		var cate_cd = "${cate_cd}";
		e.preventDefault();
		$("#form").submit();
		goback(cate_cd);
		
    });
	
    $(document).on('click', '#btnList', function(e) {
		var cate_cd = "${cate_cd}";
      	  var url = "${pageContext.request.contextPath}/getBoardList.do";
          url = url + "?cate_cd=" + cate_cd;
      		location.href = encodeURI(url);
	});
	
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		
		if ( mode == 'edit' && "${member.nickname}"=="${boardContent.nickname}"){
			//입력 폼 셋팅
			$("#nickname").prop('readonly', true);
			$("input:hidden[name='bid']").val(<c:out value="${boardContent.bid}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#nickname").val('<c:out value="${boardContent.nickname}"/>');
			$("#title").val('<c:out value="${boardContent.title}"/>');
			$("#content").val('<c:out value="${boardContent.content}"/>');
			$("#tag").val('<c:out value="${boardContent.tag}"/>');
		}
		else{
			alert("글 작성자가 아닙니다. 수정할 수 없습니다.");
			var cate_cd = "${cate_cd}";
	      	  var url = "${pageContext.request.contextPath}/getBoardList.do";
	          url = url + "?cate_cd=" + cate_cd;
	      		location.href = encodeURI(url);
		}
	});
	
		function goback(cate_cd){	
				alert("??????????????");
		          var url = "${pageContext.request.contextPath}/getBoardList.do";
		          url = url + "?cate_cd=" + cate_cd;
		      		location.href = encodeURI(url);
			}

</script>


</head>

<body>

	<article>

		<div class="container" role="main">

			<h3>게시글 수정</h3>
			<form:form name="form" id="form" role="form" modelAttribute="board"
				method="post"
				action="${pageContext.request.contextPath}/updateBoard.do">
				<form:hidden path="bid" />
				<input type="hidden" name="mode"/>
				<div class="mb-3">

					<label for="title">제목</label>
					<form:input path="title" id="title" class="form-control"
						placeholder="제목을 입력해 주세요" />
					<input type='hidden' name="id" id = "id" value="${member.id}">
					<input type='hidden' name="user_id" id = "user_id" value="${member.user_id}">
					<input type='hidden' name="cate_cd" id = "cate_cd" value="${cate_cd}">
				
				</div>

				<div class="mb-3">
					<label for="nickname">작성자</label>
					<form:input path="nickname" id="nickname" class="form-control"
					placeholder="이름을 입력해 주세요" />
				</div>

				<div class="mb-3" >
					<label for="content">내용</label>
					<form:textarea path="content" id="content" class="form-control"
						rows="5" placeholder="내용을 입력해 주세요"/>
				</div>

				<div class="mb-3">
					<label for="tag">TAG</label>
					<form:input path="tag" id="tag" class="form-control"
						placeholder="태그를 입력해 주세요" />
				</div>
			</form:form>

			<div>

				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>
		</div>
	</article>
</body>
</html>