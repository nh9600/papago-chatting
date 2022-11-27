<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jspf" %>	

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

</head>

<body class="fix-header card-no-border fix-sidebar">
<div class="page-wrapper">

		<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h3 class="text-themecolor">Chatting</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item active">Chatting</li>
					</ol>
				</div>
			</div>

		<!-- ============================================================== -->
		<!--Chatting -->
		<!-- ============================================================== -->
		<div class="card">
			<div id="main-content" class="container">
				<div class="row">
					<div class="col-md-6">
						<form class="form-inline">
							<div class="form-group">
							
								<!--채팅 활성화-->
								<button id="connect" class="btn btn-default"
									style="margin: 10px" type="submit">Connect</button>
									
								<!--채팅 비활성화-->	
								<button id="disconnect" class="btn btn-default" type="submit"
									disabled="disabled">Disconnect</button>
									
								<br> <input type="hidden" id="sender"
									value="${user.uiName}"> <input type="hidden"
									id="source" value="${user.uiLanguage}"> <input
									type="hidden" id="target" value="${user.uiLanguage}"> <input
									type="hidden" id="uiNum" value="${user.uiNum}">
							</div>
						</form>
					</div>
				</div>
				
				<!-- 채팅 입력 -->
				<div class="row">
					<div class="col-md-6">
						<form class="form-inline">
							<div class="form-group">
								<label for="message">message</label> <input type="text"
									id="message" name="message" onkeyup="enterKey()">
								<button id="send" class="btn btn-default" type="button">send</button>
							</div>
						</form>
					</div>
				</div>
				
				<!-- 채팅 내역 -->
				<div class="row" style="width: 500px; float: left">
					<div class="col-md-12" id="scroll">
						<table id="conversation" class="table table-striped">
							<thead>
								<tr>
									<th>Greetings</th>
								</tr>
							</thead>
							
							<!-- 스크롤 -->
							<tbody class="ps__scrollbar-y-rail" id="greetings" name="scroll"
								style="overflow: auto; width: 500px; height: 500px; float: left">
							</tbody>
							
						</table>
					</div>
				</div>
				<div style="float: right;">
					<img alt="" src="/resources/admin-theme/img/chattingImage.PNG">
				</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script>

var stompClient = null;
//상대방 언어 저장
var yourLang = null;

function setConnected(connected) {
	$("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) { //연결 상태면 테이블 show
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    //테이블 초기화
    $("#greetings").html("");
}

//웹소켓 연결
function connect() {
	//소켓 생성
    var socket = new SockJS('/chat');
	//전역 변수에 세션 설정
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
    	
        setConnected(true);
        console.log('Connected: ' + frame);
        
        //api를 구독하고 있는 클라이언트들에게 브로드캐스팅
        stompClient.subscribe('/topic/greetings', function (msg) {
        	
        	console.log('msg==>'+msg);
        	var msgBody = JSON.parse(msg.body);
        	
        	//연결 완료
        	if(msgBody.type==='JOIN'){
        		$('#message').focus();	
        		showGreeting(msgBody.sender + '님이 입장하셨습니다.');
        		return;
        	}
        	
        	//클라이언트 메세지
        	console.log('확인용:' + JSON.stringify(msgBody));
        	
        	if(msgBody.sender != undefined){
        		if($('#sender').val() == msgBody.sender){
        			showGreeting('<p style=text-align:right>'+msgBody.sender+'님: '+ msgBody.message+'</p>');
        		}else{
        			showGreeting(msgBody.sender+'님: '+ msgBody.message);
        			
        		}
        		
        		//상대방 언어 저장
            	if($('#source').val()!=msgBody.language){
            		yourLang = msgBody.language; 
            	}
        		
        	}
        	
        	//번역 메세지
        	if($('#uiNum').val() == msgBody.uiNum){
        		showGreeting('<p style=text-align:right>Translation: '+ msgBody.message.result.translatedText+'</p>');
        	}else{
        		showGreeting('Translation: '+ msgBody.message.result.translatedText);
        	}
        });
        
        var param = {
        		sender : $("#sender").val(),
        		language : $('#source').val(),
        		type: 'JOIN'
        }
        stompClient.send("/app/connect/<%=session.getId()%>", {}, JSON.stringify(param));
    });   
}

//웹소켓 비활성화
function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

//엔터키
function enterKey() {
    if (window.event.keyCode == 13) {
        $('#send').click();
    }
}

//메세지 전송
function sendMessage() {
	
	//유효성 검사
	if($("#message").val().trim().length ==0){
		alert('Please enter a message.');
		return false;
	}
	
	//기본 채팅
	var param = {
			'sender': $("#sender").val(),
			'language' : $("#source").val(),
			'message' : $("#message").val()
	}
	stompClient.send("/app/message", {}, JSON.stringify(param));
	
	//번역 채팅
 	if(yourLang == null || $('#source').val() == yourLang){
		$('#target').val('en');
	}else{
		$('#target').val(yourLang);
	}

	var lang = {
			source : $('#source').val(),
			target : $('#target').val(),
			text : $('#message').val(),
			uiNum : $('#uiNum').val()
			
	}
	stompClient.send("/app/papago/trans", {}, JSON.stringify(lang));
	
	//입력창 초기화
    $("#message").val('');
}

//채팅 내역
function showGreeting(message) {
    $("#greetings").append("<tr><td style=width:500px;>" + message + "</td></tr>");
    //스크롤 최하단 포커싱
    $("[name=scroll]").scrollTop($("[name=scroll]")[0].scrollHeight);
}
	
$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendMessage(); });
});

</script>