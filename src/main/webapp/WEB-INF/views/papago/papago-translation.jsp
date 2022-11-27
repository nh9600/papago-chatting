<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

</head>

<style>
#nav-wrap .navs {
	width: 100%;
	position: relative;
	bottom: 0;
	color: rgb(48, 36, 36);
	display: flex;
	justify-content: space-around;
	margin: 18px;
	font-size: 20px;
}

#nav-wrap .navs>* {
	text-transform: uppercase;
	height: 50px;
}

#nav-wrap .navs>*>span {
	line-height: 50px;
}

#nav-wrap .navs>*:hover {
	color: rgb(231, 31, 155);
	border-block-color: rgb(175, 87, 116);
}

#wrap-container {
	margin: 0 auto;
	border: 1px solid balck;
	height: 500px;
	text-align: center;
}

#wrap1 {
	margin: 5px auto;
	padding: 10px;
	width: 50%;
	height: 100%;
	display: flex;
	justify-content: space-around;
	float: left;
}

#wrap2 {
	margin: 5px auto;
	padding: 10px;
	width: 50%;
	height: 100%;
	display: flex;
	justify-content: space-around;
	float: right;
}

#content-wrap {
	width: 100%;
	padding: 0px;
	border: 1px solid rgb(169, 165, 172);
	text-align: center;
}

.content-box {
	width: 100%;
	padding: 10px 20px 10px 20px;
	font-size: 18px;
}

#source {
	width: 100%;
	padding: .8em .5em;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	font-size: 18px; <!--
	background-color: rgb(255, 230, 0);
	-->
}

#target {
	width: 100%;
	padding: .8em .5em;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	font-size: 18px; 

}

selectLang1::-ms-expand {
	display: none;
}

#wrap3 {
	clear: both;
	margin: 0 auto;
	display: flex;
	justify-content: space-around;
}

#footer {
	line-height: 50px;
	text-align: center;
	width: 200px;
	height: 50px;
	margin: 10px auto; <!--
	background-color: rgb(186, 248, 180); -->
	color: rgb(104, 93, 93);
	font-size: 20px;
	font-weight: 900;
}

#transBtn {
	width: 200px;
	float: right;
	padding: 15px;
	margin-right: 25px;
	color:white;
	font-size:17px;
	font: bold;
}
</style>

<body class="fix-header card-no-border fix-sidebar">

	<div class="page-wrapper">
	<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h3 class="text-themecolor">Papago Translation</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item active">Translation</li>
					</ol>
				</div>
			</div>
			
		<!-- ============================================================== -->
		<!--Translation -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
					
					<!-- 번역하기 버튼 -->
						<a id="transBtn" class="btn waves-effect waves-light btn btn-info pull-right hidden-sm-down">
							번역하기</a>
							
						<div class="table-responsive">
							<div id="wrap-container">
							
							<!-- 번역할 언어 -->
								<div id="wrap1">
									<div id="content-wrap">
										<div class="selectBox">
											<select id="source" name="selectLang">
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
										
										<!-- 번역할 내용  -->
										<div class="content-box">
											<textarea id="text" name="air_type"
												placeholder="번역할 내용을 입력하세요."
												style="width: 85%; height: 300px; border: 0; padding: 10px; overflow-y: hidden; background: clear; resize: none"></textarea>
										</div>
										
									</div>
								</div>
								
								<!-- 번역될 언어 -->
								<div id="wrap2">
									<div id="content-wrap">
										<div class="selectBox">
											<select id="target" name="selectLang">
												<option value="en">영어</option>
												<option value="ko">한국어</option>
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
										
										<!-- 번역 결과 -->
										<div class="content-box">
											<textarea id="result" name="air_type"
												style="width: 85%; height: 300px; border: 0; padding: 10px; overflow-y: hidden; background: clear; resize: none"></textarea>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

<script>
	//번역하기
	$(document).ready(function() {
		$('#transBtn').on('click', function() {
			var param = {
				//선택된 언어
				source : $('#source option:selected').val(),
				target : $('#target option:selected').val(),
				text : $('#text').val()
			}
			$.ajax({
				url : '/papago/trans',
				method : 'POST',
				data : JSON.stringify(param),
				contentType : 'application/json',
				success : function(res) {
					console.log(res);
					$('#result').val(res.result.translatedText);
				},
				error : function(res) {
					alert('다시 시도해주세요.');
				}
			})
		})
	});
</script>
</html>