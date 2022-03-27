<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div data-v-09c23eb4="" data-v-3222e1c8="" class="modal-wrap">
	<div data-v-09c23eb4="" class="modal-content-wrap">
		<header data-v-09c23eb4="" class="modal-header">
			<div data-v-3222e1c8="" data-v-09c23eb4="" class="modal-header-slot"
				style="justify-content: flex-start;">
				<div data-v-3222e1c8="" data-v-09c23eb4=""
					class="modal-header-slot-close"></div>
				<div data-v-3222e1c8="" data-v-09c23eb4=""
					class="modal-header-slot-title"
					style="flex-basis: 100%; text-align: center;">정기배송 상품 선택</div>
			</div>
			<!---->
		</header>
		<main data-v-09c23eb4=""
			class="modal-content modal-content-height-full"
			style="overflow-y: auto;">
			<article data-v-3f3398e6="" data-v-3222e1c8="" class="add-items"
				data-v-09c23eb4="">
				<div data-v-3f3398e6="" class="add-items-body"
					style="opacity: 1; pointer-events: auto;">
					<!---->
					<section data-v-3f3398e6="" class="add-items-group">
						<div data-v-3f3398e6="" class="add-items-group-body">
							<ul data-v-3f3398e6="">
							
								<c:forEach var="list" items="${list }" varStatus="i">
									<c:if test="${list.subscribe_delivery_type_summary == deliveryType }">
										<li data-v-3f3398e6="" class="except1"><div data-v-3f3398e6=""
												class="add-items-group-body-contents">
												<div data-v-3f3398e6="" class="content-img-wrap">
													<img data-v-3f3398e6="" class="except1"
														src="${list.item_image }">
													<!---->
												</div>
												<div data-v-3f3398e6="" class="content-wrap">
													<div data-v-3f3398e6="" class="content-left">
														<p data-v-3f3398e6="" class="content-name">${list.item_name }</p>
														<div data-v-3f3398e6="" class="content-price-wrap">
															<p data-v-3f3398e6="" class="content-discounted-price">
																${list.item_price_m }원&nbsp;~&nbsp;</p>
															<c:if test="${!empty list.item_price_m_sub }">
																<p data-v-3f3398e6="" class="content-price">${list.item_price_m_sub }원</p>
															</c:if>
														</div>
														<!---->
													</div>
													<div data-v-3f3398e6="" class="content-right"
														style="text-align: right;">
														<button data-v-a1c889e0="" data-v-3f3398e6="" type="button"
															title=""
															class="button content-btn-wrap button--side-padding button--size-small button--outline2">
															<span data-v-a1c889e0="" class="button__wrap subscribe-select">선택</span>
														</button>
														<input type="hidden" value="${list.item_code }">
													</div>
												</div>
											</div>
										</li>
									</c:if>
								</c:forEach>
								
							</ul>
						</div>
					</section>
				</div>
				<!---->
			</article>
			<!---->
		</main>
		<footer data-v-09c23eb4="" class="modal-footer footer-none"></footer>
	</div>
</div>