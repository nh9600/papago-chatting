<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

</head>

<body class="fix-header card-no-border fix-sidebar">
	
	<input Type="hidden" value="${user.uiNum}" id="uiNum">
	
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h3 class="text-themecolor">Profile</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item active">Profile</li>
					</ol>
				</div>
			</div>
			
			<!-- ============================================================== -->
			<!--Profile -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-lg-4 col-xlg-3 col-md-5">
					<div class="card">
						<div class="card-body" style="text-align:center">
						    
						    <!--사용자가 이미지를 설정했을 경우 -->   
							<c:if test="${user.uiImg != null}">
							<img src="https://phn-test.s3.ap-northeast-2.amazonaws.com/papago-chatting/${user.uiImg}" alt=""
								data-user="uiImg" class="img-circle" width="250" />
							</c:if>
							
							<!--사용자가 이미지를 설정하지 않았을 경우-->  
							<c:if test="${user.uiImg == null}">
                            <img src="/resources/admin-theme/img/noImg.PNG" class="img-circle" width="250" /> 
                            </c:if>
                            
								<label class="col-md-12">Image</label> 
								<input style="padding-top: 15px" type="file" id="uiImgFile">
						</div>
					</div>
				</div>
				
				<div class="col-lg-8 col-xlg-9 col-md-7">
					<div class="card" style="width:930px">
						<div class="card-body"  >
							<form class="form-horizontal form-material">

								<div class="form-group" >
									<label class="col-md-12">Full Name</label>
									<div class="col-md-12">
										<p class="font-medium" data-user="uiName">${user.uiName}</p>
										<!-- <input type="text" placeholder=class="form-control form-control-line">-->
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-12">ID</label>
									<div class="col-md-12">
										<p class="font-medium" data-user="uiId">${user.uiId}</p>
										<!--<input type="text" value="password" class="form-control form-control-line">-->
									</div>
								</div>

 								<div class="form-group" id="pwd">
									<label class="col-md-12">Password</label>
									<div class="col-md-12">
										<p data-user="uiPwd">********</p>
									</div>
								</div> 

								<div class="form-group" id="language">
									<label class="col-md-12">Language</label>
									<div class="col-md-12">
										<p data-user="uiLanguage">${user.uiLanguage}</p>
									</div>
								</div>

								<!--업데이트 버튼을 클릭했을 경우 show -->
								<div class="form-group" id="languageUpdate">
									<label class="col-md-12">Language</label>
									<div class="col-md-12">
										<select id="uiLanguage" class="form-control form-control-line">
										    <option value="null">Select</option>
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
								</div>
								
								<!-- 수정 버튼 -->
								<div class="form-group">
									<div class="col-sm-12">
										<div class="btn btn-success" id="updateUserInfo">Update
											Profile</div>
									</div>
								</div>
								
								<!-- 저장 버튼 -->
								<div class="form-group" id="saveBtn">
									<div class="col-sm-12">
										<div class="btn btn-success" id="saveUserInfo">Save Profile</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>

<script>
	window.onload = function() {

		$('#languageUpdate').hide(); 
		$('#saveBtn').hide();
		$('#uiImgFile').hide();
		
		//update 버튼 클릭시 show
		$('#updateUserInfo').on('click',function(){

			$('#updateUserInfo').hide();
			$('#saveBtn').show();
			$('#uiImgFile').show();
			
			$('#languageUpdate').show();
			$('#language').hide();
			
			//update 버튼을 클릭했을 경우 input태그로 변환
			var user = document.querySelectorAll('p[data-user]');
			for (var i = 0; i < user.length; i++) {
				var attr = user[i].getAttribute('data-user');
				if (attr == 'uiName') {
					user[i].innerHTML = '<input class="form-control form-control-line" type="text" id="uiName" value="'+`${user.uiName}`+'">'
				} else if (attr == 'uiId') {
					user[i].innerHTML = '<input class="form-control form-control-line" type="text" id="uiId" value="'+`${user.uiId}`+'">'
				} else if (attr == 'uiPwd') {
					user[i].innerHTML = '<input type="password" class="form-control form-control-line" id="uiPwd" placeholder="********">'
				}
		}
	  })	
	
	//업데이트
	$('#saveUserInfo').on('click', function() {
		
		//유효성 검사
		if($('#uiName').val().trim().length < 2){
			alert('이름은 2글자 이상입니다.');
			return false;
		}
		if($('#uiId').val().trim().length < 3){
			alert('아이디는 3글자 이상입니다.');
			return false;
		}
		if($('#uiPwd').val().trim().length < 5){
			alert('비밀번호는 5글자 이상입니다.');
			return false;
		}
		if($('#uiLanguage').val() == "null"){
			alert('언어를 선택해주세요.');
			return false;
		}
		
		//이미지 업데이트
		var objs = document.querySelectorAll('input[id],select[id]');
		var formData = new FormData(); 
		for(var i=0;i<objs.length;i++){
			var obj = objs[i];
			if(obj.type=='file'){
				if(obj.files.length){
				formData.append(obj.id, obj.files[0]);
				console.log(obj.files[0]);
				}
			}else{
				formData.append(obj.id, obj.value);
			}
		}
		
		$.ajax({
			url : '/user/update',
			method : 'PUT',
			data:formData,
			contentType:false,
			processData: false,
			success:function(res){
				alert(res.msg);
				location.replace('/views/admin?page=profile&uiNum='+$('#uiNum').val());
			},
			error:function(res){
				alert('다시 시도해주세요.');
			}
		})
	})
   }
	
</script>
</html>