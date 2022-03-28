<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
<style>

input:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #1976D2 !important;
    outline-width: 0
}

.fa-calendar {
    position: absolute;
    top: 13px;
    font-size: 20px;
    color: #1976D2;
    z-index: 1000
}

#fa-1 {
    left: calc(50% - 40px)
}

#fa-2 {
    left: calc(100% - 40px)
}

.form-control-placeholder {
    position: absolute;
    top: -10px !important;
    padding: 12px 2px 0 2px;
    opacity: 0.5
}

#end-p {
    left: calc(50% + 4px)
}

.form-control:focus+.form-control-placeholder,
.form-control:valid+.form-control-placeholder {
    font-size: 95%;
    top: 10px;
    transform: translate3d(0, -100%, 0);
    opacity: 1
}

::placeholder {
    color: #BDBDBD;
    opacity: 1
}

:-ms-input-placeholder {
    color: #BDBDBD
}

::-ms-input-placeholder {
    color: #BDBDBD
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0
}

.datepicker {
    background-color: #fff;
    border-radius: 0 !important;
    align-content: center !important;
    padding: 0 !important
}
/*
 .datepicker-dropdown {
    top: 180px !important;
    left: calc(50% - 173.5px) !important;
    border-right: #1976D2;
    border-left: #1976D2
} 
*/
.datepicker-dropdown.datepicker-orient-left:before {
    left: calc(50% - 6px) !important
}

.datepicker-dropdown.datepicker-orient-left:after {
    left: calc(50% - 5px) !important;
    border-bottom-color: #1976D2
}

.datepicker-dropdown.datepicker-orient-right:after {
    border-bottom-color: #1976D2
}

.datepicker table tr td.today,
span.focused {
    border-radius: 50% !important;
    background-image: linear-gradient(#FFF3E0, #FFE0B2)
}

thead tr:nth-child(2) {
    background-color: #1976D2 !important
}

thead tr:nth-child(3) th {
    font-weight: bold !important;
    padding: 20px 10px !important;
    color: #BDBDBD !important
}

tbody tr td {
    padding: 10px !important
}

tfoot tr:nth-child(2) th {
    padding: 10px !important;
    border-top: 1px solid #CFD8DC !important
}

.cw {
    font-size: 14px !important;
    background-color: #E8EAF6 !important;
    border-radius: 0px !important;
    padding: 0px 20px !important;
    margin-right: 10px solid #fff !important
}

.old,
.day,
.new {
    width: 40px !important;
    height: 40px !important;
    border-radius: 0px !important
}

.day.old,
.day.new {
    color: #E0E0E0 !important
}

.day.old:hover,
.day.new:hover {
    border-radius: 50% !important
}

.old-day:hover,
.day:hover,
.new-day:hover,
.month:hover,
.year:hover,
.decade:hover,
.century:hover {
    border-radius: 50% !important;
    background-color: #eee
}

.range-start,
.range-end {
    border-radius: 50% !important;
    background-image: linear-gradient(#1976D2, #1976D2) !important
}

.range {
    background-color: #E3F2FD !important
}

.prev,
.next,
.datepicker-switch {
    border-radius: 0 !important;
    padding: 10px 10px 10px 10px !important;
    font-size: 18px;
    opacity: 0.7;
    color: #fff
}

.prev:hover,
.next:hover,
.datepicker-switch:hover {
    background-color: inherit !important;
    opacity: 1
}

@media screen and (max-width: 726px) {
    .datepicker-dropdown.datepicker-orient-right:before {
        right: calc(50% - 6px)
    }

    .datepicker-dropdown.datepicker-orient-right:after {
        right: calc(50% - 5px)
    }
}
 </style>
 
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Saladit-sales</title>
	
	<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="${path}/css/style.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
	<script>
   
   			//datepicker	
   		 $(document).ready(function(){

   			$('.input-daterange').datepicker({
   			format: 'yyyy-mm-dd',
   			autoclose: true,
   			calendarWeeks : true,
   			clearBtn: true,
   			disableTouchKeyboard: true
   			});

   			});
   		 
   			//modal
   		$(document).ready(function(){
   		    function alignModal(){
   		        var modalDialog = $(this).find(".modal-dialog");
   		        
   		        // Applying the top margin on modal dialog to align it vertically center
   		        modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
   		    }
   		    // Align modal when it is displayed
   		    $(".modal").on("shown.bs.modal", alignModal);
   		    
   		    // Align modal when user resize the window
   		    $(window).on("resize", function(){
   		        $(".modal:visible").each(alignModal);
   		    });   
   		});
   			
   	$(function(){
		$(document).on('click','.dropdown-item.month',function(){
   			var getMonth = $(this).text();	
   			
   			$.ajax({
   				url : 'getMonthList.mdo',
   				type : 'post',
   				dataType: 'html',
   				data : {
   					"getMonth" : getMonth
   				},
   				success:function(htmlOut){
   					$('.table.table-striped').children().remove();
   					$('.table.table-striped').append(htmlOut);
	
   				}
   				
   			})
   			
   		})
   		
//    		$(document).on('click','#item_tag_main',function(){
   			
//    		})
  
// 메인태그 클릭시 서브태그 변경  -> ajax 처리하기에 작아서 뷰에서 처리 -> subTag없어서 변경
   		$(document).ready(function(){
   			$('#item_tag_main').on('change',function(){
   				var tagMain = $("#item_tag_main option:selected").val();
   				$('#item_tag_sub').children().remove();
   				
   				$.ajax({
   					url : 'getItemList.mdo',
   					type: 'post',
   					dataType : 'html',
   					data :{
   						"tagMain" : tagMain
   					},
   					success:function(htmlOut){
   						$('#item_tag_sub').append(htmlOut);
   					}
   				
   				
   					
   				})
//    	   			if(tagMain == 100){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="101">101</option>');
//    					$('#item_tag_sub').append('<option value="102">102</option>');
//    	   			}else if(tagMain == 200){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="201">201</option>');
//    					$('#item_tag_sub').append('<option value="202">202</option>');
//    					$('#item_tag_sub').append('<option value="203">203</option>');
//    					$('#item_tag_sub').append('<option value="204">204</option>');
   	   				
//    	   			}else if(tagMain == 300){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="301">301</option>');
//    					$('#item_tag_sub').append('<option value="302">302</option>');
   	   				
//    	   			}else if(tagMain == 400){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="401">401</option>');
//    					$('#item_tag_sub').append('<option value="402">402</option>');
   	   				
//    	   			}else if(tagMain == 500){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="501">501</option>');
//    					$('#item_tag_sub').append('<option value="502">502</option>');
   	   				
//    	   			}else if(tagMain == 600){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="201">601</option>');
//    					$('#item_tag_sub').append('<option value="602">602</option>');
//    					$('#item_tag_sub').append('<option value="603">603</option>');
   	   				
//    	   			}else if(tagMain == 700){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="700">x</option>');
   	   				
//    	   			}else if(tagMain == 800){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="800">x</option>');
   	   				
//    	   			}else if(tagMain == 900){
//    					$('#item_tag_sub').children().remove();
//    					$('#item_tag_sub').append('<option selected>tagSub</option>');
//    					$('#item_tag_sub').append('<option value="900">x</option>');
   	   				
//    	   			}
	
			 
   			})
   			
   		})
   		
   		$(document).on('click','.btn.btn-primary.btn-sm',function(){
   			var tagMain = $("#item_tag_main option:selected").val();
   			//alert("tagMain : "+tagMain); 
   			var itemCode = $("#item_tag_sub option:selected").val();
   			//alert("itemCode : "+itemCode);
   			var start = $('#start').val();
   			var end = $('#end').val();
   			//alert("시작일 : "+start+" 마지막일 : "+end);
   			
   			
   			$.ajax({
   				url : 'getDetailList.mdo',
   				type : 'post',
   				dataType: 'html',
   				data : {
					"tagMain" : tagMain,
					"itemCode" : itemCode,
					"start" : start,
					"end" : end
   				},
   				success:function(htmlOut){
   					$('.table.table-striped').children().remove();
   					$('.table.table-striped').append(htmlOut);
   				}
   				
   			});
   			
   			//검색 눌렀을시 모달창 닫을때 필요한것들
   			$('#myModal').attr('style',"display: none");
   			$('#myModal').toggleClass('show');
   			$('#myModal').removeAttr('role');
   			$('.modal-backdrop.show').remove();	
   			$('body').toggleClass('modal-open');
   			$('body').removeAttr('style');
   			
   			
   		});
   		
   		

   	})
   				
   			
        </script>
    </head>
    
    <body class="sb-nav-fixed">
	        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" id="input">
	        <!-- Navbar Brand-->
	            <a class="navbar-brand ps-3" href="index.html">Saladit - admin</a>
	        <!-- Sidebar Toggle-->
	            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	        <!-- Navbar Search-->
	            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
	                <div class="input-group">
	                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
	                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
	                </div>
	            </form>
	        <!-- Navbar-->
	            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="#!">Settings</a></li>
	                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
	                        <li><hr class="dropdown-divider" /></li>
	                        <li><a class="dropdown-item" href="#!">Logout</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </nav>
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav"> 
                            <a class="nav-link" href="adminMainChart.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Admin
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="adminCouponTypeManagement.mdo">쿠폰관리</a>
                                    <a class="nav-link" href="userCouponManage.mdo">발급쿠폰관리</a>
                                    <a class="nav-link" href="mdInfo.mdo">MD추천관리</a>
                                    <a class="nav-link" href="bannerManagement.mdo">배너관리</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                상품/판매
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        조회/등록/수정
                                    </a>  
                                </nav>
                            </div>
                            
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                주문/배송
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionOrders">
                                    <a class="nav-link" href="#">주문목록</a>
                                    <a class="nav-link" href="#">배송중</a>
                                    <a class="nav-link" href="#">배송완료</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionUser">
                                    <a class="nav-link" href="memberManagement.mdo">회원관리</a>
                                    <a class="nav-link" href="#">리뷰관리</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 매출/상품통계관리
							</a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">매출통계</h1>
                         <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#myModal" data-toggle="modal" data-target="#exampleModalCenter" style="padding:0px 30px; float:right;">상세검색</button>
                                  <div class="modal" id="myModal">
                                    <form name="" action = "" enctype = "multipart/form-data">
								                      <div class="modal-dialog modal-centered">
								                        <div class="modal-content">
								                          <div class="modal-header">
								                             <h5 class="modal-title">매출상세검색</h5>
								                              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								                          </div>
								                          <div class="modal-body">
								                          <!-- form -->
	           							
	           							                  <!-- table -->
	           							               	  <table class = "table table-bordered dataTable" cellspacing = "0" >
				                                            <tr>
				                                            <th scope="row" width=50>
				                                            기간
				                                            </th>
				                                              <td width=150>
				                                                <form autocomplete="off">
															        <div class="flex-row d-flex justify-content-center">
															            <div class="col-lg-6 col-11 px-1">
															                <div class="input-group input-daterange" style="width:100%;"> 
															                	<input type="text" id="start" class="form-control text-left mr-2">
															                	<label class="ml-3 form-control-placeholder" id="start-p" for="start"></label> 
															                	<span class="fa fa-calendar" id="fa-1"></span> 
															                	<input type="text" id="end" class="form-control text-left ml-2"> 
															                	<label class="ml-3 form-control-placeholder" id="end-p" for="end"></label> 
															                	<span class="fa fa-calendar" id="fa-2"></span> 
															                </div>
															            </div>
															        </div>       
															    </form>
				                                              </td>
				                                            </tr>
				                                            
				                                            <tr>
				                                              <th scope="row" width=50>
				                                                카테고리
				                                              </th>
				                                              <td width=150>
																<div class="row">
																  <div class="col">
																    <select name="item_tag_main" id="item_tag_main" onchange="tagChange(this)" class="form-select" id="floatingSelect" aria-label="Floating label select example" style="width:100%;">
																    <option selected>Main tag</option>
																    <option value="100">100. 정기구독</option>
																    <option value="200">200. 샐러드</option>
																    <option value="300">300. 샌드위치/랩</option>
																    <option value="400">400. 도시락/간편식</option>
																    <option value="500">500. 죽/스프</option>
																    <option value="700">600. 세트상품</option>
																    <option value="700">700. 간식</option>
																    <option value="800">800. 음료</option>
																  </select>
																  </div>
																  <div class="col" >
																    <select name="item_tag_sub" id="item_tag_sub" class="form-select" id="subTag" aria-label="Floating label select example" style="width:100%;">
																    <option selected>Item Code</option>
																  </select>
																  </div>
																</div>
															</td>
				                                            </tr>
	           							                </table>
	           							            	</div>
	           						              
							                        	<div class="modal-footer"">
							                        	<button type="button" class="btn btn-primary btn-sm">검색</button>
							                       		</div>
							                       	</div>
							                       </div>
							                </form>
							      	</div> <!-- modal --></li>
			                        </ol>
			         				
			                        <div class="card mb-4">
			                            <div class="card-header">
			                                <i class="fas fa-table me-1"></i>
			                                매출통계
			                               <div class="dropdown" style="float:right;">
											  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
											    ----------------
											  </button>
											  <ul class="dropdown-menu month" aria-labelledby="dropdownMenu2">
											    <li><button class="dropdown-item month" type="button">최근 1개월</button></li>
											    <li><button class="dropdown-item month" type="button">최근 3개월</button></li>
											    <li><button class="dropdown-item month" type="button">최근 6개월</button></li>
											  </ul>
											</div>
												</div> <!-- card header -->

                            <div class="card-body">
                            
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>주문날짜</th>
                                            <th>판매금액</th>
                                            <th>뿅</th>
											<th>뿡</th>                                         
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1위</td>
                                            <td>아쉬파 샐러드</td>
                                            <td>77</td>
                                            <td>999999999원</td>
                                        </tr>
                                        <tr>
                                            <td>2위</td>
                                            <td>잠봉 시저 샐러드</td>
                                            <td>73</td>
                                            <td>995657759원</td>
                                        </tr>
                                        <tr>
                                            <td>3위</td>
                                            <td>홀그레인 로스트비프 바게트 샌드</td>
                                            <td>68</td>
                                            <td>945274555원</td>
                                        </tr>
                                        <tr>
                                            <td>4위</td>
                                            <td>바베큐 풀드포크 바게트 샌드</td>
                                            <td>60</td>
                                            <td>934662453원</td>
                                        </tr>
                                        <tr>
                                            <td>5위</td>
                                            <td>[올가니카]플랜트 왕교자</td>                      
                                            <td>56</td>
                                            <td>457457388원</td>
                                        </tr>
                                        <tr>
                                            <td>6위</td>
                                            <td>[그리팅]땅콩호박스프</td>                      
                                            <td>50</td>
                                            <td>456453788원</td>
                                        </tr>
                                        <tr>
                                            <td>7위</td>
                                            <td>샐러드와 고구마 든든세트</td>                      
                                            <td>48</td>
                                            <td>453344336원</td>
                                        </tr>
                                        <tr>
                                            <td>8위</td>
                                            <td>샐러드와 계란 촉촉세트</td>                      
                                            <td>45</td>
                                            <td>421243235원</td>
                                        </tr>
                                        <tr>
                                            <td>9위</td>
                                            <td>딸기 바닐라 크림치즈 샐러드</td>                      
                                            <td>35</td>
                                            <td>234346555원</td>
                                        </tr>
                                        <tr>
                                            <td>10위</td>
                                            <td>들기름 메밀면 샐러드</td>                      
                                            <td>22</td>
                                            <td>212334555원</td>
                                        </tr>

                                     
                                    </tbody>
                                </table>
                                </div>
                            </div> <!-- card mb-4 -->
                        </div> <!-- container-fluid px-4 -->
                        </main>
                        </div>
                    </div> <!-- layoutSidenav_content -->            <!-- layoutSidenav -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path}/assets/demo/chart-area-demo.js?ver=1"></script>
<%--         <script src="${path}/assets/demo/chart-bar-demo.js"></script> --%>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/js/datatables-simple-demo.js"></script>
    </body>
</html>