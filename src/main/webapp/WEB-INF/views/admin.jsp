<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jspf"%>
<%@ include file="/WEB-INF/views/common/head-include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    
    <title>Papago Chatting</title>
    
    <!-- CSS -->
    <link href="/resources/admin-theme/assets/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/admin-theme/assets/node_modules/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet">
    <link href="/resources/admin-theme/assets/node_modules/morrisjs/morris.css" rel="stylesheet">
    <link href="/resources/admin-theme/assets/node_modules/c3-master/c3.min.css" rel="stylesheet">
    <link href="/resources/admin-theme/css/style.css" rel="stylesheet">
    <link href="/resources/admin-theme/css/pages/dashboard1.css" rel="stylesheet">
    <link href="/resources/admin-theme/css/colors/default.css" id="theme" rel="stylesheet">
</head>

<body class="fix-header fix-sidebar card-no-border">

<!--로그인 확인 -->
<c:if test="${empty user}">
	<script>
	alert('로그인이 필요합니다.')
	location.href='/';
	</script>
	
</c:if>

	<!-- ============================================================== -->
	<!-- Topbar header -->
	<!-- ============================================================== -->
	<div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Admin Wrap</p>
        </div>
    </div>
    <div id="main-wrapper">
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
            
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="/resources/admin-theme/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                            <!-- Light Logo icon -->
                            <img src="/resources/admin-theme/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         <!-- dark Logo text -->
                         <img src="/resources/admin-theme/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                         <!-- Light Logo text -->    
                         <img src="/resources/admin-theme/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->


				<!-- ============================================================== -->
				<!-- Profile -->
				<!-- ============================================================== -->
				<div class="navbar-collapse">
                    <ul class="navbar-nav my-lg-0">

                        <li>
                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" 
                               href="/views/admin?page=profile">
                            
                            <!--사용자가 이미지를 설정했을 경우 -->   
                            <c:if test="${user.uiImg != null}" >
                            <img src="https://phn-test.s3.ap-northeast-2.amazonaws.com/papago-chatting/${user.uiImg}" alt="user" width="20" height="30"/> 
                            </c:if>
                            
                            <!--사용자가 이미지를 설정하지 않았을 경우-->   
                            <c:if test="${user.uiImg == null}">
                            <img src="/resources/admin-theme/img/noImg.PNG" alt="user" width="20" height="30"/> 
                            </c:if>
                            
                            <span class="hidden-md-down">&nbsp;${user.uiName} &nbsp;님</span></a>
                        </li>
                        
                    </ul>
                </div>
				<!-- ============================================================== -->
				<!-- End Profile -->
				<!-- ============================================================== -->
				
			</nav>
       	</header>
    </div>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Sidebar navigation -->
	<!-- ============================================================== -->
	<aside class="left-sidebar">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                
                    <!--아이콘-->
                    <ul id="sidebarnav">
                        <li> <a class="waves-effect waves-dark" data-page="main"><i class="fa fa-tachometer"></i><span class="hide-menu">Dashboard</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" data-page="profile" aria-expanded="false"><i class="fa fa-user-circle-o"></i><span class="hide-menu">Profile</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" data-page="papago-translation" aria-expanded="false"><i class="fa fa-language"></i><span class="hide-menu">Translation</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" data-page="papago-chatting"  aria-expanded="false"><i class="fa fa-weixin"></i><span class="hide-menu">Chatting</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" data-page="translation-list" aria-expanded="false"><i class="fa fa-list-ul"></i><span class="hide-menu">Tables</span></a>
                        </li>
                    </ul>
                    
                    <!--로그아웃 버튼-->
                    <div class="text-center m-t-30">
                        <button class="btn waves-effect waves-light btn-info hidden-md-down" id="logout">Logout</button>
                    </div>
                    
                </nav>
            </div>
        </aside>
        <!-- ============================================================== -->
		<!-- End Sidebar navigation -->
		<!-- ============================================================== -->
		
		<!--페이지 이동-->
        <div>
		<c:if test="${empty param.page}">
			<jsp:include page="/WEB-INF/views/papago/main.jsp"></jsp:include>
		</c:if>
		<c:if test="${not empty param.page}">
			<jsp:include page="/WEB-INF/views/papago/${param.page}.jsp"></jsp:include>
		</c:if>
		</div>
		
		<!-- footer -->
		<footer class="footer">
			<p style="text-align: right">©
				https://gitlab.com/nh9600/papago-chatting.git</p>
		</footer>
		<!-- End footer -->

    <!--JS-->
    <script src="/resources/admin-theme/assets/node_modules/jquery/jquery.min.js"></script>
    <script src="/resources/admin-theme/assets/node_modules/bootstrap/js/popper.min.js"></script>
    <script src="/resources/admin-theme/assets/node_modules/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/admin-theme/js/perfect-scrollbar.jquery.min.js"></script>
    <script src="/resources/admin-theme/js/waves.js"></script>
    <script src="/resources/admin-theme/js/sidebarmenu.js"></script>
    <script src="/resources/admin-theme/js/custom.min.js"></script>
    <script src="/resources/admin-theme/assets/node_modules/raphael/raphael-min.js"></script>
    <script src="/resources/admin-theme/assets/node_modules/morrisjs/morris.min.js"></script>
    <script src="/resources/admin-theme/assets/node_modules/d3/d3.min.js"></script>
    <script src="/resources/admin-theme/assets/node_modules/c3-master/c3.min.js"></script>
    <script src="/resources/admin-theme/js/dashboard1.js"></script>
</body>

<script>
	//페이지 이동
	$(document).ready(function() {
		$('a[data-page]').on('click', function() {
			var page = this.getAttribute('data-page');
			location.href = '?page=' + page;
		})
	})

	//로그아웃
	$('#logout').on('click', function() {
		$.ajax({
			url : '/user/logout',
			method : 'GET',
			success : function(res) {
				alert(res.msg);
				location.href = '/';

			},
			error : function(res) {
				alert(res.msg);
			}
		})
	})
</script>
</html>