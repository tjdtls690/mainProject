<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Saladit-pieChart</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="${path }/css/style.css?ver=1" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			var ctx = document.getElementById("myPieChart");
			var myPieChart = new Chart(ctx, {
			  type: 'pie',
			  data: {
			    labels: ["1.정기구독", "2.샐러드", "3.샌드위치/랩", "4.도시락/간편식" 
			    		,"5.죽/스프","6.세트상품","7.간식","8.음료"],
			    datasets: [{
// 			    	정기구독은 한개도 팔린게 없어서 값 10을 고정값으로 주었다..
			      data: [10,${tagMain0}, ${tagMain1}, ${tagMain2}, ${tagMain3},
			    	     ${tagMain4}, ${tagMain5}, ${tagMain6}],
			      backgroundColor: ['#F23D4C', 'orange', 'yellow', '#17BA75',
	    	  				'#2186C4','#00E3CC','#F2BBBB','#FFF6E6'],
			    }],
			  },
			});
			
// 태그 클릭시 차트/표 값 얻어오기			
			var check01 =0;
			$(document).on('click','.dropdown-item.month',function(){
				var getTagMain = $(this).attr('id');

				$.ajax({
	   				url : 'salesRank.mdo',
	   				type : 'post',
	   				dataType: 'html',
	   				data : {
	   					"getTagMain" : getTagMain
	   				},
	   				success:function(htmlOut){
						// 기존 hidden 인풋 삭제
	   					$("input[name='name']").remove();
	   					$("input[name='count']").remove();
	   					
	 					// 랭크 10위 데이터 추가.
	 					$('.table.table-striped').children().remove();
	   					$('.table.table-striped').append(htmlOut);
	   					
	   					$('.chartjs-size-monitor').detach();
	   					$("#myPieChart").detach();
	   					$("#myPieChart"+check01).detach();
	   					check01++;
	   				 	$('.card-body').eq(0).append('<canvas id="myPieChart'+check01+'" width="200%" height="50"></canvas>');
	   				 

						if(getTagMain !=1000){
		   					var size = $("input[name='name']").length;			
		   					var name = [];
		   					var count = [];
		   					
		   					for(var i =0; i<size; i++){
		   						name[i] = $("input[name='name']").eq(i).val();
		   						count[i] = $("input[name='count']").eq(i).val();
		   					}
							
		   					var ctx = document.getElementById("myPieChart"+check01);
		   					var myPieChart = new Chart(ctx, {
		   					  type: 'pie',
		   					  data: {
		   					    labels: [ name[0], name[1], name[2], name[3], name[4], 
		   					    	  	  name[5], name[6], name[7], name[8], name[9], 
		   					    	
		   					    ],
		   					    
		   					    datasets: [{
	//	   		 			    	정기구독은 한개도 팔린게 없어서 값 10을 고정값으로 주었다..
		   					      data: [ count[0], count[1], count[2], count[3], count[4], 
		   					    	  	  count[5], count[6], count[7], count[8], count[9], 
		   					    	  
		   					      ],
		   					      backgroundColor: ['#F23D4C', 'orange', 'yellow', '#17BA75',
		   					    	  				'#2186C4','#00E3CC','#F2BBBB','#FFF6E6','#002E6E','#944CF6'],
		   					    }],
		   					  },
		   					});
		   					
						}else{ // tagMain ==1000 일때
							//alert("1001");
							var size = $("input[name='tagMain']").length;			
		   					var tagMain = [];
		   					var count = [];
		   					
		   					for(var i =0; i<size; i++){
		   						tagMain[i] = $("input[name='tagMain']").eq(i).val();
		   						count[i] = $("input[name='count']").eq(i).val();
		   					}

		   					for(var i=0; i<size; i++){
		   						
		   						switch(tagMain[i]){
			   						case '100':
			   							tagMain[i]="1.정기구독";
			   							break;
			   						case '200':
			   							tagMain[i]="2.샐러드";
			   							break;
			   						case '300':
			   							tagMain[i]="3.샌드위치/랩";
			   							break;
			   						case '400':
			   							tagMain[i]="4.도시락/간편식";
			   							break;
			   						case '500':
			   							tagMain[i]="5.죽/스프";
			   							break;
			   						case '600':
			   							tagMain[i]="6.세트상품";
			   							break;
			   						case '700':
			   							tagMain[i]="7.간식";
			   							break;
			   						case '800':
			   							tagMain[i]="8.음료";
			   							break;
			   						default :
			   							tagMain[i]="?";
		   						}	
		   					}

							var ctx = document.getElementById("myPieChart"+check01);
		   					var myPieChart = new Chart(ctx, {
		   					  type: 'pie',
		   					  data: {
		   					    labels: [ "1.정기구독", tagMain[0], tagMain[1], tagMain[2], tagMain[3], tagMain[4], 
		   					    		  tagMain[5], tagMain[6] //tagMain[7] 
		   					    	
		   					    ],
		   					    
		   					    datasets: [{
	//	   		 			    	정기구독은 한개도 팔린게 없어서 값 10을 고정값으로 주었다..
		   					      data: [ "10",count[0], count[1], count[2], count[3], count[4], 
		   					    	  	  count[5], count[6]
		   					    	  
		   					      ],
		   					      backgroundColor: ['#F23D4C', 'orange', 'yellow', '#17BA75',
		  	    	  				'#2186C4','#00E3CC','#F2BBBB','#FFF6E6'],
		   					    }],
		   					  },
		   					});
						}
	   					
	   					
	   					
	   					
						if(getTagMain == 100){
							$('#text').text("정기구독 상위 TOP10 판매횟수 비교");
						}else if(getTagMain == 200){
	   						$('#text').text("샐러드 상위 TOP10 판매횟수 비교");
	   					}else if(getTagMain == 300){
	   						$('#text').text("샌드위치/랩 상위 TOP10 판매횟수 비교");
	   					}else if(getTagMain == 400){
	   						$('#text').text("도시락/간편식 상위 TOP10 판매횟수 비교");
	   					}else if(getTagMain == 500){
	   						$('#text').text("죽/스프 상위 TOP10 판매횟수 비교");
	   					}else if(getTagMain == 600){
	   						$('#text').text("세트상품 상위 TOP10 판매횟수 비교");
	   					}else if(getTagMain == 700){
	   						$('#text').text("간식 상위 TOP10 판매횟수 비교");
	   					}else if(getTagMain == 800){
	   						$('#text').text("음료 상위 TOP10 판매횟수 비교");
	   					}else if(getTagMain == 1000){
	   						$('#text').text("전체 판매비교 요약");
	   					}
 					
	   				} // success 끝
	   				
	   			})//ajax 끝
				
			})
			

	
		})

	</script>
</head>
    
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="adminMainChart.mdo">Saladit - admin</a>
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
                                	<a class="nav-link" href="adminItemList.mdo">조회/등록/수정</a>
                                </nav>
                            </div>
                            
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                주문/배송
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionOrders">
                                    <a class="nav-link" href="orderManagement.mdo">주문목록</a>
                                    <a class="nav-link" href="orderManagementDelivery.mdo">배송중</a>
                                    <a class="nav-link" href="orderManagementDeliveryComplete.mdo">배송완료</a>
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
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#UserCollapseAuth" aria-expanded="false" aria-controls="UserCollapseAuth">
                                    리뷰관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="UserCollapseAuth" aria-labelledby="headingFour-four" data-bs-parent="#sidenavAccordionUser">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="reviewListAdmin.mdo">답변대기</a>
                                            <a class="nav-link" href="reviewManagementAdmin.mdo">답변완료</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSales" aria-expanded="false" aria-controls="collapseSales">
							<div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div> 
							매출/상품통계관리
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseSales" aria-labelledby="headingFive" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionSales">
                                    <a class="nav-link" href="salesManagement.mdo">매출/상품통계</a>
                                    <a class="nav-link" href="pieChart.mdo">카테고리별 통계</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">매출 통계 비교</h1>
						<ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Charts</li>
                        </ol>
                        <div class="card mb-4">
                           <div class="card-header">
                                        <i class="fas fa-chart-pie me-1" ></i>
                                        <i id="text">전체 판매 비교 요약</i>
                                        <div class="dropdown" style="float:right;">
											<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
											    --tagMain--
											</button>
												<ul class="dropdown-menu month" aria-labelledby="dropdownMenu2">
												    <li><button class="dropdown-item month" type="button" id="1000">전체 요약 보기 </button></li>
												    <li><button class="dropdown-item month" type="button" id="100">100. 정기구독</button></li>
												    <li><button class="dropdown-item month" type="button" id="200">200. 샐러드</button></li>
												    <li><button class="dropdown-item month" type="button" id="300">300. 샌드위치/랩</button></li>
												    <li><button class="dropdown-item month" type="button" id="400">400. 도시락/간편식</button></li>
												    <li><button class="dropdown-item month" type="button" id="500">500. 죽/스프</button></li>
												    <li><button class="dropdown-item month" type="button" id="600">600. 세트상품</button></li>
												    <li><button class="dropdown-item month" type="button" id="700">700. 간식</button></li>
												    <li><button class="dropdown-item month" type="button" id="800">800. 음료</button></li>
											  	</ul>
										</div>
                            </div>
                                    
                                    <div class="card-body">
                                   		<canvas id="myPieChart" width="200%" height="50"></canvas>
                                    </div>
                                    <div class="card-footer small text-muted">※실제 판매 금액과는 약간 다를수 있습니다. 실제 판매 금액은 ""을 참고 해주세요</div>
                        </div>
                                                <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                판매금액 Best Top 10 !
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>랭크</th>
                                            <th>상품명</th>
                                            <th>판매 횟수</th>
											<th>총 판매 금액</th>                                         
                                        </tr>
                                    </thead>
                                    <tbody>
								        <c:forEach var="list" items="${list2 }" varStatus="status">
										    <tr>
										        <td>${status.count }위</td>
										        <td>
											       	<c:choose>
														<c:when test="${list.tagMain eq 100}"> 1.정기구독 </c:when>
														<c:when test="${list.tagMain eq 200}"> 2.샐러드 </c:when>
														<c:when test="${list.tagMain eq 300}"> 3.샌드위치/랩 </c:when>
														<c:when test="${list.tagMain eq 400}"> 4.도시락/간편식 </c:when>
														<c:when test="${list.tagMain eq 500}"> 5.죽/스프 </c:when>
														<c:when test="${list.tagMain eq 600}"> 6.세트상품 </c:when>
														<c:when test="${list.tagMain eq 700}"> 7.간식 </c:when>
														<c:when test="${list.tagMain eq 800}"> 8.음료 </c:when>	
													</c:choose>
										        </td>                      
										        <td>${list.count }</td>
										        <td><fmt:formatNumber value="${list.sum }" pattern="#,### 원" /></td>
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
<%--         <script src="${path }/assets/demo/chart-area-demo.js"></script> --%>
<%--         <script src="${path }/assets/demo/chart-bar-demo.js"></script> --%>
<%--         <script src="${path }/assets/demo/chart-pie-demo.js"></script> --%>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path }/js/datatables-simple-demo.js"></script>
    </body>
</html>