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
        <title>Saladit-review</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${path }/css/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
                            
                        </div>
                    </div>
                </nav>
            </div>

			

			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">리뷰</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">(리뷰목록)</li>
                        </ol>
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                답변대기상태
                                <button type="button" class="btn btn-outline-secondary" style="padding:0px 30px; float:right;">삭제</button>
                               
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                       <tr>
                                       		<th>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</th>
                                            <th>no.</th>
                                            <th>아이디</th>
                                            <th>날짜</th>
											<th>메인태그</th>
                                            <th>서브태그</th>
                                            <th>아이템코드</th>
											<th>상품명</th>
											<th>내용</th>
											<th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</th>
                                            <th>no.</th>
                                            <th>아이디</th>
                                            <th>날짜</th>
											<th>메인태그</th>
                                            <th>서브태그</th>
                                            <th>아이템코드</th>
											<th>상품명</th>
											<th>내용</th>
											<th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                        	<td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>1</td>
                                            <td>asfg4321</td>
                                            <td>2021.01.15</td>
                                            <td>600</td>
                                            <td>602</td>
                                            <td>1</td>
                                            <td>아쉬파샐러드</td>
                                            <td>우웩</td>
                                            <th>
                                            <button type="button" data-bs-toggle="modal" data-bs-target="#myModal1" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-dark">답변등록</button>
                                            <div class="modal" id="myModal1">
                                    <form name="" action = "" enctype = "multipart/form-data">
								                      <div class="modal-dialog">
								                        <div class="modal-content" style="width:160%;">
								                          <div class="modal-header">
								                             <h5 class="modal-title">답변등록</h5>
								                              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								                          </div>
								                          <div class="modal-body">
														<table class="table table-striped" style="text-align:center;">
														<thead style="font-size:13px;">
					                                        
					                                    </thead>
					                                    <tbody style="font-size:12px;">
					                                       
					                                        </tbody>  
	           							                </table>
	           							            	</div>
	           						              
							                        	<div class="modal-footer">
							                        	<button type="button" onclick="location.href=''" class="btn btn-outline-success" style="float-left:-60px;">목록</button>
								                        <button type="button" onclick="location.href='#'" class="btn btn-outline-danger" >등록</button>
							                       		</div>
							                       	</div>
							                       </div>
							                </form>
							      	</div> <!-- modal -->
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 											<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
											</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <button type="button" class="btn btn-dark">답변등록</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </div>
                        </main>
                        </div>
                        
                    </div>
 
</body>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path }/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path }/assets/demo/chart-area-demo.js"></script>
        <script src="${path }/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path }/js/datatables-simple-demo.js"></script>
    </body>
</html>