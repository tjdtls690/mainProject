<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/admin"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Saladit-admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/css/style.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script type="text/javascript">
        	$(function(){
        		var ctx = document.getElementById("myAreaChart");
    			var myLineChart = new Chart(ctx, {
    			  type: 'line',
    			  data: {
    			    labels: ["Mar1", "Mar2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
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
    			      data: [10000, 200, ${check10}, 400, 500, 600, 700, 800, 900, 1000, 1100, 12000, 1300],
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
    			          max: 40000,
    			          maxTicksLimit: 5
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
        		
        		
//         		$(document).on('click', '.small.text-white.stretched-link', function(){
//         			var ctx = document.getElementById("myAreaChart");
//         			var myLineChart = new Chart(ctx, {
//         			  type: 'line',
//         			  data: {
//         			    labels: ["Mar1", "Mar2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
//         			    datasets: [{
//         			      label: "Sessions",
//         			      lineTension: 0.3,
//         			      backgroundColor: "rgba(2,117,216,0.2)",
//         			      borderColor: "rgba(2,117,216,1)",
//         			      pointRadius: 5,
//         			      pointBackgroundColor: "rgba(2,117,216,1)",
//         			      pointBorderColor: "rgba(255,255,255,0.8)",
//         			      pointHoverRadius: 5,
//         			      pointHoverBackgroundColor: "rgba(2,117,216,1)",
//         			      pointHitRadius: 50,
//         			      pointBorderWidth: 2,
//         			      data: [10000, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300],
//         			    }],
//         			  },
//         			  options: {
//         			    scales: {
//         			      xAxes: [{
//         			        time: {
//         			          unit: 'date'
//         			        },
//         			        gridLines: {
//         			          display: false
//         			        },
//         			        ticks: {
//         			          maxTicksLimit: 7
//         			        }
//         			      }],
//         			      yAxes: [{
//         			        ticks: {
//         			          min: 0,
//         			          max: 40000,
//         			          maxTicksLimit: 5
//         			        },
//         			        gridLines: {
//         			          color: "rgba(0, 0, 0, .125)",
//         			        }
//         			      }],
//         			    },
//         			    legend: {
//         			      display: false
//         			    }
//         			  }
//         			});
//         		})
        	})
        </script>
    </head>
    
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
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
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                상품/판매
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">조회/등록/수정</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                주문/환불
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                매출/상품통계관리
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시글관리
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">금 주 매출</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">자세히보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">금 달 매출</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">자세히보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">주문 요청(결제완료)</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">5건</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">1:1 문의/상품 문의</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">8건</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        일 별 차트
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        월 별 차트
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Best Top 10 !
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>랭크</th>
                                            <th>상품명</th>
                                            <th>판매횟수</th>
											<th>총 판매금액</th>                                         
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>랭크</th>
                                            <th>상품명</th>
                                            <th>판매횟수</th>
											<th>총 판매금액</th> 
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
                            </div>
                        </div>
                    </div>
                </main>
               
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path}/assets/demo/chart-area-demo.js?ver=1"></script>
        <script src="${path}/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/js/datatables-simple-demo.js"></script>
    </body>
</html>