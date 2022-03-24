<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<ul data-v-130d71ec="">
	<c:forEach var="list" items="${list }">
		<c:if test="${list.member_default_address == 'y' }">
			<li data-v-130d71ec="" class="except1"><div data-v-464718a6=""
					data-v-130d71ec="" class="item">
					<div data-v-464718a6="" class="row--v-center item__head">
						<div data-v-464718a6="" class="col name-wrap">
							<strong data-v-464718a6="" class="except1">${list.member_shipping_address }</strong>
						</div>
						<p data-v-464718a6="">
							<span data-v-7f86e76e="" data-v-464718a6=""
								class="round-text">기본 배송지</span>
						</p>
					</div>
					<p data-v-464718a6="" class="item__address">${list.member_address } ${list.member_detail_address }</p>
				</div>
				<input type="hidden" value="${list.member_zipcode_code }">
			</li>
		</c:if>
	</c:forEach>
	
	<c:forEach var="list" items="${list }">
		<c:if test="${list.member_default_address == 'n' }">
			<li data-v-130d71ec="" class="except1"><div data-v-464718a6=""
					data-v-130d71ec="" class="item">
					<div data-v-464718a6="" class="row--v-center item__head">
						<div data-v-464718a6="" class="col name-wrap">
							<strong data-v-464718a6="" class="except1">${list.member_shipping_address }</strong>
						</div>
						<!---->
					</div>
					<p data-v-464718a6="" class="item__address">${list.member_address } ${list.member_detail_address }</p>
					<nav data-v-464718a6="" class="row item__nav">
						<div data-v-464718a6="" class="main-destination-select-btn">
							<button data-v-a1c889e0="" data-v-464718a6="" type="button"
								title=""
								class="button button--side-padding button--size-small button--outline2 default-besongji">
								<span data-v-a1c889e0="" class="button__wrap">기본
									배송지로 설정</span>
							</button>
						</div>
					</nav>
				</div>
				<input type="hidden" value="${list.member_zipcode_code }">
			</li>
		</c:if>
	</c:forEach>
</ul>