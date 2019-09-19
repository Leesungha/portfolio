<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>board</title>

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
	
	
	
	function goback_Board(cate_cd){	
		alert("??????????????");
          var url = "${pageContext.request.contextPath}/getBoardList.do";
          url = url + "?cate_cd=" + cate_cd;
      		location.href = encodeURI(url);
      		
	}

	// $(document).on('click', '#btnList', function(e){
	//	var cate_cd = "${cate_cd}";
     // 	alert(cate_cd);
      //    var url = "${pageContext.request.contextPath}/getBoardList.do";
       //   url = url + "?cate_cd=" + cate_cd;
      //		location.href = url;
	//});

	
</script>
<style>
	body{
	padding-top:0px;
	padding-bottom:30px;
	}
	article{
	padding-top:60px;
	}
	</style>
</head>

<body>

	<article>

		<div class="container" role="main">

			<h3>게시글 작성</h3>

			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/insertBoard.do">

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
					<input type='hidden' name="id" id = "id" value="${member.id}">
					<input type='hidden' name="user_id" id = "user_id" value="${member.user_id}">
					<input type='hidden' name="cate_cd" id = "cate_cd" value="${cate_cd}">
					<input type='hidden' name="admin_status" id = "admin_status" value="${admin_status}">
				
				</div>

				

				<div class="mb-3">

					<label for="nickname" >작성자</label>

					<input type="text" class="form-control" name="nickname" id="nickname" placeholder="이름을 입력해 주세요"
					readonly value="${member.nickname}">

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">TAG</label>

					<input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">

				</div>
							

			</form>

			<div >

				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				
			</div>

		</div>

	</article>

</body>

</html>

