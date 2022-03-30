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
        <title>Saladit-banner</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="${path }/css/style.css?ver=1" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        

        <script type="text/javascript">
        	 $(function(){
        		$(document).on('click', '.btn.btn-outline-secondary', function(){
        			var count = $('.bannerID').length;
        			
        			if (count >= 5) {
        				alert("배너등록은 최대 5개까지만 가능합니다.");
        				location.href="bannerManagement.mdo";
        			}	

        		});
        	}); 
        	
//         	$('input:checkbox[name="point-check"]').prop("checked",true);
// 			$('input:checkbox[name="point-check"]').prop("checked",false);
			
			// 선택삭제 
			$(function (){
				$(document).on('click','.delete-button-i', function(){
					alert("클릭");
					var formData = $(this).children('#bannerId').val();
					alert(formData);
	
					$.ajax({
			    		url : 'bannerSelectDelete.do',
			    		dataType : 'json',
			    		type : 'post',
			    		data : {
			    			"deleteID" : formData
			    		},
			    		success : function(){
			    			alert("삭제되었습니다");
			   			},
			    		complete : function() {
			    			location.reload();
			    		}
					});
				});
			});
			
// 			$(function (){
// 				$(document).on('click','.btn.btn-primary.submit', function(){
// 					alert("modaljsp");
// // 					var url = $('.table.table-bordered.dataTable').children('#banner_url').innerHTML;
// // 					alert(url);
// 					var x = document.getElementById("banner_url").innerHTML;

// 					alert(x);

// 				});
// 			});
// 		$(function (){
// 		$(document).on('click','.btn.btn-primary.submit', function(){
// 			alert("modaljsp");
// // 					var url = $('.table.table-bordered.dataTable').children('#banner_url').innerHTML;
// // 					alert(url);
// 			var url = document.getElementById("banner_url").value;
// 			var name = document.getElementById("banner_name").value;
// 			var id = document.getElementById("banner_id").value;
// 			var content = document.getElementById("banner_content").value;
// 			var mobile = document.getElementById("banner_mobile").value;
			
			
// 			var fileupload = $("#uploadFileDesk");
// 			var files = fileupload[0].files;
			
// 			$.ajax({
// 				url : 'bannerInsert.mdo',
// 				type : 'post',
// 				datatype : 'html',
// 				data : {
// 					"url" : url,
// 					"name" : name,
// 					"id" : id,
// 					"content" : content,
// 					"mobile" : mobile,
// 					"files" : files
// 				},
// 				success : function(data){
// 					 alert("등록 성공");
// 					 location.href="bannerManagement.mdo";
// 				}
// 			});
// 		});
// 	});
		
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
                        <h1 class="mt-4">Banner</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">(Banner Management)</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Banner List !
                                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#myModal" data-toggle="modal" data-target="#exampleModalCenter" style="padding:0px 30px; float:right;">등록</button>
                                 <div class="modal" id="myModal">
								   <div class="modal-dialog modal-centered">
								      <div class="modal-content">
								         <div class="modal-header">
								            <h5 class="modal-title">Banner</h5>
								            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								         </div>
								         <div class="modal-body">
								           
	           						<form action = "admin_bannerInsert.mdo" method = "POST" enctype = "multipart/form-data">
	           							
	           							<table class = "table table-bordered dataTable" cellspacing = "0" >
	           						

											<tr>
												<th scope="row">
													DESK
												</th>
												<td>
													<input type="file" name="uploadFile" id="uploadFileDesk" />
												</td>
											</tr>
												<tr>
												<th scope="row">
													MOBILE
												</th>
												<td>
													<input type="file" name="uploadFile" id="uploadFileDesk" />
												</td>
											</tr>
											<tr>
												<th scope="row">
													NAME
												</th>
												<td>
													<input type="text" name="banner_name" id="banner_name" placeholder="배너 이름"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													ID
												</th>
												<td>
													<input type="text" name="banner_id" id="banner_id" placeholder="slide00"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													Banner Content
												</th>
												<td>
													<input type="text" name="banner_content" id="banner_content" placeholder="배너 내용"/>
												</td>
											</tr>
	           							</table>
	           						</form>
							         </div>
							         <div class="modal-footer">
							         <button type="submit" class="btn btn-primary submit" >Upload</button>
							         </div>
							         </div>
							         </div>
							         </div>
							   </div>
							                                
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>배너내용</th>
											<th>배너이미지(데스크탑)</th> 
											<th>배너이미지(모바일)</th> 
											<th>ID</th>
											<th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>이름</th>
                                            <th>배너내용</th>
											<th>배너이미지(데스크탑)</th> 
											<th>배너이미지(모바일)</th> 
											<th>ID</th>
											<th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="banner" items="${banner}">
                                        <tr>
                                            <td><input type="hidden" value="${banner.name}" id="bannerName" />${banner.name}</td>
                                            <td><input type="hidden" value="${banner.content }" id="bannerContent" />${banner.content }</td>
                                            <td><a href="${banner.image}"><input type="hidden" value="${banner.image }" id="bannerImage" />${banner.image }</a></td>
                                            <td><a href="${banner.mobile}"><input type="hidden" value="${banner.mobile }" id="bannerMobile" />${banner.mobile }</a></td>
                                            <td class="bannerID">${banner.id}</td>
                                            <td>
	                                            <button type="button" class="btn btn-dark delete">
	                                            	<i class="delete-button-i">
	                                            		<input type="hidden" value="${banner.id}" id="bannerId" />
	                                            		삭제
	                                            	</i>
	                                            </button>
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