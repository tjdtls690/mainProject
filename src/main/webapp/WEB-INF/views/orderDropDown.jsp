<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<ul data-v-5b7f52e9="" class="toggle-drop-down">
	<c:if test="${item.item_tag_main != 400 && item.item_tag_main != 700 && item.item_tag_main != 800}">
		<!---->
		<li data-v-5b7f52e9="" class="order-modal-select">
			<input type="hidden" value="${item.item_name }">
			<input type="hidden" value="m">
			<input type="hidden" value="${item.item_code }">
			<input type="hidden" value="${item.item_tag_main }">
			<input type="hidden" value="${item.item_price_m }">
			<div data-v-5b7f52e9="" class="detail-wrap">
				<div data-v-5b7f52e9="" class="detail-name-and-badge">
					<span data-v-5b7f52e9="">미디움 (M) </span>
					<!---->
					<span data-v-5b7f52e9="" class="detail-badge"></span>
				</div>
				<div data-v-5b7f52e9="" class="detail-price">
					<span data-v-5b7f52e9="">${item.item_price_m }원</span>
				</div>
			</div>
		</li>
		<!---->
		<c:if test="${not empty item.item_price_l }">
			<li data-v-5b7f52e9="" class="order-modal-select">
				<input type="hidden" value="${item.item_name }">
				<input type="hidden" value="l">
				<input type="hidden" value="${item.item_code }">
				<input type="hidden" value="${item.item_tag_main }">
				<input type="hidden" value="${item.item_price_l }">
				<div data-v-5b7f52e9="" class="detail-wrap">
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="">라지 (L) </span>
						<!---->
						<span data-v-5b7f52e9="" class="detail-badge"></span>
					</div>
					<div data-v-5b7f52e9="" class="detail-price">
						<span data-v-5b7f52e9="">${item.item_price_l }원</span>
					</div>
				</div>
			</li>
		</c:if>
	</c:if>
	<c:if test="${item.item_tag_main == 400 || item.item_tag_main == 700 || item.item_tag_main == 800}">
		<li data-v-5b7f52e9="" class="order-modal-select">
			<input type="hidden" value="${item.item_name }">
			<input type="hidden" value="m">
			<input type="hidden" value="${item.item_code }">
			<input type="hidden" value="${item.item_tag_main }">
			<input type="hidden" value="${item.item_price_m }">
			<div data-v-5b7f52e9="" class="detail-wrap">
				<div data-v-5b7f52e9="" class="detail-name-and-badge">
					<span data-v-5b7f52e9="">1개 </span>
					<!---->
					<span data-v-5b7f52e9="" class="detail-badge"></span>
				</div>
				<div data-v-5b7f52e9="" class="detail-price">
					<span data-v-5b7f52e9="">${item.item_price_m }원</span>
				</div>
			</div>
		</li>
		<!---->
		<c:if test="${not empty item.item_price_l }">
			<li data-v-5b7f52e9="" class="order-modal-select">
				<input type="hidden" value="${item.item_name }">
				<input type="hidden" value="l">
				<input type="hidden" value="${item.item_code }">
				<input type="hidden" value="${item.item_tag_main }">
				<input type="hidden" value="${item.item_price_l }">
				<div data-v-5b7f52e9="" class="detail-wrap">
					<div data-v-5b7f52e9="" class="detail-name-and-badge">
						<span data-v-5b7f52e9="">1묶음 </span>
						<!---->
						<span data-v-5b7f52e9="" class="detail-badge"></span>
					</div>
					<div data-v-5b7f52e9="" class="detail-price">
						<span data-v-5b7f52e9="">${item.item_price_l }원</span>
					</div>
				</div>
			</li>
		</c:if>
	</c:if>
</ul>