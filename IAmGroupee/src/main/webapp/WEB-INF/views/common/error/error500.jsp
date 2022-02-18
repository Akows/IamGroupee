<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${root}/resources/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.min.css">
</head>
<body>
	    <section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="${root}/main">Home</a></li>
	              <li class="breadcrumb-item active">500 Error Page</li>
	            </ol>
	          </div>
	        </div>
	      </div>
	    </section>
	    <section class="content">
	      <div class="error-page">
	        <h2 class="headline text-danger">500</h2>
	
	        <div class="error-content">
	          <h3><i class="fas fa-exclamation-triangle text-danger"></i> Oops! Something went wrong.</h3>
	
	          <p>
	            We will work on fixing that right away.
	            Meanwhile, you may <a href="../../index.html">return to dashboard</a> or try using the search form.
	          </p>
	
	          <form class="search-form">
	            <div class="input-group">
	              <input type="text" name="search" class="form-control" placeholder="Search">
	
	              <div class="input-group-append">
	                <button type="submit" name="submit" class="btn btn-danger"><i class="fas fa-search"></i>
	                </button>
	              </div>
	            </div>
	          </form>
	        </div>
	      </div>
	    </section>

<script src="${root}/resources/plugins/jquery/jquery.min.js"></script>
<script src="${root}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${root}/resources/dist/js/adminlte.min.js"></script>
<script src="${root}/resources/dist/js/demo.js"></script>
</body>
</html>