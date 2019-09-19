<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<html>
<head>
<title>kubg Admin</title>
<script src="/myebook/resources/ckeditor/ckeditor.js"></script>

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

.select_img img{
width: 300px;
margin: 20px 0;
}
</style>

</head>
<script>
var regExp = /[^0-9]/gi;

$("#price").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
 var tempVal = selector.val();
 selector.val(tempVal.replace(regExp, ""));
}
</script>
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

				<h2>상품 수정</h2>

				<form role="form" id="form" method="post" autocomplete="off" enctype="multipart/form-data"
					modelAttribute="mdbook" action="./updatebook.do">
				
					<div class="inputArea">
						<label>대분류</label> 
						<select class="category1" name="level"
							>
							<option value="">전체</option>
						</select> 
						
						<label>소분류</label> <select class="category2" name="cate_name"
							>
							<option value="">전체</option>
						</select>
						</div>
						
						<div class="inputArea">
						<label>유형</label> <select class="category3" name="sellingtype"
							id="sellingtype" value = "${mdbook.sellingtype}">
							<option value="이북">이북</option>
							<option value="종이책">종이책</option>
						</select>
					</div>
					
					<div class="inputArea">
						<label for="bookname">책 이름</label> <input type="text" id="bookname"
							name="bookname" value = "${mdbook.bookname}" /> 
							<input type='hidden' name="id" id="id" value="${member.id}">
							<input type="hidden" name="bkid" id = "bkid" value="${mdbook.bkid}" />
			
					</div>

					<div class="inputArea">
						<label for="price">책 가격</label> <input type="text" id="price"
							name="price" value = "${mdbook.price}" />
					</div>
					
					<div class="inputArea">
						<label for="gdsStock">책 수량</label> <input type="text" id="gdsStock"
							name="gdsStock" value = "${mdbook.gdsStock}" />
					</div>

					<div class="inputArea">
						<label for="gdsDes">책 소개</label>
						<textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${mdbook.gdsDes}</textarea>
					    <script>
					var ckeditor_config = {
							resize_enaleb : false,
							enterMode : CKEDITOR.ENTER_BR,
							shiftEnterMode : CKEDITOR.ENTER_P,
							filebrowserUploadUrl : "book/ckUpload"
					};					
					CKEDITOR.replace("gdsDes", ckeditor_config);
				</script>
					</div>
					
					<div class="inputArea">
					 <label for="gdsImg">이미지</label>
					 <input type="file" id="gdsImg" name="file" />
					 <div class="select_img">
					 <img src="${mdbook.gdsImg}" />
					 <input type = "hidden" name = "gdsImg" value = "${mdbook.gdsImg}"/>
					 <input type = "hidden" name = "thumbImg" value = "${mdbook.thumbImg}"/>
					 </div>
					 
					 <script>
					  $("#gdsImg").change(function(){
					   if(this.files && this.files[0]) {
					    var reader = new FileReader;
					    reader.onload = function(data) {
					     $(".select_img img").attr("src", data.target.result).width(300);        
					    }
					    reader.readAsDataURL(this.files[0]);
					   }
					  });
					 </script>
					 <%=request.getRealPath("/")%>
				</div>

					<div class="inputArea">
				 <button type="button" id="update_Btn" class="btn btn-primary">완료</button>
 				<button type="button"  id="back_Btn" class="btn btn-warning">취소</button> 
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
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for (var i = 0; i < jsonData.length; i++) {
		if(i==0){
		cate1Obj = new Object(); //초기화
		cate1Obj.level = jsonData[i].level;
		cate1Obj.cate_name = jsonData[i].cate_name;
		cate1Obj.cate_cd = jsonData[i].cate_cd;
		cate1Arr.push(cate1Obj);
		
		}else if (jsonData[i].level != jsonData[i-1].level){
		 
			cate1Obj = new Object(); //초기화
			cate1Obj.level = jsonData[i].level;
			cate1Obj.cate_name = jsonData[i].cate_name;
			cate1Obj.cate_cd = jsonData[i].cate_cd;
			cate1Arr.push(cate1Obj);
		}}
	
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")

	for (var i = 0; i < cate1Arr.length; i++) {
		cate1Select.append("<option value='" + cate1Arr[i].level + "'>"
				+ cate1Arr[i].cate_cd + "</option>");
	}

	$(document)
			.on(	"change",
					"select.category1",
					function() {

						var cate2Arr = new Array();
						var cate2Obj = new Object();

						// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
						for (var i = 0; i < jsonData.length; i++) {

							if (jsonData[i].level == "1") {
								cate2Obj = new Object(); //초기화
								cate2Obj.cate_name = jsonData[i].cate_name;
								cate2Obj.cate_cdRef = jsonData[i].cate_cdRef;
								cate2Arr.push(cate2Obj);
							}
						}

						var cate2Select = $("select.category2");

						for (var i = 0; i < cate2Arr.length; i++) {
							cate2Select
									.append("<option value='" + cate2Arr[i].cate_name + "'>"
											+ cate2Arr[i].cate_cdRef
											+ "</option>");
						}
					});
	
	$(document).on("change", "select.category1", function(){

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].level == "1"  && jsonData[i].cate_cdRef!="") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.level = jsonData[i].level;	
		   cate2Obj.cate_name = jsonData[i].cate_name;		
		   cate2Obj.cate_cdRef = jsonData[i].cate_cdRef;
		   cate2Arr.push(cate2Obj);
		  }
		  
		  if(jsonData[i].level == "2"  && jsonData[i].cate_cdRef!="") {
			   cate2Obj = new Object();  //초기화
			   cate2Obj.level = jsonData[i].level;	
			   cate2Obj.cate_name = jsonData[i].cate_name;
			   cate2Obj.cate_cdRef = jsonData[i].cate_cdRef;
			   cate2Arr.push(cate2Obj);
			  }
		  
		  if(jsonData[i].level == "3"  && jsonData[i].cate_cdRef!="") {
			   cate2Obj = new Object();  //초기화
			   cate2Obj.level = jsonData[i].level;	
			   cate2Obj.cate_name = jsonData[i].cate_name;
			   cate2Obj.cate_cdRef = jsonData[i].cate_cdRef;	
			   cate2Arr.push(cate2Obj);
			  }
		 }
		 
		 var cate2Select = $("select.category2");
		 
		 /*
		 for(var i = 0; i < cate2Arr.length; i++) {
		   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		        + cate2Arr[i].cateName + "</option>");
		 }
		 */
		 
		 cate2Select.children().remove();

		 $("option:selected", this).each(function(){		  
		  var selectVal = $(this).val();  
		   cate2Select.append("<option value='"+selectVal+"''>전체</option>");
		 
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectVal == cate2Arr[i].level) {
		    cate2Select.append("<option value='" + cate2Arr[i].cate_name + "'>"
		         + cate2Arr[i].cate_cdRef + "</option>");
		   }
		  }		  
		 });		 
		});
	
	
	
	
	/*function back_Btn(bkid){
		var url = "${pageContext.request.contextPath}/bookview.do";
		url = url + "?bkid="+bkid;
		alert(url);
		location.href = url;
	}*/
	
	 $("#back_Btn").click(function(){
		  alert($('#bkid').val());
		  var bkid = $('#bkid').val();
		  
		  var url = "${pageContext.request.contextPath}/bookview.do";
			url = url + "?bkid="+bkid;
			alert(url);
			location.href = url;
		
	  });
		
	 /*var formObj = $("form[role='form']");	  
	  $("#update_Btn").click(function(){
		 
		  formObj.submit();
	   formObj.attr("action", "${pageContext.request.contextPath}/updatebook.do");
	  
	   
	   alert($('#bkid').val());
		  var bkid = $('#bkid').val();
		  
		  var url = "${pageContext.request.contextPath}./bookview.do";
			url = url + "?bkid="+bkid;
			alert(url);
			location.href = url;
	  });*/
	  
	  $(document).on('click', '#update_Btn', function(e) {
			
		  e.preventDefault();
			$("#form").submit();
			
			/*alert("#form");
			
			alert($('#bkid').val());
			  var bkid = $('#bkid').val();
			  
			  var url = "${pageContext.request.contextPath}/bookview.do";
				url = url + "?bkid="+bkid;
				alert(url);
				location.href = url;*/
			
	  });
	  
	  var select_cateCode = '${mdbook.level}';
	  var select_cateCodeRef = '${mdbook.cate_name}';
	  
	
	  if(select_cateCodeRef != null && select_cateCodeRef != '') {
	   $(".category1").val(select_cateCode);
	   $(".category2").val(select_cateCodeRef);
	   $(".category2").children().remove();
	   $(".category2").append("<option value='"
	         + select_cateCodeRef + "'>" + select_cateCodeRef + "</option>");
	  } else {
	   $(".category1").val(select_cateCode);
	   //$(".category2").val(select_cateCode);
	   // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
	   $(".category2").append("<option value='" + select_cateCodeRef + "' selected='selected'>전체</option>");
	  }
	
	  var select_sellingtype = '${mdbook.sellingtype}';
	  $(".category3").val(select_sellingtype);
		  
	  // formObj.attr("action", "/bookmodify.do");
	   //formObj.attr("method", "get")
	  // formObj.submit();

	</script>

</body>

</html>

