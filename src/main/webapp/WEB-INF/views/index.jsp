<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Landing PAGE Html5 Template">
    <meta name="keywords" content="landing,startup,flat">
    <meta name="author" content="Made By GN DESIGNS">

    <title>Papago Chatting</title>

    <!-- // PLUGINS (css files) // -->
    <link href="/resources/index-theme/assets/js/plugins/bootsnav_files/skins/color.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/js/plugins/bootsnav_files/css/animate.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/js/plugins/bootsnav_files/css/bootsnav.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/js/plugins/bootsnav_files/css/overwrite.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/js/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/js/plugins/owl-carousel/owl.theme.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/js/plugins/owl-carousel/owl.transitions.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/magnific-popup.css" rel="stylesheet">

    <!--// ICONS //-->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--// BOOTSTRAP & Main //-->

    <link href="/resources/index-theme/assets/bootstrap-3.3.7/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/index-theme/assets/css/main.css" rel="stylesheet">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-*.min.js"></script>
</head>


<body>

	<!--======================================== 
           Header
    ========================================-->

    <!--Navigation-->

    <nav class="navbar navbar-default navbar-fixed white no-background bootsnav navbar-scrollspy" data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">
        <div class="container">

            <!-- Start Header Navigation -->
            <div class="navbar-header">

				<!--logo -->
                <a class="navbar-brand" href="/">
                    <img src="/resources/index-theme/assets/img/logo.png" class="logo" alt="logo">
                </a>

            </div>
            <!-- End Header Navigation -->


            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">

                    <li class="active scroll"><a href="#home">Home</a></li>
                    
                    <li class="scroll"><a href="#services">Services</a></li>
                    
                    <li class="scroll"><a href="#contact">Contact</a></li>
                    
                    <!--로그아웃-->
                    <c:if test="${user!=null}">
                    <li class="button-holder">
                        <button class="btn btn-blue navbar-btn" id="logout">Logout</button>
                    </li>
                    </c:if>
                  
                </ul>
            </div>

        </div>
    </nav>
     <!--Navigation End-->


    <!--Banner-->

    <section id="home">
        <div class="container">
            <div class="row">

                <!-- Introduction -->
                <div class="col-md-6 caption">

                    <h1>Welcome To </h1>
                    <h1>Papago Chatting!</h1>

                    <h2>Free 
                          <span class="animated-text"></span>
                          <span class="typed-cursor"></span>
                    </h2>

                    <p>다국어 번역이 가능한 채팅 웹사이트</p>
                    <p>언어의 장벽 없이 대화가 가능합니다!</p>
                    
                    <!--로그인되면 보이는 로직(번역,채팅)-->
                    <c:if test="${user != null}">
                    <a class="btn btn-blue" href="/views/admin?page=papago-translation">
                        <i class="material-icons">play_circle_filled</i>파파고 번역하기
                    </a>
                    <a class="btn btn-blue" href="/views/admin?page=papago-chatting">
                        <i class="material-icons">play_circle_filled</i>파파고 채팅하기
                    </a>
                    </c:if>

                </div>
                
                <!-- Login -->
                <c:if test="${user==null}">
                <div class="col-md-5 col-md-offset-1">
                    <form class="signup-form">
                        <h2 class="text-center">Login Now</h2>
                        <hr>

                        <div class="form-group">
                            <input id="uiId" type="text" class="form-control" placeholder="ID" required="required" onkeyup="enterkey()">
                        </div>

                        <div class="form-group">
                            <input id="uiPwd" type="password" class="form-control" placeholder="Password" required="required" onkeyup="enterkey()">
                        </div>
                        
                        <div class="modal-footer text-center" style="padding:5px">
                            <a data-toggle="modal" data-target="#Signup" style="float:right;font-size:15px">Signup</a><p style="float:right;font-size:13px">아이디가 없으신가요?</p>
                        </div>

                        <div class="form-group text-center">
                            <button id="logIn" class="btn btn-blue btn-block" type="button">Start Now</button>
                        </div>
                        
                    </form>
                  </div>
                </c:if>

            </div>
        </div>
    </section>
    <!--Banner End-->


    <!--======================================== 
           Services
    ========================================-->

    <section id="services" class="section-padding">
		<div class="container">

			<h2>Our Services</h2>
			<p>파파고 채팅은 파파고API를 활용하여 다국어 언어 처리에 대한 네이버의 기술과 경험을 번역 엔진에 적용해 보다 정확한 번역 결과를 제공하는 서비스입니다. 파파고 채팅에 가입한 누구나 자유로운 번역이 가능하며, 번역 채팅을 통해 언어의 장벽 없이 대화를 할 수 있습니다.</p>

			<div class="row">
				<div class="col-md-4">
					<div class="icon-box">
						<i class="material-icons">thumb_up</i>

						<h4>Free Translation</h4>

					</div>
				</div>

				<div class="col-md-4">
					<div class="icon-box">
						<i class="material-icons">forum</i>

						<h4>Free Chatting</h4>

					</div>
				</div>

				<div class="col-md-4">
					<div class="icon-box">
						<i class="material-icons">settings</i>

						<h4>Easy Operating</h4>

					</div>
				</div>
			</div>
		</div>
    </section>


    <!--======================================== 
           Contact
    ========================================-->

	<section id="contact" class="section-padding">
		<h2>Contact Us</h2>

		<!-- Contact Info -->

		<div class="container contact-info">
			<div class="row">
				<div class="col-md-4">
					<div class="icon-box">

						<i class="material-icons">place</i>

						<h4>Address</h4>

						<p>인천 서구</p>

					</div>
				</div>

				<div class="col-md-4">
					<div class="icon-box">
						<i class="material-icons">phone</i>

						<h4>Call Us On</h4>

						<p>010-3299-2678</p>

					</div>
				</div>

				<div class="col-md-4">
					<div class="icon-box">
						<i class="material-icons">email</i>

						<h4>Email us on</h4>

						<p>nh9600@daum.net</p>

					</div>
				</div>
			</div>
		</div>
	</section>

	<!--======================================== 
           Footer
    ========================================-->
	<footer>
			<div class="row">
				<div class="footer-caption">

					<hr>
					<h5 class="pull-left">©
						https://gitlab.com/nh9600/papago-chatting.git</h5>

				</div>
			</div>
		</div>
	</footer>


	<!--======================================== 
           Sign up Modal
    ========================================-->

    <div class="modal fade" id="Signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                    <h4 class="modal-title text-center" id="myModalLabel">Signup</h4>

                </div>

                <div class="modal-body">
                    <form class="signup-form">
                        <div class="form-group">

                            <input name="uiName" type="text" class="form-control" placeholder="Full Name" required="required">

                        </div>

                        <div class="form-group">

                            <input name="uiId" type="text" class="form-control" placeholder="ID" required="required">

                        </div>

                        <div class="form-group">

                            <input name="uiPwd" type="password" class="form-control" placeholder="Password" required="required">

                        </div>
                        
                        <div class="form-group">언어 설정
                            <select name="uiLanguage" class="selectpicker">
                            	<option value="ko">한국어</option>
								<option value="en">영어</option>
								<option value="ja">일본어</option>
								<option value="zh-CN">중국어(간체)</option>
								<option value="zh-TW">중국어(번체)</option>
								<option value="es">스페인어</option>
								<option value="fr">프랑스어</option>
								<option value="de">독일어</option>
								<option value="ru">러시아어</option>
								<option value="it">이탈리아어</option>
								<option value="vi">베트남어</option>
								<option value="th">태국어</option>
								<option value="id">인도네시아어</option>
							</select>                            
                        </div>
                        
                        <div class="form-group text-center">

                            <button class="btn btn-blue btn-block" id="signupBtn">Signup</button>

                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!--JS-->
    <script src="/resources/index-theme/assets/bootstrap-3.3.7/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/resources/index-theme/assets/js/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="/resources/index-theme/assets/js/plugins/bootsnav_files/js/bootsnav.js"></script>
    <script src="/resources/index-theme/assets/js/plugins/typed.js-master/typed.js-master/dist/typed.min.js"></script>
    <script src="/resources/index-theme/assets/js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/jquery.magnific-popup.js"></script>
    <script src="/resources/index-theme/assets/js/main.js"></script>
    
    <script>
    
    //회원가입
    $('#signupBtn').on('click',function(){
    	
    	//유효성 검사
    	if($('[name=uiName]').val().trim().length <= 1){
    		alert('이름은 2글자 이상입니다.');
    		return false;
    	}
    	if($('[name=uiId]').val().trim().length <= 3){
    		alert('아이디는 4글자 이상입니다.');
    		return false;
    	}
    	if($('[name=uiPwd]').val().trim().length <= 3){
    		alert('비밀번호는 4글자 이상입니다.');
    		return false;
    	}
    	
		var param = {
				uiName:$('[name=uiName]').val(),
				uiId:$('[name=uiId]').val(),
				uiPwd:$('[name=uiPwd]').val(),
				uiLanguage:$('[name=uiLanguage]').val()
	    }
		
		param = JSON.stringify(param);
		
		$.ajax({
			url:'/user/signup',
			method:'POST',
			data:param,
			contentType: 'application/json',
			success : function(res){
				if(res.cnt==1){
					alert('회원 가입되었습니다.');
				}else{
					alert('다시 시도해주세요.');
				}
			},
			error:function(res){
				alert('다시 시도해주세요.');
			}
		})
	})
	
	//엔터키 이벤트(로그인)
    function enterkey() {
        if (window.event.keyCode == 13) {
            $('#logIn').click();
        }
    }
    
	//로그인
	$('#logIn').on('click',function(){
			var param = {
					uiId : $('#uiId').val(),
					uiPwd : $('#uiPwd').val()
			}
			param = JSON.stringify(param);
			$.ajax({
				url:'/user/login',
				method:'POST',
				data : param,
				contentType:'application/json',
				success : function(res){
					if(res.msg){
						alert(res.msg);
						location.href='/';
					}
				},
				error:function(res){
					alert(res.msg);
				}
			})
		})
	
	//로그아웃
	$('#logout').on('click',function(){
		$.ajax({
			url:'/user/logout',
			method:'GET',
			success:function(res){
				alert(res.msg);
				location.href='/';
				
			},
			error:function(res){
				alert(res.msg);
			}
		})
	})
    
	</script>

</body>
</html>

