<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<div data-v-bb8d8f74="" data-v-421abad8=""
	class="row--v-center row--h-between mypage-destination__body-head">
	<c:if test="${list[0].member_delivery_type == 0 }">
		<strong data-v-bb8d8f74="" data-v-421abad8="">내 새벽배송지 ${fn:length(list)}개</strong>
	</c:if>
	<c:if test="${list[0].member_delivery_type == 1 }">
		<strong data-v-bb8d8f74="" data-v-421abad8="">내 택배배송지 ${fn:length(list)}개</strong>
	</c:if>
	<div data-v-bb8d8f74="" data-v-421abad8=""
		class="address-index__nav">
		<button data-v-a1c889e0="" data-v-bb8d8f74="" type="button"
			title=""
			class="button button--size-small button--outline2"
			data-v-421abad8="">
			<span data-v-a1c889e0="" class="button__wrap button1">+ 배송지
				추가</span>
		</button>
	</div>
</div>
<div data-v-bb8d8f74="" data-v-421abad8=""
	class="mypage-destination__index">
	<c:if test="${fn:length(list) > 0}">
		<ul data-v-bb8d8f74="" data-v-421abad8="">
		
			<c:forEach var="list" items="${list }">
				<c:if test="${list.member_default_address == 'y' }">
					<li data-v-bb8d8f74="" data-v-421abad8=""><div
							data-v-bb8d8f74="" data-v-421abad8=""
							class="mypage-destination-item">
							<div data-v-bb8d8f74="" data-v-421abad8=""
								class="mypage-destination-item__body">
								<div data-v-bb8d8f74="" data-v-421abad8=""
									class="row--v-center mypage-destination-item__header">
									<div data-v-bb8d8f74="" data-v-421abad8="" class="col">
										<strong data-v-bb8d8f74="" data-v-421abad8="">${list.member_shipping_address }</strong>
									</div>
									<div data-v-bb8d8f74="" data-v-421abad8="">
										<span data-v-7f86e76e="" data-v-bb8d8f74=""
											class="round-text" data-v-421abad8="">기본 배송지</span>
									</div>
								</div>
								<p data-v-bb8d8f74="" data-v-421abad8=""
									class="mypage-destination-item__description">${list.member_address } ${list.member_detail_address }</p>
							</div>
							<nav data-v-bb8d8f74="" data-v-421abad8=""
								class="row--h-start mypage-destination-item__nav">
								<!---->
								<div data-v-bb8d8f74="" data-v-421abad8="">
									<button data-v-a1c889e0="" data-v-bb8d8f74=""
										type="button" title=""
										class="button button button--side-padding button--size-small button--color-gray button--outline"
										data-v-421abad8="">
										<span data-v-a1c889e0="" class="button__wrap zip-delete-button">
											삭제 </span>
									</button>
								</div>
							</nav>
						</div>
						<input type="hidden" value="${list.member_zipcode_code }">
					</li>
				</c:if>
			</c:forEach>
			
			<c:forEach var="list" items="${list }">
				<c:if test="${list.member_default_address == 'n' }">
					<li data-v-bb8d8f74="" data-v-421abad8=""><div
							data-v-bb8d8f74="" data-v-421abad8=""
							class="mypage-destination-item">
							<div data-v-bb8d8f74="" data-v-421abad8=""
								class="mypage-destination-item__body">
								<div data-v-bb8d8f74="" data-v-421abad8=""
									class="row--v-center mypage-destination-item__header">
									<div data-v-bb8d8f74="" data-v-421abad8="" class="col">
										<strong data-v-bb8d8f74="" data-v-421abad8="">${list.member_shipping_address }</strong>
									</div>
									<!---->
								</div>
								<p data-v-bb8d8f74="" data-v-421abad8=""
									class="mypage-destination-item__description">${list.member_address } ${list.member_detail_address }</p>
							</div>
							<nav data-v-bb8d8f74="" data-v-421abad8=""
								class="row--h-start mypage-destination-item__nav">
								<div data-v-bb8d8f74="" data-v-421abad8="">
									<button data-v-a1c889e0="" data-v-bb8d8f74=""
										type="button" title=""
										class="button button button--side-padding button--size-small button--color-gray button--outline"
										data-v-421abad8="">
										<span data-v-a1c889e0="" class="button__wrap zip-default-check-button">
											기본 배송지 설정 </span>
									</button>
								</div>
								<div data-v-bb8d8f74="" data-v-421abad8="">
									<button data-v-a1c889e0="" data-v-bb8d8f74=""
										type="button" title=""
										class="button button button--side-padding button--size-small button--color-gray button--outline"
										data-v-421abad8="">
										<span data-v-a1c889e0="" class="button__wrap zip-delete-button">
											삭제 </span>
									</button>
								</div>
							</nav>
						</div>
						<input type="hidden" value="${list.member_zipcode_code }">
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${fn:length(list) == 0}">
		<div data-v-6b53621a="" data-v-bb8d8f74=""
			class="error-list" data-v-421abad8="">
			<p data-v-6b53621a="">등록된 배송지가 없습니다.</p>
		</div>
	</c:if>
</div>
<div data-v-20ad18c6="" data-v-bb8d8f74=""
	class="nav-paginate-wrap destination__paginate"
	data-v-421abad8="">
	<div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
		<nav data-v-43f58a9c="" data-v-20ad18c6=""
			class="nav-paginate">
			<a data-v-43f58a9c="" href="#"
				class="nav-paginate__dir nav-paginate-dir-prev"
				style="opacity: 0.2;"><img data-v-43f58a9c=""
				src="/images/arrow-left@2x.png" alt="이전 페이지"
				class="nav-arrow arrow-left"></a> <strong
				data-v-43f58a9c="">1</strong> <a data-v-43f58a9c=""
				href="#" class="nav-paginate__dir nav-paginate-dir-next"
				style="opacity: 1;"><img data-v-43f58a9c=""
				src="/images/arrow-right@2x.png" alt="다음 페이지"
				class="nav-arrow arrow-right"></a>
		</nav>
	</div>
	<div data-v-20ad18c6="" class="nav-paginate-wrap__desktop">
		<nav data-v-43f58a9c="" data-v-20ad18c6=""
			class="nav-paginate">
			<a data-v-43f58a9c="" href="#"
				class="nav-paginate__dir nav-paginate-dir-prev"
				style="opacity: 0.2;"><img data-v-43f58a9c=""
				src="/images/arrow-left@2x.png" alt="이전 페이지"
				class="nav-arrow arrow-left"></a> <strong
				data-v-43f58a9c="">1</strong> <a data-v-43f58a9c=""
				href="#" class="nav-paginate__dir nav-paginate-dir-next"
				style="opacity: 1;"><img data-v-43f58a9c=""
				src="/images/arrow-right@2x.png" alt="다음 페이지"
				class="nav-arrow arrow-right"></a>
		</nav>
	</div>
</div>