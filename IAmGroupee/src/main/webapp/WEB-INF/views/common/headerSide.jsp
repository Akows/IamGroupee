<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>I am groupe Dashboard</title>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="resources/css/style.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
  <div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
<div class="page-flex">
  <!-- ! Sidebar -->
  <aside class="sidebar">
    <div class="sidebar-start">
        <div class="sidebar-head">
            <a href="http://127.0.0.1:8989/iag/main" class="logo-wrapper" title="Home">
                <span class="sr-only">Home</span>
                <span class="icon logo" aria-hidden="true"></span>
                <div class="logo-text">
                    <span class="logo-title"></span>
                </div>

            </a>
            <button class="sidebar-toggle transparent-btn" title="Menu" type="button">
                <span class="sr-only">Toggle menu</span>
                <span class="icon menu-toggle" aria-hidden="true"></span>
            </button>
        </div>
        <div class="sidebar-body">
            <ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="http://127.0.0.1:8989/iag/main" style="font-size: 17px; font-weight: bolder;"><span class="icon home" aria-hidden="true"></span>I am groupe</a>
                </li>
                <li>
                    <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                        <span class="icon document" aria-hidden="true"></span>Attendance
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="posts.html">All Posts</a>
                        </li>
                        <li>
                            <a href="new-post.html">Add new post</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="show-cat-btn" href="##" style="font-size: 15px; font-weight: bolder;">
                        <span class="icon folder" aria-hidden="true"></span>Electronic Approval
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="categories.html">All categories</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                        <span class="icon paper" aria-hidden="true"></span>Personnel
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="media-01.html">Media-01</a>
                        </li>
                        <li>
                            <a href="media-02.html">Media-02</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                        <span class="icon image" aria-hidden="true"></span>Salary
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="pages.html">All pages</a>
                        </li>
                        <li>
                            <a href="new-page.html">Add new page</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
            <ul class="sidebar-body-menu">
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon document" aria-hidden="true"></span>Schedule
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="extention-01.html">Extentions-01</a>
                      </li>
                      <li>
                          <a href="extention-02.html">Extentions-02</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon folder" aria-hidden="true"></span>Projects
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="extention-01.html">Extentions-01</a>
                      </li>
                      <li>
                          <a href="extention-02.html">Extentions-02</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon image" aria-hidden="true"></span>Reservations
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="extention-01.html">Extentions-01</a>
                      </li>
                      <li>
                          <a href="extention-02.html">Extentions-02</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon paper" aria-hidden="true"></span>Leave
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu" style="font-size: 20px; important!">
                      <li>
                          <a href="${root}/leave/leaveMain">연차</a>
                      </li>
                      <li>
                          <a href="extention-02.html">연차 사용대장</a>
                      </li>
                      <li>
                          <a href="extention-02.html">휴가 사용대장</a>
                      </li>
                      <li>
                          <a href="extention-02.html">휴무 정보 게시판</a>
                      </li>
                      <li>
                          <a href="extention-02.html">연차 정산</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon paper" aria-hidden="true"></span>Management
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="${root}/admin/leave/main">인사</a>
                      </li>
                      <li>
                          <a href="${root}/admin/leave/main">근태</a>
                      </li>
                      <li>
                          <a href="${root}/admin/leave/main">급여</a>
                      </li>
                      <li>
                          <a href="${root}/admin/leave/main">연차</a>
                      </li>
                      <li>
                          <a href="${root}/admin/leave/main">전자결재</a>
                      </li>
                      <li>
                          <a href="${root}/admin/leave/main">예약</a>
                      </li>
                      <li>
                          <a href=${root}/admin/leave/main">게시판</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon user-3" aria-hidden="true"></span>MyPage
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="users-01.html">Users-01</a>
                      </li>
                      <li>
                          <a href="users-02.html">Users-02</a>
                      </li>
                  </ul>
              </li>
          </ul>
        </div>
    </div>
    <br>
    <div class="sidebar-footer">
        <a href="##" class="sidebar-user">
            <span class="sidebar-user-img">
                <picture><source srcset="${root}/resources/img/avatar/avatar-illustrated-01.webp" type="image/webp"><img src="${root}/resources/img/avatar/avatar-illustrated-01.png" alt="User name"></picture>
            </span>
            <div class="sidebar-user-info">
                <span class="sidebar-user__title">${loginUser.name}</span>
            </div>
        </a>
    </div>
</aside>
  <div class="main-wrapper">
    <!-- ! Main nav -->
    <nav class="main-nav--bg">
  <div class="container main-nav">
    <div class="main-nav-start">
      
    </div>
    <div class="main-nav-end">
      <button class="sidebar-toggle transparent-btn" title="Menu" type="button">
        <span class="sr-only">Toggle menu</span>
        <span class="icon menu-toggle--gray" aria-hidden="true"></span>
      </button>
      
      <button class="theme-switcher gray-circle-btn" type="button" title="Switch theme">
        <span class="sr-only">Switch theme</span>
        <i class="sun-icon" data-feather="sun" aria-hidden="true"></i>
        <i class="moon-icon" data-feather="moon" aria-hidden="true"></i>
      </button>
      <div class="notification-wrapper">
        <button class="gray-circle-btn dropdown-btn" title="To messages" type="button">
          <span class="sr-only">To messages</span>
          <span class="icon notification active" aria-hidden="true"></span>
        </button>
        <ul class="users-item-dropdown notification-dropdown dropdown">
          <li>
            <a href="##">
              <div class="notification-dropdown-icon info">
                <i data-feather="check"></i>
              </div>
              <div class="notification-dropdown-text">
                <span class="notification-dropdown__title">System just updated</span>
                <span class="notification-dropdown__subtitle">The system has been successfully upgraded. Read more
                  here.</span>
              </div>
            </a>
          </li>
          <li>
            <a href="##">
              <div class="notification-dropdown-icon danger">
                <i data-feather="info" aria-hidden="true"></i>
              </div>
              <div class="notification-dropdown-text">
                <span class="notification-dropdown__title">The cache is full!</span>
                <span class="notification-dropdown__subtitle">Unnecessary caches take up a lot of memory space and
                  interfere ...</span>
              </div>
            </a>
          </li>
          <li>
            <a href="##">
              <div class="notification-dropdown-icon info">
                <i data-feather="check" aria-hidden="true"></i>
              </div>
              <div class="notification-dropdown-text">
                <span class="notification-dropdown__title">New Subscriber here!</span>
                <span class="notification-dropdown__subtitle">A new subscriber has subscribed.</span>
              </div>
            </a>
          </li>
          <li>
            <a class="link-to-page" href="##">Go to Notifications page</a>
          </li>
        </ul>
      </div>
      <div class="nav-user-wrapper">
        <button href="##" class="nav-user-btn dropdown-btn" title="My profile" type="button">
          <span class="sr-only">My profile</span>
          <span class="nav-user-img">
            <picture><source srcset="${root}/resources/img/avatar/avatar-illustrated-02.webp" type="image/webp"><img src="${root}/resources/img/avatar/avatar-illustrated-02.png" alt="User name"></picture>
          </span>
        </button>
        <ul class="users-item-dropdown nav-user-dropdown dropdown">
          <li><a href="##">
              <i data-feather="user" aria-hidden="true"></i>
              <span>Profile</span>
            </a></li>
          <li><a href="##">
              <i data-feather="settings" aria-hidden="true"></i>
              <span>Account settings</span>
            </a></li>
          <li><a class="danger" href="${root}/logout">
              <i data-feather="log-out" aria-hidden="true"></i>
              <span>Log out</span>
            </a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>
	

	<!-- Icons library -->
	<script src="resources/plugins/feather.min.js"></script>
	
	<!-- Custom scripts -->
	<script src="resources/js/script.js"></script>
</body>
</html>