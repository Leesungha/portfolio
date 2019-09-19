<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#find_id_btn").click(function(){
			location.href = 'find_id_form.do';
		});
		$("#find_pw_btn").click(function(){
			location.href = 'find_pw_form.do';
		})
	})
</script>
<title>Login Form</title>

<style>
#body {
	padding-top: 100px;
	padding-bottom: 30px;
}
</style>
</head>
<%
    String clientId = "kCfrAO9vQ1kpjlRyIGQw";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/myebook/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>Log In</h3>
			</div>
			<div>
				<form action="login.do" method="post">
					<p>
						<label>ID</label> <span class="w3-right w3-button w3-hover-white"
							title="아이디 찾기" id="find_id_btn"> <i
							class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
						</span> <input class="w3-input" id="user_id" name="user_id" type="text"
							required>
					</p>
					<p>
						<label>Password</label> <span
							class="w3-right w3-button w3-hover-white" title="비밀번호 찾기"
							id="find_pw_btn"> <i
							class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
						</span> <input class="w3-input" id="pw" name="pw" type="password"
							required>
					</p>
					<p class="w3-center">
						<button type="submit"
							class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-round">Log
							in</button>
						<button type="button"
							class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-margin-bottom w3-round"
							onclick="history.go(-1)">Cancel</button>
					</p>


					<!-- 네이버 로그인 창으로 이동 -->
					<div id="naver_id_login" style="text-align: right">
						<a href="<%=apiURL%>"><img width="223"
							src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>

					</div>
					<br>
				</form>
			</div>
		</div>
	</div>
</body>
</html>