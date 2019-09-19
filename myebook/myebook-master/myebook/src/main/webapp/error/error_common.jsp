<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div class="box">
    <div class="box-header with-border">
     <h3 class="box-title">${exception.getMessage()}</h3>
    </div>
    <div class="box-body">
     <button type="submit" class="btn btn-warning">이전페이지</button>
    </div>
    <div class="box-footer">
     <ul>
      <c:forEach items="${exception.getStackTrace()}" var="stack">
       <li>${stack.toString()}</li>
      </c:forEach>
     </ul>
    </div>
   </div>
	<script type="text/javascript">
	$(document).ready(function(){
	 $(".btn-warning").on("click", function(){
	  self.location = "${prevPage}";
	 });
	})
	</script>
</body>
</html>