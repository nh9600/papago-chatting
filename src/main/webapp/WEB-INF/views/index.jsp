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
                    
                    <!--????????????-->
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

                    <p>????????? ????????? ????????? ?????? ????????????</p>
                    <p>????????? ?????? ?????? ????????? ???????????????!</p>
                    
                    <!--??????????????? ????????? ??????(??????,??????)-->
                    <c:if test="${user != null}">
                    <a class="btn btn-blue" href="/views/admin?page=papago-translation">
                        <i class="material-icons">play_circle_filled</i>????????? ????????????
                    </a>
                    <a class="btn btn-blue" href="/views/admin?page=papago-chatting">
                        <i class="material-icons">play_circle_filled</i>????????? ????????????
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
                            <a data-toggle="modal" data-target="#Signup" style="float:right;font-size:15px">Signup</a><p style="float:right;font-size:13px">???????????? ????????????????</p>
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
			<p>????????? ????????? ?????????API??? ???????????? ????????? ?????? ????????? ?????? ???????????? ????????? ????????? ?????? ????????? ????????? ?????? ????????? ?????? ????????? ???????????? ??????????????????. ????????? ????????? ????????? ????????? ???????????? ????????? ????????????, ?????? ????????? ?????? ????????? ?????? ?????? ????????? ??? ??? ????????????.</p>

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

						<p>?????? ??????</p>

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
					<h5 class="pull-left">??
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
                        
                        <div class="form-group">?????? ??????
                            <select name="uiLanguage" class="selectpicker">
                            	<option value="ko">?????????</option>
								<option value="en">??????</option>
								<option value="ja">?????????</option>
								<option value="zh-CN">?????????(??????)</option>
								<option value="zh-TW">?????????(??????)</option>
								<option value="es">????????????</option>
								<option value="fr">????????????</option>
								<option value="de">?????????</option>
								<option value="ru">????????????</option>
								<option value="it">???????????????</option>
								<option value="vi">????????????</option>
								<option value="th">?????????</option>
								<option value="id">??????????????????</option>
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
    
    //????????????
    $('#signupBtn').on('click',function(){
    	
    	//????????? ??????
    	if($('[name=uiName]').val().trim().length <= 1){
    		alert('????????? 2?????? ???????????????.');
    		return false;
    	}
    	if($('[name=uiId]').val().trim().length <= 3){
    		alert('???????????? 4?????? ???????????????.');
    		return false;
    	}
    	if($('[name=uiPwd]').val().trim().length <= 3){
    		alert('??????????????? 4?????? ???????????????.');
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
					alert('?????? ?????????????????????.');
				}else{
					alert('?????? ??????????????????.');
				}
			},
			error:function(res){
				alert('?????? ??????????????????.');
			}
		})
	})
	
	//????????? ?????????(?????????)
    function enterkey() {
        if (window.event.keyCode == 13) {
            $('#logIn').click();
        }
    }
    
	//?????????
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
	
	//????????????
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

