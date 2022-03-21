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
        <title>Saladit-order</title>
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
                                    <a class="nav-link" href="상품목록.html">조회/등록/수정</a>
                                    <!-- <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a> -->
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
                    <!--<div class="container-fluid px-4">
                        <h1 class="mt-4">상품등록</h1>
                         
                        <div class="card mb-4">
                             <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                     
                            </div> -->
                            <div class = "card shadow mb-4">
           			<!-- banner Title -->
           			<div class = "card-header py-3">
	           			<h3 class = "m-0 font-weight-bold text-primay" style = "margin-top : 20px;">상품등록</h3>
	           		</div>
	           		<!--// banner Title -->
	           		
	           		<div class = "card-body">
	           			<div class = "table-responsive">
	           				<div class = "row">
	           					<div class = "col-sm-12">
	           						
	           						<!-- form -->
	           						<form action = "admin_bannerInsert.mdo" method = "POST" enctype = "multipart/form-data">
	           							
	           							<!-- table -->
	           							<table class = "table table-bordered dataTable" cellspacing = "0" >
	           						
	           								<tr>
												<th scope="row" style="width:15%;">
													카테고리
												</th>
												<td colspan="3" style="width:35%;">
													<div class="row">
													  <div class="col" style = "margin-right : -60%;">
													    <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
													    <option selected>main</option>
													    <option value="1">100</option>
													    <option value="2">200</option>
													    <option value="3">300</option>
													    <option value="3">400</option>
													    <option value="3">500</option>
													    <option value="3">600</option>
													    <option value="3">700</option>
													  </select>
													  </div>
													  <div class="col" >
													    <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
													    <option selected>sub</option>
													    <option value="1">101</option>
													    <option value="2">102</option>
													    <option value="3">103</option>
													  </select>
													  </div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">
													상품명
												</th>
												<td>
													<input type="text" name="banner_contents" style="width:80%;"/>
												</td>
													<th scope="row" style="width:15%;">
													초코베리머치
													</th>
													<td>
														<div class="form-check" style="float:left; margin-right:30%">
														  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
														  <label class="form-check-label" for="flexRadioDefault1">
														    Y
														  </label>
														</div>
														<div class="form-check">
														  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
														  <label class="form-check-label" for="flexRadioDefault1">
														    N
														  </label>
														</div>
													</td>
											</tr>
											<tr>
												<th scope="row">
													상품 메인 이미지
												</th>
												<td colspan="3">
													<input type="file" name="uploadFile" />
												</td>
											</tr>
											<tr>
												<th scope="row">
													상품요약정보
												</th>
												<td colspan="3">
													<input type="text" name="banner_contents" style="width:70%;"/>
													
												</td>
											</tr>
											<tr>
												<th scope="row">
													상품설명
												</th>
												<td colspan="3">
													<textarea name="banner_subcontents" style="width:70%;"></textarea>
												</td>
											</tr>
											
	           								<tr>
												<th scope="row">
													영양정보
												</th>
												<td colspan="3">
													<table class = "table table-bordered dataTable" cellspacing = "0" style="font-size:14px;">
				           								<tr>
															<th scope="row">
																영양정보
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
																
															</td>
														</tr>
														<tr>
															<th scope="row">
																총 내용량 당
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																나트륨
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																탄수화물
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																당류
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
				           								<tr>
															<th scope="row">
																지방
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																트랜스지방
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																포화지방
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																콜레스테롤
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																단백질
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
				           							</table>
				           						</td>
				           					</tr>
	           							
											<tr>
												<th scope="row">
													상품정보
												</th>
												<td colspan="3">
													<table class = "table table-bordered dataTable" cellspacing = "0" style="font-size:14px;">
				           								<tr>
															<th scope="row" style="width:35%;">
																내용량
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
																
															</td>
														</tr>
														<tr>
															<th scope="row">
																식품의 유형
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																원재료 및 함량
															</th>
															<td>
																<textarea name="banner_subcontents" style="width:54%;"></textarea>
															</td>
														</tr>
														<tr>
															<th scope="row">
																영양정보
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																알레르기 물질 함유
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
				           								<tr>
															<th scope="row">
																유통기한
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																포장재질
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																업소명 및 소재지
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																보관방법
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																소비자 상담실
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																반품 및 교환장소
															</th>
															<td>
																<input type="text" name="banner_contents" style="width:54%;"/>
															</td>
														</tr>
														<tr>
															<th scope="row">
																주의사항
															</th>
															<td>
																<textarea name="banner_subcontents" style="width:54%;"></textarea>
															</td>
														</tr>
				           							</table>
												</td>
											</tr>
											<tr>
												<th scope="row">
													m가격
												</th>
												<td>
													<input type="text" name="banner_contents"/>
												</td>
												<th scope="row" style="width:15%;">
												m할인가격
												</th>
												<td>
													<input type="text" name="banner_contents"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													L가격
												</th>
												<td>
													<input type="text" name="banner_contents"/>
												</td>
												<th scope="row" style="width:15%;">
												L할인가격
												</th>
												<td>
													<input type="text" name="banner_contents"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													이미지
												</th>
												<td colspan="3">
													<input type="file" name="uploadFile" />
												</td>
											</tr>
											<tr>
												<th scope="row">
													상세 정보 이미지
												</th>
												<td colspan="3">
													<input type="file" name="uploadFile" />
												</td>
											</tr>
	           							</table>
	           							
	           							<!--// table -->
	           							
	           							<!-- button -->
				           				<button type = "reset" class="btn btn-success" value = "초기화하기" style = "float:right;">등록</button>
	           							<!—// button —>
	           							
	           						</form>
	           						<!—// form —>
	           						
	           					</div>
	           				</div>
	           			</div>
	           		</div>
           		</div>
                           
     			</main>
			</div>
          </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path }/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path }/assets/demo/chart-area-demo.js"></script>
        <script src="${path }/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path }/js/datatables-simple-demo.js"></script>
    </body>
</html>