<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
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

.datepicker {
    background-color: #fff;
    border-radius: 0 !important;
    align-content: center !important;
    padding: 0 !important
}

.datepicker-dropdown {
    top: 180px !important;
    left: calc(50% - 173.5px) !important;
    border-right: #1976D2;
    border-left: #1976D2
}

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
	<title>Saladit-admin</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${path}/css/style.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css"> -->
	<script>
       	$(function(){
       		var ctx = document.getElementById("myAreaChart");
   			var myLineChart = new Chart(ctx, {
   			  type: 'line',
   			  data: {
   			    labels: [ ${today}, "2021-04-02", "2021-04-03", "2021-04-04", 
   			    	      "2021-04-05", "2021-04-06", "2021-04-07", "2021-04-08", 
   			    	      "2021-04-09", "2021-04-10", "2021-04-11", "2021-04-12", "2021-04-13"],
   			    datasets: [{
   			      label: "Sessions",
   			      lineTension: 0.3,
   			      backgroundColor: "rgba(2,117,216,0.2)",
   			      borderColor: "rgba(2,117,216,1)",
   			      pointRadius: 5,
   			      pointBackgroundColor: "rgba(2,117,216,1)",
   			      pointBorderColor: "rgba(255,255,255,0.8)",
   			      pointHoverRadius: 5,
   			      pointHoverBackgroundColor: "rgba(2,117,216,1)",
   			      pointHitRadius: 50,
   			      pointBorderWidth: 2,
   			      data: [
   			    	  	${check0}, ${check1}, ${check2}, ${check3}, ${check4}, ${check5}, ${check6},
   			    	  	${check7}, ${check8}, ${check9}, ${check10}, ${check11}, ${check12}
 
   			    	  ],
   			    }],
   			  },
   			  options: {
   			    scales: {
   			      xAxes: [{
   			        time: {
   			          unit: 'date'
   			        },
   			        gridLines: {
   			          display: false
   			        },
   			        ticks: {
   			          maxTicksLimit: 7
   			        }
   			      }],
   			      yAxes: [{
   			        ticks: {
   			          min: 0,
   			          max: 400000,
   			          maxTicksLimit: 8
   			        },
   			        gridLines: {
   			          color: "rgba(0, 0, 0, .125)",
   			        }
   			      }],
   			    },
   			    legend: {
   			      display: false
   			    }
   			  }
   			});
       		
   			$(document).ready(function(){

   				$('.input-daterange').datepicker({
   				format: 'dd-mm-yyyy',
   				autoclose: true,
   				calendarWeeks : true,
   				clearBtn: true,
   				disableTouchKeyboard: true
   				});

   				});
        </script>
    </head>
    
    <body class="sb-nav-fixed">
    	<input type="hidden" name="firstDay" value="${startDay}">
    	<input type="hidden" name="lastDay" value="${startDay2}">
    	<input type="hidden" name="month" value="2022">
    	<input type="hidden" name="today" value="${today }">
<%--     	<input type="hidden" name="startDay2" value="${startDay2}"> --%>
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
                            <li class="breadcrumb-item active">매출통계</li>
                        </ol>  
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                매출통계
                            </div>
                            <div class="card-body">
                            	<div class="container px-1 px-sm-5 mx-auto">
								    <form autocomplete="off">
								        <div class="flex-row d-flex justify-content-center">
								            <div class="col-lg-6 col-11 px-1">
								                <div class="input-group input-daterange"> <input type="text" id="start" class="form-control text-left mr-2"> <label class="ml-3 form-control-placeholder" id="start-p" for="start">Start Date</label> <span class="fa fa-calendar" id="fa-1"></span> <input type="text" id="end" class="form-control text-left ml-2"> <label class="ml-3 form-control-placeholder" id="end-p" for="end">End Date</label> <span class="fa fa-calendar" id="fa-2"></span> </div>
								            </div>
								        </div>
								    </form>
								</div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문날짜</th>
                                            <th>판매금액</th>
                                            <th>뿅</th>
											<th>뿡</th>                                         
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문날짜</th>
                                            <th>판매금액</th>
                                            <th>뿅</th>
											<th>뿡</th>
                                        </tr>
                                    </tfoot>
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
                            </div> <!-- card mb-4 -->
                        </div> <!-- container-fluid px-4 -->
                        </div>
                        </main>
                    </div> <!-- layoutSidenav_content -->            
            </div> <!-- layoutSidenav -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path}/assets/demo/chart-area-demo.js?ver=1"></script>
<%--         <script src="${path}/assets/demo/chart-bar-demo.js"></script> --%>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/js/datatables-simple-demo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js" crossorigin="anonymous"></script>
    </body>
</html>