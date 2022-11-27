<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- css -->
<%@ include file="/WEB-INF/views/common/css.jsp"%>

<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row page-titles">
			
				<div class="col-md-5 align-self-center">
					<h3 class="text-themecolor">Dashboard</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
				</div>
				
			</div>
			
			<!-- ============================================================== -->
			<!-- Skills -->
			<!-- ============================================================== -->
			<div class="row" style="margin: 8px">
				<div class="card" style="width: 830px; height: 770px; float: left">
					<div class="card-body" >
					
					    <!-- 파파고 채팅에 활용한 스킬 -->
						<div class="d-flex no-block">
							<h4 class="card-title m-b-0 align-self-center">Skils</h4>
						</div>
						
						<!--JAVA, Spring, MyBatis -->
						<div class="d-flex no-block">
							<h5 class="card-title m-b-0 align-self-center"
								style="margin: 20px">Language & Framework</h5>
						</div>
						<div class="d-flex no-block"
							style="width: 700px; margin-right: 700px">
							<div class="jb-wrap" style="float: left">
								<div class="jb-image" style="width: 120px; height: 120px">
									<img src="/resources/admin-theme/img/java.PNG" alt=""
										class="rounded" width="120" height="120" style="margin: 5px;" />
								</div>
								<div class="jb-text">
									<div class="jb-text-table">
										<div class="jb-text-table-row">
											<div class="jb-text-table-cell">
												<p>JAVA</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div>
								<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/spring.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>Spring</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/MyBatis.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>MyBatis</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!--RDS, HeidiSQL -->
						<div class="d-flex no-block">
							<h5 class="card-title m-b-0 align-self-center"
								style="margin: 20px">DataBase</h5>
						</div>
						<div class="d-flex no-block"
							style="width: 700px; margin-right: 700px">
							<div class="jb-wrap" style="float: left">
								<div class="jb-image" style="width: 120px; height: 120px">
									<img src="/resources/admin-theme/img/RDS.PNG" alt=""
										class="rounded" width="120" height="120" style="margin: 5px;" />
								</div>
								<div class="jb-text">
									<div class="jb-text-table">
										<div class="jb-text-table-row">
											<div class="jb-text-table-cell">
												<p>RDS</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div>
								<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/HS.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>HeidiSQL</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- HTML, JS, CSS, JSP, AJAX, jQuery, WebSocket -->
						<div class="d-flex no-block">
							<h5 class="card-title m-b-0 align-self-center"
								style="margin: 20px">Web</h5>
						</div>
						
						<div class="d-flex no-block"
							style="width: 700px; margin-right: 700px">
							<div class="jb-wrap" style="float: left">
								<div class="jb-image" style="width: 120px; height: 120px">
									<img src="/resources/admin-theme/img/html.PNG" alt=""
										class="rounded" width="120" height="120" style="margin: 5px;" />
								</div>
								<div class="jb-text">
									<div class="jb-text-table">
										<div class="jb-text-table-row">
											<div class="jb-text-table-cell">
												<p>HTML</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div>
								<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/js.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>JavaScript</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div>
								<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/css.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>CSS</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="jb-wrap" style="float: left">
								<div class="jb-image" style="width: 120px; height: 120px">
									<img src="/resources/admin-theme/img/jsp.PNG" alt=""
										class="rounded" width="120" height="120" style="margin: 5px;" />
								</div>
								<div class="jb-text">
									<div class="jb-text-table">
										<div class="jb-text-table-row">
											<div class="jb-text-table-cell">
												<p>Java Server Pages</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="d-flex no-block">
								<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/ajax.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>AJAX</p>
												</div>
											</div>
										</div>
									</div>
								</div>

							<div>
								<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/jq.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>jQuery</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="jb-wrap" style="float: left">
									<div class="jb-image" style="width: 120px; height: 120px">
										<img src="/resources/admin-theme/img/websocket.PNG" alt=""
											class="rounded" width="120" height="120" style="margin: 5px;" />
									</div>
									<div class="jb-text">
										<div class="jb-text-table">
											<div class="jb-text-table-row">
												<div class="jb-text-table-cell">
													<p>Spring Boot WebSocket</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					<!-- ============================================================== -->
					<!-- Skills -->
					<!-- ============================================================== -->

					<div id="developer" style="height: 355px;"></div>
				</div>

				<!-- ============================================================== -->
				<!-- Developer Profile -->
				<!-- ============================================================== -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body" style="float: left">
							<div class="d-flex m-b-30 no-block">

								<h4 class="card-title m-b-0 align-self-center">Developer Profile</h4>
								
							</div>
							
							<img src="/resources/admin-theme/img/sky.jpg" alt=""
								class="rounded-circle" width="220" height="300"
								style="margin: 20px; margin-left: auto; margin-right: auto; display: block;" />
							<h5 class="card-title m-b-0 align-self-center"
								style="text-align: center">박하늘</h5>
							<h6 class="card-title m-b-0 align-self-center"
								style="padding-bottom: 10px; text-align: center">Ha-neul
								Park</h6>
							<h5 class="card-title m-b-0 align-self-center"
								style="text-align: center">E-mail : nh9600@daum.net</h5>
							<h5 class="card-title m-b-0 align-self-center"
								style="text-align: center">Tel : 010-3299-2678</h5>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- Developer Profile -->
				<!-- ============================================================== -->
				
			</div>
		</div>
	</div>
		
</body>
</html>