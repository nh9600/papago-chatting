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
#paging:hover{
font-weight:bold;
cursor:pointer;
}
.modify:hover{
font-weight:bold;
cursor:pointer;
}
</style>

<body class="fix-header card-no-border fix-sidebar">

<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h3 class="text-themecolor">Translation Table</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item active">Table</li>
					</ol>
				</div>
			</div>

			<!-- ============================================================== -->
			<!-- Search -->
			<!-- ============================================================== -->
			<div class="input-group" style="width: 600px;left:600px;margin:5px">
						<select class="selectpicker" data-style="btn-primary">
			 					<option>선택</option>
			 					<option value="ps_num">기록번호</option>
			 					<option value="ps.ui_num">번역요청자번호</option>
								<option value="ui_id">번역요청자ID</option>
		 						<option value="pi_text">번역 전</option>
		 						<option value="pi_result">번역 후</option>
		 						<option value="ps.credat">번역 일자</option>
		 					</select>
		 					
		 					<!-- 검색창 -->
                               <input class="form-control border-secondary py-2" type="search" id="searchBar" onkeyup="enterKey()" placeholder="Search..">
      		          		<div class="input-group-append">
								<button id="searchBtn" class="btn btn-outline-secondary" type="button" onclick="searchBtn()">
									<i class="fa fa-search"></i>
								</button>
							</div>
			</div>

			<!-- ============================================================== -->
			<!-- Translation list -->
			<!-- ============================================================== -->
			<div class="row">			
			<div class="col-lg-4 col-xlg-3 col-md-5" >
					<div class="card" style="width: 1200px">

							<div class="table-responsive">
								<table class="table">
									<tr>
										<th data-order="ps_num asc">기록번호</th>
										<th data-order="ps.ui_num desc">번역요청자번호</th>
										<th data-order="ui_id desc">번역요청자ID</th>
										<th data-order="pi_text desc">번역 전</th>
										<th data-order="pi_result desc">번역 후</th>
										<th data-order="ps.credat desc">번역 일자</th>
									</tr>
									
									<tbody id="tBody">
									</tbody>
									
								</table>
								
								<div id="pagination" align="center"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
<script>

//엔터키
function enterKey() {
	if (window.event.keyCode == 13) {
		$('#searchBtn').click();
	}
}

// 검색창
function searchBtn(){
	
	var searchOpt = $(".selectpicker option:selected").val();
	var searchVal = $('#searchBar').val();
	
	if(searchOpt=='선택'){
		alert('검색할 옵션을 선택해주세요.');
		return;
	}
	if($.trim(searchVal).length<1){
		alert('한 글자 이상 입력해주세요');
		return;
	}
	var searchParam = 'searchOpt=' + searchOpt + '&searchVal=' + searchVal;
	goPage(1,searchParam);
}

//한 페이지 당 개수
var rowCount = 10;

$(document).ready(function(){
	goPage(1);
})
    //번역 리스트 
	function goPage(page, searchParam){
		$.ajax({
			url:'/papago/list',
			method:'GET',
			data : 'page.page=' + page + '&' + searchParam,
			success:function(res){
				var list = res.list;
				var html ='';
				console.log(res);
				for(lists of list){
					html += '<tr>';
					html += '<td>' + lists.psNum + '</td>';
					html += '<td>' + lists.uiNum + '</td>';
					html += '<td>' + lists.uiId + '</td>';
					html += '<td>' + lists.piText + '</td>';
					html += '<td>' + lists.piResult + '</td>';
					html += '<td>' + lists.credat + '</td>';
					html += '</tr>';
				}
				$('#tBody').html(html);
					
				// 페이징
				var totalPage = Math.ceil(res.page.totalCount/rowCount);
				var searchTotalPage = Math.ceil(res.page.searchTotalCount/rowCount);
				var sPage = Math.floor((res.page.page-1)/10)*10+1;
				var ePage = sPage + 9;
				var html = '';
				
				// 검색한 페이지
				if(searchParam != null){
					
					if(res.page.page!=1){
						html += '<a id=paging data-page="'+sPage+'">이전</a>';
					if(sPage!=1){
						html += '<a id=paging data-page="'+(sPage-1)+'">◀</a>';
						}
					}
					
					for(var i=sPage;i<=ePage;i++){
						if(i==res.page.page){
							html+='[' + i + ']';
						}else{
							html += '<a class="page-item" id=paging data-page="' + i + '">[' + i + ']</a>';
						}
					}
					if(res.page.page!=searchTotalPage){
						html += '<a class="page-item" id=paging data-page="'+(res.page.page + 1)+'">다음</a>';
					if(ePage!=searchTotalPage){
					html += '<a class="page-item" id=paging data-page="'+(sPage + 10)+'">▶</a>';
					    }
					}

					
				if(ePage>searchTotalPage){
					ePage = searchTotalPage;
				}
				var html = '';
				if(res.page.page!=1){
					html += '<a id=paging data-page="'+sPage+'">이전</a>';
				if(sPage!=1){
					html += '<a id=paging data-page="'+(sPage-1)+'">◀</a>';
					}
				}
				
				for(var i=sPage;i<=ePage;i++){
					if(i==res.page.page){
						html+='[' + i + ']';
					}else{
						html += '<a class="page-item" id=paging data-page="' + i + '">[' + i + ']</a>';
					}
				}
				if(res.page.page!=searchTotalPage){
					html += '<a class="page-item" id=paging data-page="'+(res.page.page + 1)+'">다음</a>';
				if(ePage!=searchTotalPage){
				html += '<a class="page-item" id=paging data-page="'+(sPage + 10)+'">▶</a>';
				    }
				}
				
				//전체 페이지
				}else{
					var html = '';
					if(res.page.page!=1){
						html += '<a id=paging data-page="'+sPage+'">이전</a>';
					if(sPage!=1){
						html += '<a id=paging data-page="'+(sPage-1)+'">◀</a>';
						}
					}
					
					for(var i=sPage;i<=ePage;i++){
						if(i==res.page.page){
							html+='[' + i + ']';
						}else{
							html += '<a class="page-item" id=paging data-page="' + i + '">[' + i + ']</a>';
						}
					}
					if(res.page.page!=totalPage){
						html += '<a class="page-item" id=paging data-page="'+(res.page.page + 1)+'">다음</a>';
					if(ePage!=totalPage){
					html += '<a class="page-item" id=paging data-page="'+(sPage + 10)+'">▶</a>';
					    }
					}

					
				if(ePage>totalPage){
					ePage = totalPage;
				}
				var html = '';
				if(res.page.page!=1){
					html += '<a id=paging data-page="'+sPage+'">이전</a>';
				if(sPage!=1){
					html += '<a id=paging data-page="'+(sPage-1)+'">◀</a>';
					}
				}
				
				for(var i=sPage;i<=ePage;i++){
					if(i==res.page.page){
						html+='[' + i + ']';
					}else{
						html += '<a class="page-item" id=paging data-page="' + i + '">[' + i + ']</a>';
					}
				}
				if(res.page.page!=totalPage){
					html += '<a class="page-item" id=paging data-page="'+(res.page.page + 1)+'">다음</a>';
				if(ePage!=totalPage){
				html += '<a class="page-item" id=paging data-page="'+(sPage + 10)+'">▶</a>';
				    }
				}

				}

				$('#pagination').html(html);
				setEvent(searchParam);
			},
			error:function(res){
				console.log(res);
			}
		})
	}
	
	//페이지 이동
	function setEvent(searchParam){
		if(searchParam == 'undefined'){
			$('a[data-page]').on('click',function(){
				goPage(this.getAttribute('data-page'));
			})
		}else{
			$('a[data-page]').on('click',function(){
				goPage(this.getAttribute('data-page'),searchParam);
			})
		}
}
	</script>
</html>