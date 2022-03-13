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
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${root}/resources/css/style.min.css">
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
            <a href="${root}/main" class="logo-wrapper" title="Home">
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
                    <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                        <span class="icon document" aria-hidden="true"></span>근태
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="${root}/attend/attendmain">근태관리 메인페이지</a>
                        </li>
                        <li>
                            <a href="${root}/attend/attendview">근태현황조회</a>
                        </li>
                        <li>
                            <a href="${root}/attend/attendmodview">근태수정요청 확인</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                        <span class="icon folder" aria-hidden="true"></span>전자결재
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                      <li>
                          <a href="${root}/ea/signup">기안 신청</a>
                      </li>
                      <li>
                          <a href="${root}/ea/signuplist">기안문서 조회</a>
                      </li>
                      <li>
                          <a href="${root}/ea/apprlist">결재문서 조회</a>
                      </li>
                      <li>
                          <a href="${root}/ea/reflist">참조문서 조회</a>
                      </li>
                      <li>
                          <a href="${root}/ea/entirelist">전체문서 조회</a>
                      </li>
                    </ul>
                </li>
                <li>
                    <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                        <span class="icon paper" aria-hidden="true"></span>인사
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="${root}/ps/viewuser">임직원 상세보기</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                        <span class="icon image" aria-hidden="true"></span>급여
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="${root}/sal/salmain">급여관리 메인페이지</a>
                        </li>
                        <li>
                            <a href="${root}/sal/salview">급여조회</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
            <ul class="sidebar-body-menu">
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon document" aria-hidden="true"></span>일정
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <%-- <a href="${root}/sch/schRegi">일정 등록</a> --%>
                          <a href="${root}/sch/mySch2">일정 등록</a>
                      </li>
                      <li>
                          <a href="${root}/sch/mySch">내 캘린더</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon folder" aria-hidden="true"></span>프로젝트
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="${root}/prj/prjMain">내 프로젝트</a>
                      </li>
                      <li>
                          <a href="${root}/prj/prjDept">부서별 프로젝트</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon image" aria-hidden="true"></span>예약
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="${root}/resv/resvMain">내 예약</a>
                      </li>
                      <li>
                          <a href="${root}/resv/resvAsset">자산별 예약현황</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon paper" aria-hidden="true"></span>연차
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu" style="font-size: 20px; important!">
                      <li>
                          <a href="${root}/leave/leaveMain">연차 메인</a>
                      </li>
                      <li>
                          <a href="${root}/leave/AllLvUsedList">연차 및 휴무 사용대장</a>
                      </li>
                      <li>
                          <a href="${root}/leave/lvInfo">휴무 정보</a>
                      </li>
                      <li>
                          <a href="${root}/leave/alvCal">연차 정산</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                  <span class="icon paper" aria-hidden="true"></span>게시판
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu" style="font-size: 20px; important!">
                      <li>
                          <a href="${root}/board/notice">공지사항</a>
                      </li>
                      <li>
                          <a href="${root}/boarddeptBoard">부서 게시판</a>
                      </li>
                      <li>
                          <a href="${root}/board/freeBoard">자유 게시판</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon paper" aria-hidden="true"></span>관리자
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="${root}/admin/ps/main">인사</a>
                      </li>
                      <li>
                          <a href="${root}/attend/attendmanage">근태</a>
                      </li>
                      <li>
                          <a href="${root}/admin/leave/main/1">연차</a>
                      </li>
                      <li>
                          <a href="${root}/admin/ea/main">전자결재</a>
                      </li>
                      <li>
                          <a href="${root}/admin/resv/main">예약</a>
                      </li>
                      <li>
                          <a href="${root}/admin/board/main">게시판</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <a class="show-cat-btn" href="##" style="font-size: 17px; font-weight: bolder;">
                      <span class="icon user-3" aria-hidden="true"></span>마이페이지
                      <span class="category__btn transparent-btn" title="Open list">
                          <span class="sr-only">Open list</span>
                          <span class="icon arrow-down" aria-hidden="true"></span>
                      </span>
                  </a>
                  <ul class="cat-sub-menu">
                      <li>
                          <a href="${root}/my/addrbook">주소록</a>
                      </li>
                      <li>
                          <a href="${root}/my/modiuser">개인정보 수정</a>
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
      
      <a href="javascript:openwindow('/iag/chat/list', 330, 400);"  class="theme-switcher gray-circle-btn" type="button" title="Switch theme" style="position: relative;">
        <span class="sr-only">chat</span>
        <i class="fas fa-comment" aria-hidden="true"></i>
        <span class="badge badge-danger navbar-badge" style="top: 0; right: 0; font-size: 8px;">99</span>
      </a>
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
	<script src="${root}/resources/plugins/feather.min.js"></script>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

    <script>
        // 팝업띄우기
        function openwindow(opage, x, y) {
        farwindow = window.open('','Links','width='+x+', height='+y+', toolbar=0, scrollbars=0, resizable=no');
        if (farwindow != null) {
            if (farwindow.opener == null) {
            farwindow.opener = self;
            }
            farwindow.location.href = opage;
        }
        }
    </script>
</body>
</html>