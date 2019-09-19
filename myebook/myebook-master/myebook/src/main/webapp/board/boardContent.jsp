<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<% request.setCharacterEncoding("UTF-8"); %>

<title>board</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		showReplyList();
	});

	$(document).on('click', '#btnList', function(){
		var cate_cd = "${cate_cd}";
      	alert(cate_cd);
          var url = "${pageContext.request.contextPath}/getBoardList.do";
          url = url + "?cate_cd=" + cate_cd;
      		location.href = encodeURI(url); 
	});
	
	//수정 버튼 클릭 이벤트

	$(document).on('click', '#btnUpdate', function(){
		
		if ("${member.nickname}"=="${boardContent.nickname}"){
		var cate_cd = "${cate_cd}";
		var url = "${pageContext.request.contextPath}/editForm.do";
		url = url + "?cate_cd="+cate_cd +"&bid="+${boardContent.bid};
		url = url + "&mode=edit";
		location.href = encodeURI(url);
		}
		else{
			alert("글 작성자가 아닙니다.");
		}
		
	});
	
	//삭제 버튼 클릭 이벤트

	$(document).on('click', '#btnDelete', function(){
	if ("${member.nickname}"=="${boardContent.nickname}"){
		var cate_cd = "${cate_cd}";
    var url = "${pageContext.request.contextPath}/deleteBoard.do";
    url = url + "?cate_cd="+cate_cd +"&bid=" + ${boardContent.bid};
		location.href = encodeURI(url);
		
	}else{
			alert("게시물을 삭제할 권한이 없습니다.");
		}});
		
	
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/getReqlyList.do";
		var paramData = {"bid" : "${boardContent.bid}"};
		
		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',
            success: function(result) {
               	var htmls = "";
            	//this.content = this.content.replace(/'/g, '\\\''); // 홀따옴표를 치환하자
    			if(result.length < 1){
				//htmls.push("등록된 댓글이 없습니다.");
			} else {
			            $(result).each(function(){
	                     htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>Placeholder</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.nickname + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     this.content = this.content.replace(/'/g, '\\\''); // 홀따옴표를 치환하자
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + this.nickname + '\', \'' + this.content + '\')" style="padding-right:5px">수정</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ', \'' + this.nickname + '\')" >삭제</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.content;
	                     htmls += '</p>';
	                     htmls += '</div>';
	                });	//each end
			}
			$("#replyList").html(htmls);  
			var htmls2 = "";
			htmls2 +='<input type="text" class="form-control" name="nickname" id="nickname" placeholder="이름을 입력해 주세요" readonly value="${member.nickname}">';
			htmls2 +='<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>';
			htmls2 += '</div>';
			$("#replynik").html(htmls2); 
			
            },error:function(request,status,error){
                alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
            }
		}); 
		}	// Ajax end
		
	// 이하 코드 생략
	
	//댓글 저장 버튼 클릭 이벤트

	$(document).on('click', '#btnReplySave', function(){
		alert("dddd");
		var replyId = $('#id').val();
		var replyContent = $('#content').val();
		var replyNickname = $('#nickname').val();
		var replyUserId = $('#user_id').val();
		var paramData = JSON.stringify({
			    	"content": replyContent
				       ,"id": replyId
				, "nickname": replyNickname
				, "user_id" : replyUserId
				, "bid":'${boardContent.bid}'
		});

		var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};

		$.ajax({
			url: "${pageContext.request.contextPath}/saveReqly.do"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				$('#content').val('');
				$('#nickname').val('');
			}
		, error: function(error){
				console.log("에러 : " + error);
			}
		}); 
	});
		
	function fn_editReply(rid, nickname, content){
		
		if("${member.nickname}"==nickname){
			
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rid' + rid + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';		
		htmls += '<strong class="text-gray-dark">' + nickname + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rid + ', \'' + nickname + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += content;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';
		$('#rid' + rid).replaceWith(htmls);
		$('#rid' + rid + ' #editContent').focus();
		}
		else{
			alert("작성자가 아니면 수정할 수 없습니다.");
		}
	}
	
	function fn_updateReply(rid, nickname){
		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({"content": replyEditContent
				, "rid": rid

		});
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};

		$.ajax({

			url: "${pageContext.request.contextPath}/editReqly.do"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                console.log(result);
				showReplyList();
			}

			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
	function fn_deleteReply(rid, nickname){

		if("${member.nickname}"==nickname){
		var paramData = {"rid": rid};

		$.ajax({
			url: "${pageContext.request.contextPath}/deleteReqly.do"
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				alert("삭제되었습니다.");
                console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
		}else{
			alert("작성자가 아니면 삭제할 수 없습니다.");
		}
	}

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
			<h3>게시글 상세조회</h3>
			<div class="bg-white rounded shadow-sm">
			<input type='hidden' name="cate_cd" id = "cate_cd" value="${cate_cd}">
			<div class="board_title"><c:out value="${boardContent.title}"/></div>
			<div class="board_info_box">
			<span class="board_author"><c:out value="${boardContent.nickname}"/>,</span><span class="board_date"><c:out value="${boardContent.reg_dt}"/></span>
		</div>
			<div class="board_content">${boardContent.content}</div>
			<div class="board_tag">TAG : <c:out value="${boardContent.tag}"/></div>
		</div>
			<div style="margin-top : 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
			
			<!-- Reply Form {s} -->

			 <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form:form name="form" id="form" role="form" modelAttribute="reply" method="post">
				<form:hidden path="bid" id="bid" />
				<div class="row">
					<div class="col-sm-10">
						<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
						<input type='hidden' name="id" id = "id" value="${member.id}">
						<input type='hidden' name="user_id" id = "user_id" value="${member.user_id}">
					</div>
					<div class="col-sm-2" div id = "replynik">
							<input type="text" class="form-control" name="nickname" id="nickname" placeholder="이름을 입력해 주세요"
					readonly value="${member.nickname}">
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
				</div>
				</form:form>
			</div> 

			<!-- Reply Form {e} -->

			<!-- Reply List {s}-->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
				<div id="replyList">
				
				</div>
			</div> 
			<!-- Reply List {e}-->
		</div>
	</article>
</body>
</html>
