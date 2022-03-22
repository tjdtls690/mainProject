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
        <title>Saladit-md</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${path }/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<script>
	$(document).on('click','.btn.btn-dark.delete', function(){	
		var itemCode = $('.itemCode').attr('id');
		var tag = $('.tag').attr('id');
		if(confirm('상품을 삭제하시겠습니까?')) {
			$.ajax({
				url : 'mdItemDelete.mdo',
				type : 'post',
				data : {
					"itemCode" : itemCode,
					"tag" : tag
				},
				success : function(data){
					location.reload();
				}
			})
		}
	})
	
	function tagChange(e) {
		$('#item_name').empty();
		var tag = e.value;
		$.ajax({
			url : 'tagMain.mdo',
			type : 'post',
			dataType : 'html',
			data : {
				"tag" : tag
			},
			success : function(html){
				$('#item_name').append(html);				
			}
		})
	}
	
	$(document).on('click', '.btn.btn-primary', function(){
		var tag = $('#item_tag_main').val();
		var itemCode = $('#item_name').val();
		/* var itemName = $('#item_name').text(); */
		$.ajax({
			url : 'mdInsert.mdo',
			type : 'post',
			data : {
				"tag" : tag,
				"itemCode" : itemCode
				/* "itemName" : itemName */
			},
			success : function(data){
				location.reload();
			}
		})
	})
	
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
                        <h1 class="mt-4">MD추천</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">(MD Management)</li>
                        </ol>
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                MD List !
                                
                                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#myModal" data-toggle="modal" data-target="#exampleModalCenter" style="padding:0px 30px; float:right;">등록</button>
                                <div class="modal" id="myModal">
                                <!-- form -->
                                <form action = "mdInsert.mdo" method = "POST" enctype = "multipart/form-data" name="mdInsert">
								   <div class="modal-dialog">
								      <div class="modal-content">
								         <div class="modal-header">
								            <h5 class="modal-title">MD추천</h5>
								            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								         </div>
								         <div class="modal-body">
	           							<!-- table -->
	           							<table class = "table table-bordered dataTable" cellspacing = "0" >
	           								<tr>
												<th scope="row" width=70>
													main tag
												</th>
												<td width=150>
													<div class="row">
													  <div class="col">
													    <select onchange="tagChange(this)" class="form-select" id="item_tag_main" aria-label="Floating label select example" style="width:70%;" >
														    <option selected>---</option>
														    <option value="100">100</option>
														    <option value="200">200</option>
														    <option value="300">300</option>
														    <option value="400">400</option>
														    <option value="500">500</option>
														    <option value="600">600</option>
														    <option value="700">700</option>
														    <option value="800">800</option>
													  	</select>
													  </div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">
													item code
												</th>
												<td width=150>
													<div class="row">
													  <div class="col">
													    <select id="item_name" aria-label="Floating label select example" style="width:100%;">
														    <option selected>---</option>
													  	</select>
													  </div>
													</div>
												</td>
											</tr>
											<!-- <tr>
												<th scope="row">
													name
												</th>
												<td>
													<input type="text" id="item_name" value=""/>
												</td>
											</tr> -->
	           							</table>
	           							<!--// table -->
	           							
         							</div>
         						<div class="modal-footer">
         							<button type="button" class="btn btn-primary">등록</button>
         						</div>
         						
         						</div>
         						</div>
         						<!-- </div> -->
         						</form>
   							</div>
						</div>
                                
                            
                            <div class="card-body">
                                <table id="datatablesSimple" >
                                    <thead>
                                        <tr>
                                            <th>no.</th>
                                            <th>태그번호</th>
                                            <th>아이템코드</th>
                                            <th>상품이름</th>
                                            <th style="width:13%"></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>no.</th>
                                            <th>태그번호</th>
                                            <th>아이템코드</th>
                                            <th>상품이름</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="mdList" items="${mdList }" varStatus="i">
	                                        <tr>
	                                            <td>${mdList.md_code }</td>
	                                            <td class="tag" id="${mdList.item_tag_main }">${mdList.item_tag_main }</td>
	                                            <th class="itemCode" id="${mdList.item_code }">${mdList.item_code }</th>
	                                            <td>${itemName[i.index] }</td>
	                                            <td style="width:13%">
	                                            <button type="button" class="btn btn-dark">수정</button>
	                                            <button type="button" class="btn btn-dark delete">삭제</button>
	                                            </td>
	                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
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