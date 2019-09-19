<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/myebook/resources/common/css/slick-1.8.1/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/myebook/resources/common/css/slick-1.8.1/slick/slick-theme.css">
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="/myebook/resources/common/css/slick-1.8.1/slick/slick.js" type="text/javascript" charset="utf-8"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<style>
.navbar-brand{
	font-size: 1.0rem;
	}
.font-size14{
	font-size: 1.2rem;
    font-weight: 400;
    line-height: 1.5;
    }
.nav-link {
	display: block;
    padding: .5rem 1rem;
    padding-top: 0.5rem;
    padding-right: 2rem;
    padding-bottom: 0.5rem;
    padding-left: 2rem;
}
.carousel-caption {
    position: absolute;
    right: 15%;
    bottom: 50px;
    left: 15%;
    z-index: 10;
    padding-top: 20px;
    padding-bottom: 90px;
    color: #fff;
    text-align: center;
}
</style>
<style>
#featured-content{
float:right;  
left: -8%;
}

h2{
text-align:center}
body {
  background: #333;
 }
.slick-slider { width: 80%; display: inline-flex; }
.slick-slide {position : center; }
.slick-slide:hover { }
.slick-slide img { margin-top: 100px; width:150px; height:200px; }
.slick-slide:hover img { opacity: 0.5; left: -12.5%; }
.slick-slide.slick-loading img { }
.slick-slide.dragging img { }
.slick-initialized .slick-slide { }
.slick-loading .slick-slide { }
.slick-vertical .slick-slide { }

/* Slick slider: Arrows */
/*.slick-prev, .slick-next { font: normal normal normal 22px/0 FontAwesome; 
top: 100; width: 2.0em; height: 1.5em; margin: 0; 
background-color: rgba(0,0,0,0.2); color: transparent; transition: all 0.3s ease; }
.slick-slider:hover .slick-prev, .slick-slider:hover .slick-next { }
.slick-prev:hover, .slick-prev:focus, .slick-next:hover, .slick-next:focus {
background-color: rgba(0,0,0,0.8) }
.slick-prev:hover:before, .slick-prev:focus:before, .slick-next:hover:before, 
.slick-next:focus:before { }
.slick-prev.slick-disabled:before, .slick-next.slick-disabled:before { }
.slick-prev:before, .slick-next:before { 
font-family: inherit; font-size: inherit; display: inline-block; 
opacity: 1; color: rgba(255,255,255,0.8); }
.slick-prev { left: 0 }
.slick-prev:before { content: '\f053' }
.slick-next { right: 0 }
.slick-next:before { content: '\f054' }*/
/* Slick slider: Dots */
.slick-slider { }
.slick-dots { }
.slick-dots li { }
.slick-dots li button { }
.slick-dots li button:hover, .slick-dots li button:focus { }
.slick-dots li button:hover:before, .slick-dots li button:focus:before { }
.slick-dots li button:before { }
.slick-dots li.slick-active button:before { }
/* Slick slider: Content */
.slick-slide { }
.slick-slide a { position: relative; display: block; text-decoration: none; }
.slick-slide h2 { font-size: 16px; color: white; font-weight: bold; background-color: #333;
margin: 0 auto; position: relative; 
overflow: hidden; color: white; padding: 0.5em; width: 80%; margin-top: -7%; }
.slick-slide .thumbnail:after { content: ''; position: absolute; width: 1px; 
height: 100%; right: 0; top: 0; background-color: rgba(128,128,128,0.66); }
.slick-slide .thumbnail:last-child { }
</style>

<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="http://localhost:8080/myebook/">Myebook.com</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample03" aria-controls="navbarsExample03"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${member == null}">
						<li class="nav-item">
						<a class="nav-link"
							href="./memberJoinForm.do">회원가입</a></li>
						<li class="nav-item">
						<a class="nav-link"
							href="./login_form.do">로그인</a></li>
						<li class="nav-item">
						<a class="nav-link"
							href="#">캐시충전</a></li>
					</c:when>

					<c:when test="${member.admin_status == true}">
						<li class="nav-item dropdown show"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown03"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">작가페이지(${member.user_id})</a>
							<div class="dropdown-menu" aria-labelledby="dropdown03">
								<a class="dropdown-item" href="./getUserList.do">회원 관리</a> 
								<a class="dropdown-item" href="./getBook.do">상품 관리</a> 
								<a 	class="dropdown-item" href="./logout.do">로그아웃</a>
							</div></li>
					</c:when>

					<c:when test="${member.admin_status != true}">
						<li class="nav-item dropdown show"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown03"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지(${member.user_id})</a>
							<div class="dropdown-menu" aria-labelledby="dropdown03">
								<a class="dropdown-item" href="./mypage.do">마이페이지</a> 
								<a class="dropdown-item" href="./cartList.do">카트리스트</a>
								<a class="dropdown-item" href="./myorder.do">주문리스트</a> 						 						
								<a class="dropdown-item" href="./bookshelf.do">내 서재</a> 
								<a class="dropdown-item" href="./logout.do">로그아웃</a>
							</div><li class="nav-item"><a class="nav-link" href="#">캐시충전</a>
     					 </li>
    			
				 </c:when>       
         </c:choose>  
       </ul>          
  </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample08" aria-controls="navbarsExample08"
			aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-md-center"
			id="navbarsExample08">
    <ul class="navbar-nav">
      <li class="nav-item font-size14">
        <a class="nav-link" href="./move_myebook.do">마이북</a>
      </li>
     	 <li class="nav-item font-size14">
     	  <a class="nav-link" href="#">이벤트</a>
      </li>
    	  <li class="nav-item font-size14">
      	  <a class="nav-link" href="#">연재관</a>
      </li>
       <li class="nav-item font-size14">
      	  <a class="nav-link" href="#">베스트</a>
      </li>
      		<li class="nav-item dropdown show">
        <a class="nav-link dropdown-toggle font-size14" href="#" id="dropdown03"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
        <div class="dropdown-menu" aria-labelledby="dropdown03">
          <a class="dropdown-item" id = "cate_cd" data-value ="자유">자유게시판</a>
          <a class="dropdown-item" id = "cate_cd" data-value ="공지">공지게시판</a>
          <a class="dropdown-item" id = "cate_cd" data-value = "구매">구매 문의</a>
        </div>
        <script>
        $(document).on('click', '.dropdown-item', function(){   
        	var cate_cd = $(this).attr('data-value')
        	var url = "${pageContext.request.contextPath}/getBoardList.do";
            url = url + "?cate_cd=" + cate_cd;
        		location.href = url;
        });
        </script>    
            
      </li>
    </ul>
  </div>
</nav>

 <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class=""></li>
      <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="2" class=""></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item" >
       <img class="bd-placeholder-img" src = "images/myebook.jpg" 
       width="100%" height="60%" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
        <rect fill="#777" width="100%" height="60%" ></rect></svg>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>Example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item active">
        <img class="bd-placeholder-img" src = "images/myebook.jpg"  
        width="100%" height="60%" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
        <rect fill="#777" width="100%" height="60%"></rect></svg>
        <div class="container">
          <div class="carousel-caption">
            <h1></h1>
            <p></p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img" src = "images/myebook.jpg"  
        width="100%" height="60%" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
        <rect fill="#777" width="100%" height="60%"></rect></svg>
        <div class="container">
          <div class="carousel-caption text-right">
            <h1></h1>
            <p></p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
 <div class="slider" id="featured-content" >
         <div>
            <a href="#">             
               <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#1]The greatest breakthroughs in gaming history of the past 25 years</h2>
            </a>
         </div>
         <div>
            <a href="#">
              <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>Best game reboots</h2>
            </a>
         </div>
         <div>
            <a href="#">
               <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#3]The greatest breakthroughs</h2>
            </a>
         </div>
         <div>
            <a href="#">
              <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#4]The greatest breakthroughs</h2>
            </a>
         </div>
         <div>
            <a href="#">               
               <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#5]The greatest breakthroughs in gaming</h2>
            </a>
         </div>
         <div>
            <a href="#">
               <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#6]The greatest breakthroughs in gaming history of</h2>
            </a>
         </div>
         <div>
            <a href="#">              
               <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#7]The greatest breakthroughs in gaming history of the past</h2>
            </a>
         </div>
         <div>
            <a href="#">              
               <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#8]The greatest breakthroughs in gaming history of the past 25 years</h2>
            </a>
         </div>
         <div>
            <a href="#">               
               <img src="http://dummyimage.com/464x16:9/3498db/fff.gif" alt="">
               <h2>[#9]The greatest breakthroughs in gaming history of the past 25 years</h2>
            </a>
         </div>
      </div>

    <script type="text/javascript">
    /*Slider function [It is recommended to place a function in a separate JS file, such as "functions.js"]*/
    function myCoolSlider() {
            $('#featured-content').slick({
                dots: false,
                infinite: true,
                speed: 300,
                slidesToShow: 4,
                slidesToScroll: 4,
                responsive: [{
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 4,
                        infinite: true,
                        dots: true
                    }
                }, {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                }, {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                }, {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                }]
            });
        }
        /*End of Slider function*/

    $(document).ready(function() {
    /*Calling the function 
    [It is recommended to call a function in a separate JS file, such as "scripts.js"]*/
        myCoolSlider();
    /*.................End of call*/
    });
        
</script>


</body>
</html>
