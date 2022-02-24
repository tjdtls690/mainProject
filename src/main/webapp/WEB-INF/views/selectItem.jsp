<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 'L' 사이즈 없는 단품 -->
<c:if test="${empty detail.item_price_l}">
		<li data-v-5b7f52e9="">
			<div data-v-5b7f52e9="" class="detail-wrap">
				<div data-v-5b7f52e9="" class="detail-name-and-badge">
					<span data-v-5b7f52e9="">미디움 (M) 
					</span> <!----> <span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span>
				</div> 
				<div data-v-5b7f52e9="" class="detail-price">
					<c:if test="${ not empty detail.item_price_m_sub }">
						<span data-v-5b7f52e9="" class="discount-price">${detail.item_price_m_sub }원</span>
					</c:if> 
					<span data-v-5b7f52e9="">${detail.item_price_m }원</span>
				</div>
			</div>
		</li>
</c:if>
<!--  'L' 사이즈 포함하는 단품 -->
<c:if test="${not empty detail.item_price_l}">
		<li data-v-5b7f52e9="">
			<div data-v-5b7f52e9="" class="detail-wrap">
				<div data-v-5b7f52e9="" class="detail-name-and-badge">
					<span data-v-5b7f52e9="">미디움 (M) 
					</span> <!----> <span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span>
				</div> 
				<div data-v-5b7f52e9="" class="detail-price">
					<c:if test="${ not empty detail.item_price_m_sub}">
						<span data-v-5b7f52e9="" class="discount-price">${detail.item_price_m_sub }원</span>
					</c:if> 
					<span data-v-5b7f52e9="">${detail.item_price_m }원</span>
				</div>
			</div>
		</li>
		<li data-v-5b7f52e9="">
			<div data-v-5b7f52e9="" class="detail-wrap">
				<div data-v-5b7f52e9="" class="detail-name-and-badge">
					<span data-v-5b7f52e9="">라지 (L) 
					</span> <!----> <span data-v-5b7f52e9="" class="detail-badge">(굿바일 7% 할인)</span>
				</div> 
				<div data-v-5b7f52e9="" class="detail-price">
					<c:if test="${ not empty detail.item_price_l_sub}">
						<span data-v-5b7f52e9="" class="discount-price">${detail.item_price_l_sub }원</span>
					</c:if> 
					<span data-v-5b7f52e9="">${detail.item_price_l }원</span>
				</div>
			</div>
		</li>
</c:if>