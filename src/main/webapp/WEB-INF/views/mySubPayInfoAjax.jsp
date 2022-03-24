<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:if test="${check > 0}">
	<c:forEach var="list1" items="${list1 }" varStatus="i">
		<c:if test="${list3[i.index].item_tag_main == 100 }">
			<ul data-v-2e392260="" data-v-421abad8="" class="orders__body">
				<li data-v-2e392260="" data-v-421abad8=""><div
						data-v-72acf1f8="" data-v-2e392260="" class="orders-item"
						data-v-421abad8="">
						<div data-v-72acf1f8="" class="orders-item__wrap">
							<figure data-v-72acf1f8="" class="orders-item__image">
								<!-- ${list1.payment_code} 이용해서 자바스크립트 함수 통해 주문상세보기 페이지로 이동 , todo -->
								<!-- 쿠폰 갯수, 포인트 가지고 와야함. 배송예정은 0 고정 -->
								<a data-v-72acf1f8="" href='javascript:void(0);'
									onclick="payDetailInfoPage(${list1.payment_code});" class=""><i
									data-v-72acf1f8=""
									style="background-image: url(&quot;${list3[i.index].item_image}&quot;);"></i></a>
							</figure>
							<div data-v-72acf1f8="" class="orders-item__top">
								<div data-v-72acf1f8="" class="row--v-center">
									<span data-v-72acf1f8=""
										style="font-family: Roboto, sans-serif;">${list1.payment_date}</span>
									<div data-v-72acf1f8="" class="row--v-center">
										<c:if test="${list1.payment_delivery_type == 0}">
											<span data-v-7f86e76e="" data-v-72acf1f8=""
												class="round-text round-text--color-morning"> 새벽배송 </span>
										</c:if>
										<c:if test="${list1.payment_delivery_type == 1}">
											<span data-v-7f86e76e="" data-v-72acf1f8=""
												class="round-text round-text--color-parcel"> 택배배송 </span>
										</c:if>
										<!---->
									</div>
								</div>
								<a data-v-72acf1f8="" href='javascript:void(0);'
									onclick="payDetailInfoPage(${list1.payment_code});"
									class="row--v-center"><span data-v-72acf1f8="">주문상세보기</span>
									<svg data-v-72acf1f8="" xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24"
										aria-labelledby="arrow-right-1" role="presentation"
										class="icon">
																				<g fill="none" fill-rule="evenodd"> <path
											stroke="currentColor" stroke-linecap="round"
											stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path></g></svg></a>
							</div>
							<div data-v-72acf1f8="" class="order-item-contents-container">
								<div data-v-72acf1f8="" class="order-item-contents-wrapper">
									<a data-v-72acf1f8="" href='javascript:void(0);'
										onclick="payDetailInfoPage(${list1.payment_code});"
										class="orders-item__head"><strong data-v-72acf1f8="">
											<c:if test="${fn:length(list2[i.index]) > 1}">
																					${list2[i.index][0].payment_item_mapping_item_name_size } ${list2[i.index][0].payment_item_mapping_item_quantity }개 외 ${(fn:length(list2[i.index]) - 1)}개
																				</c:if> <c:if test="${fn:length(list2[i.index]) == 1}">
																					${list2[i.index][0].payment_item_mapping_item_name_size } ${list2[i.index][0].payment_item_mapping_item_quantity }개
																				</c:if>
									</strong> <span data-v-72acf1f8=""
										class="orders-item__info-price only-desktop"><em
											data-v-72acf1f8=""><fmt:formatNumber
													value="${list1.payment_final_price }" pattern="#,###" /></em>원</span></a>
									<div data-v-72acf1f8=""
										class="order-item-complete-text-container">
										<div data-v-72acf1f8="" class="complete-order-text-wrapper">
											<span data-v-72acf1f8=""
												class="complete-order-text only-desktop complete">배송완료</span>
										</div>
									</div>
								</div>
								<div data-v-72acf1f8="" class="orders-item__info only-mobile">
									<span data-v-72acf1f8="" class="orders-item__info-price"><em
										data-v-72acf1f8=""><fmt:formatNumber
												value="${list1.payment_final_price }" pattern="#,###" /></em>원</span>
									<div data-v-72acf1f8="">
										<div data-v-72acf1f8=""
											class="order-item-complete-text-container">
											<div data-v-72acf1f8="" class="complete-order-text-wrapper">
												<span data-v-72acf1f8="" class="complete-order-text complete">배송완료</span>
												<!---->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!---->
					</div>
				</li>
			</ul>
		</c:if>
	</c:forEach>


	<!---->
	<div data-v-20ad18c6="" data-v-2e392260="" class="nav-paginate-wrap"
		data-v-421abad8="">
		<div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
			<nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
				<a data-v-43f58a9c="" href="#"
					class="nav-paginate__dir nav-paginate-dir-prev"
					style="opacity: 0.2;"><img data-v-43f58a9c=""
					src="/images/arrow-left@2x.png" alt="이전 페이지"
					class="nav-arrow arrow-left"></a> <strong data-v-43f58a9c="">1</strong>
				<a data-v-43f58a9c="" href="#"
					class="nav-paginate__dir nav-paginate-dir-next"
					style="opacity: 0.2;"><img data-v-43f58a9c=""
					src="/images/arrow-right@2x.png" alt="다음 페이지"
					class="nav-arrow arrow-right"></a>
			</nav>
		</div>
		<div data-v-20ad18c6="" class="nav-paginate-wrap__desktop">
			<nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
				<a data-v-43f58a9c="" href="#"
					class="nav-paginate__dir nav-paginate-dir-prev"
					style="opacity: 0.2;"><img data-v-43f58a9c=""
					src="/images/arrow-left@2x.png" alt="이전 페이지"
					class="nav-arrow arrow-left"></a> <strong data-v-43f58a9c="">1</strong>
				<a data-v-43f58a9c="" href="#"
					class="nav-paginate__dir nav-paginate-dir-next"
					style="opacity: 0.2;"><img data-v-43f58a9c=""
					src="/images/arrow-right@2x.png" alt="다음 페이지"
					class="nav-arrow arrow-right"></a>
			</nav>
		</div>
	</div>
</c:if>

<c:if test="${check == 0}">
	<div data-v-6b53621a="" data-v-2e392260="" class="error-list"
		data-v-421abad8="">
		<p data-v-6b53621a="">주문/결제 내역이 없습니다.</p>
	</div>
</c:if>