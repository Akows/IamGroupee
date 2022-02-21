<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html> 

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>I am Groupe Login</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${root}/resources/css/style.css">
</head>

<body>
  <div class="layer"></div>
<main class="page-center">
  <article class="sign-up">
    <h1 class="sign-up__title" style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; font-size: 45px;">I am groupe</h1>
    <p class="sign-up__subtitle">Login to your account to continue</p>
    <c:choose>
	    <c:when test="${empty cookie.rememIdCookie}">
		    <form class="sign-up-form form" action="${root}/login" method="post">
		      <label class="form-label-wrapper">
		        <p class="form-label" style="font-size: 17px;">Employee Number</p>
		        <input class="form-input" type="text" placeholder="Enter your employee number" required name="userNo">
		      </label>
		      <label class="form-label-wrapper">
		        <p class="form-label" style="font-size: 17px;">Password</p>
		        <input class="form-input" type="password" placeholder="Enter your password" required name="pwd">
		      </label>
		      
		      <input type="checkbox" name="checked" value="num" id="no"><i style="color: rgb(94, 94, 94); font-size: 14px; font-weight: 500;"> Save Number &nbsp; </i>
		      <input type="checkbox" name="checked" value="login" id="logined"><i style="color: rgb(94, 94, 94); font-size: 14px; font-weight: 500;"> Stay Signed in &nbsp; </i><br>
		      <a class="link-info forget-link" href="##">Forgot your password?</a><br>
		      <p style="color: red;">${msg}</p>
		      <button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">Login</button>
		    </form>
	    </c:when>
	    <c:otherwise>
	    	<form class="sign-up-form form" action="${root}/login" method="post">
		      <label class="form-label-wrapper">
		        <p class="form-label" style="font-size: 17px;">Employee Number</p>
		        <input class="form-input" type="text" placeholder="Enter your employee number" required name="userNo" value="${cookie.rememIdCookie.value}">
		      </label>
		      <label class="form-label-wrapper">
		        <p class="form-label" style="font-size: 17px;">Password</p>
		        <input class="form-input" type="password" placeholder="Enter your password" required name="pwd">
		      </label>
		      
		      <input type="checkbox" checked name="checked" value="num" id="no"><i style="color: rgb(94, 94, 94); font-size: 14px; font-weight: 500;"> Save Number &nbsp; </i>
		      <input type="checkbox" name="checked" value="login" id="logined"><i style="color: rgb(94, 94, 94); font-size: 14px; font-weight: 500;"> Stay Signed in &nbsp; </i><br>
		      <a class="link-info forget-link" href="##">Forgot your password?</a><br>
		      <p style="color: red;">${msg}</p>
		      <button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">Login</button>
		    </form>
	    </c:otherwise>
    </c:choose>
    
    
  </article>
</main>
	<script type="text/javascript">
		function name() {
			var login =  document.getElementById("logined");
			var no =  document.getElementById("no");
			var loginChecked = login.getAttribute("checked");
			if(loginChecked) {
				no.checked = true;
			} else {
				no.checked = false;
			}
		}
	</script>

	<!-- Chart library -->
	<script src="${root}/resources/plugins/chart.min.js"></script>
	<!-- Icons library -->
	<script src="${root}/resources/plugins/feather.min.js"></script>
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>