<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path"
	value="${pageContext.request.contextPath}/resources/admin" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Saladit-review</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet" href="${path }/css/style.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$(document).on('click','.btn.btn-dark', function(){
		var seq = $(this).attr('id');
		var name = $(this).parent().siblings('td').eq(2).text();
		var content = $(this).parent().siblings('td').eq(6).text();
		var reply = $(this).parent().siblings('td').eq(7).text();
		$('#reviewSeq').val(seq);
		$('#user_name').val(name);
		$('#content').val(content);
		$('#reply_content').val(reply);
	})
});
</script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="adminMainChart.mdo">Saladit - admin</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="adminMainChart.mdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a> <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Admin
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="adminCouponTypeManagement.mdo">쿠폰관리</a>
								<a class="nav-link" href="userCouponManage.mdo">발급쿠폰관리</a> <a
									class="nav-link" href="mdInfo.mdo">MD추천관리</a> <a
									class="nav-link" href="bannerManagement.mdo">배너관리</a>
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
					<h1 class="mt-4">Review</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">(Review List)</li>
					</ol>

					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 답변완료

						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead style="padding:50%;">
									<tr>
										<th>no.</th>
										<th style="width:10%;">ID</th>
										<th>날짜</th>
										<th style="width:7%;">Main tag</th>
										<th style="width:7%;">Item
										code</th>
										<th>상품명</th>
										<th style="width:15%;">내용</th>
										<th>답글</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>no.</th>
										<th style="width:10%;">ID</th>
										<th>날짜</th>
										<th style="width:7%;">Main tag</th>
										<th style="width:7%;">Item
										code</th>
										<th>상품명</th>
										<th style="width:15%;">내용</th>
										<th>답글</th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="subReviewList" items="${subReviewList }"
										varStatus="i">
										<tr>
											<td>${subReviewList.seq }</td>
											<td style="width:10%;">${subReviewList.user_name }</td>
											<td>${subReviewList.write_date }</td>
											<td style="width:7%;">${subReviewList.subscribe_tag_main }</td>
											<td style="width:7%;">${subReviewList.subscribe_code }</td>
											<td>${subReviewList.subscribe_name }</td>
											<td style="width:15%;">${subReviewList.content }</td>
											<td>${subReplyList[i.index].replycontents }</td>
											<td>
												<button type="button" data-bs-toggle="modal"
													data-bs-target="#myModal" data-toggle="modal"
													id="${subReviewList.seq }"
													data-target="#exampleModalCenter" class="btn btn-dark">답변확인</button>
												<div class="modal" id="myModal">
													<!-- form -->
													<form action="replyInsertSuccess.mdo" method="POST"
														name="reply">
														<input type="hidden" name="seq" value="">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">답변확인</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal"></button>
																</div>
																<div class="modal-body">
																	<!-- table -->
																	<table class="table table-bordered dataTable"
																		cellspacing="0">
																		<tr>
																			<th scope="row" style="width: 15%;">리뷰번호</th>
																			<td><input type="text" name="reviewSeq"
																				id="reviewSeq" class="item_name" style="width: 40%;"
																				disabled /></td>
																		</tr>
																		<tr>
																			<th scope="row" style="width: 15%;">아이디</th>
																			<td><input type="text" name="user_name"
																				id="user_name" class="item_name" style="width: 40%;"
																				disabled /></td>
																		</tr>
																		<tr>
																			<th scope="row">내용</th>
																			<td colspan="3"><textarea name="content"
																					id="content" rows="10" style="width: 100%;"
																					disabled></textarea></td>
																		</tr>
																		<tr>
																			<th scope="row">답변</th>
																			<td colspan="3"><textarea name="reply_content"
																					id="reply_content" rows="7" style="width: 100%;"
																					disabled></textarea></td>
																		</tr>
																	</table>
																</div>
															</div>
														</div>
														<!-- </div> -->
													</form>
												</div>
											</td>
										</tr>
									</c:forEach>
									<c:forEach var="itemReviewList" items="${itemReviewList }"
										varStatus="i">
										<tr>
											<td>${itemReviewList.seq }</td>
											<td>${itemReviewList.user_name }</td>
											<td>${itemReviewList.write_date }</td>
											<td>${itemReviewList.item_tag_main }</td>
											<td>${itemReviewList.item_code }</td>
											<td>${itemReviewList.item_name }</td>
											<td>${itemReviewList.content }</td>
											<td>${itemReplyList[i.index].replycontents }</td>
											<td>
												<button type="button" data-bs-toggle="modal"
													data-bs-target="#myModal" data-toggle="modal"
													id="${itemReviewList.seq }"
													data-target="#exampleModalCenter" class="btn btn-dark">답변확인</button>
												<div class="modal" id="myModal">
													<!-- form -->
													<form action="replyInsertSuccess.mdo" method="POST"
														name="reply">
														<input type="hidden" name="seq" value="">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">답변확인</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal"></button>
																</div>
																<div class="modal-body">
																	<!-- table -->
																	<table class="table table-bordered dataTable"
																		cellspacing="0">
																		<tr>
																			<th scope="row" style="width: 15%;">리뷰번호</th>
																			<td><input type="text" name="reviewSeq"
																				id="reviewSeq" class="item_name" style="width: 40%;"
																				disabled /></td>
																		</tr>
																		<tr>
																			<th scope="row" style="width: 15%;">아이디</th>
																			<td><input type="text" name="user_name"
																				id="user_name" class="item_name" style="width: 40%;"
																				disabled /></td>
																		</tr>
																		<tr>
																			<th scope="row">내용</th>
																			<td colspan="3"><textarea name="content"
																					id="content" rows="10" style="width: 100%;"
																					disabled></textarea></td>
																		</tr>
																		<tr>
																			<th scope="row">답변</th>
																			<td colspan="3"><textarea name="reply_content"
																					id="reply_content" rows="7" style="width: 100%;"
																					disabled></textarea></td>
																		</tr>
																	</table>
																</div>
															</div>
														</div>
														<!-- </div> -->
													</form>
												</div>
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

</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="${path }/js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="${path }/assets/demo/chart-area-demo.js"></script>
<script src="${path }/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="${path }/js/datatables-simple-demo.js"></script>
</body>
</html>