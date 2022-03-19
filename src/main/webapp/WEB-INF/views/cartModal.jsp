<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${tagMain != 800 and tagMain != 700 }">
	<section data-v-1b66704d="" data-v-41bdc0f6="" id="cart-modal" class="cart-modal js-cart-modal">
		<div data-v-1b66704d="" class="cart-modal-wrap">
			<header data-v-1b66704d="" class="cart-modal-header">
				${item.item_name }
			</header>
			<section data-v-1b66704d="" class="cart-modal-main">
				<ul data-v-1b66704d="" class="details-list">
					<li data-v-1b66704d="" class="detail-item">
						<input type="hidden" name="itemCode " value="${item.item_code}">
						<input type="hidden" name="tagMain" value="${item.item_tag_main }">
						<input type="hidden" name="price" value="${item.item_price_m }">
						<input type="hidden" name="priceSub" value="${item.item_price_m_sub }">
						<input type="hidden" name="itemName" value="${item.item_name }">
						<input type="hidden" name="itemImage" value="${item.item_image }">
						<input type="hidden" name="tagSub" value="${item.item_tag_sub }">
						
						<div data-v-1b66704d="" class="detail-left">
							<div data-v-1b66704d="" class="detail-name" id="미디움">미디움 (M)</div>
							<div data-v-1b66704d="" class="detail-price">${item.item_price_m }원</div>
						</div>
						<div data-v-1b66704d="" class="detail-right">
							<div data-v-1b66704d="" class="spinner-wrap">
								<nav data-v-4ba0dee4="" data-v-1b66704d="" class="form-number spinner">
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="minus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M7 11.5h10v1H7z">
												</path>
											</g>
										</svg>
									</button>
									<span data-v-4ba0dee4="" class="form-number__input">
										<input data-v-4ba0dee4="" id="3799" type="number" min="0" max="9999" step="1" value="0">
									</span>
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="plus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z">
												</path>
											</g>
										</svg>
									</button>
								</nav>
							</div>
						</div>
					</li>
	<!-- 미디움 사이즈가 있을시에 리스트를 하나 더 추가 -->
					<c:if test="${ not empty item.item_price_l  }">
					<li data-v-1b66704d="" class="detail-item">
						<input type="hidden" name="itemCode " value="${item.item_code}">
						<input type="hidden" name="tagMain" value="${item.item_tag_main }">
						<input type="hidden" name="price" value="${item.item_price_l }">
						<input type="hidden" name="priceSub" value="${item.item_price_l_sub }">
						<input type="hidden" name="itemName" value="${item.item_name }">
						<input type="hidden" name="itemImage" value="${item.item_image }">
						<input type="hidden" name="tagSub" value="${item.item_tag_sub }">
						<div data-v-1b66704d="" class="detail-left">
							<div data-v-1b66704d="" class="detail-name" id="라지">라지 (L)</div>
							<div data-v-1b66704d="" class="detail-price">${item.item_price_l }원</div>
						</div>
						<div data-v-1b66704d="" class="detail-right">
							<div data-v-1b66704d="" class="spinner-wrap">
								<nav data-v-4ba0dee4="" data-v-1b66704d="" class="form-number spinner">
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="minus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M7 11.5h10v1H7z">
												</path>
											</g>
										</svg>
									</button>
									<span data-v-4ba0dee4="" class="form-number__input">
										<input data-v-4ba0dee4="" id="3799" type="number" min="0" max="9999" step="1" value="0">
									</span>
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="plus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z">
												</path>
											</g>
										</svg>
									</button>
								</nav>
							</div>
						</div>
					</li>	
					</c:if>			
				</ul>
			</section>
			<footer data-v-1b66704d="" class="cart-modal-footer">
				<section data-v-1b66704d="" class="price-wrap">
					<div data-v-1b66704d="" class="price-left">총 상품 금액</div>
					<div data-v-1b66704d="" class="price-right">0원</div>
				</section>
				<section data-v-1b66704d="" class="btns-wrap">
					<div data-v-1b66704d="" class="btn-wrap">
						<button data-v-a1c889e0="" data-v-1b66704d="" type="button" title="" class="button cancel-btn button--outline2">
							<span data-v-a1c889e0="" class="button__wrap">
								취소
							</span>
						</button>
					</div>
					<div data-v-1b66704d="" class="btn-wrap">
						<button data-v-a1c889e0="" data-v-1b66704d="" type="button" title="" disabled="disabled" class="button cart-btn button--disabled" id="mobCart">
							<span data-v-a1c889e0="" class="button__wrap">
								장바구니 담기
							</span>
						</button>
					</div>
				</section>
			</footer>
		</div>
	</section>
</c:if>
<c:if test="${tagMain == 700 or tagMain == 800 }">
	<section data-v-1b66704d="" data-v-41bdc0f6="" id="cart-modal" class="cart-modal js-cart-modal">
		<div data-v-1b66704d="" class="cart-modal-wrap">
			<header data-v-1b66704d="" class="cart-modal-header">
				${item.item_name }
			</header>
			<section data-v-1b66704d="" class="cart-modal-main">
				<ul data-v-1b66704d="" class="details-list">
					<li data-v-1b66704d="" class="detail-item">
						<input type="hidden" name="itemCode " value="${item.item_code}">
						<input type="hidden" name="tagMain" value="${item.item_tag_main }">
						<input type="hidden" name="price" value="${item.item_price_m }">
						<input type="hidden" name="priceSub" value="${item.item_price_m_sub }">
						<input type="hidden" name="itemName" value="${item.item_name }">
						<input type="hidden" name="itemImage" value="${item.item_image }">
						<input type="hidden" name="tagSub" value="${item.item_tag_sub }">
						<div data-v-1b66704d="" class="detail-left">
							<div data-v-1b66704d="" class="detail-name" id="미디움">1ea</div>
							<div data-v-1b66704d="" class="detail-price">${item.item_price_m }원</div>
						</div>
						<div data-v-1b66704d="" class="detail-right">
							<div data-v-1b66704d="" class="spinner-wrap">
								<nav data-v-4ba0dee4="" data-v-1b66704d="" class="form-number spinner">
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="minus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M7 11.5h10v1H7z">
												</path>
											</g>
										</svg>
									</button>
									<span data-v-4ba0dee4="" class="form-number__input">
										<input data-v-4ba0dee4="" id="3799" type="number" min="0" max="9999" step="1" value="0">
									</span>
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="plus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z">
												</path>
											</g>
										</svg>
									</button>
								</nav>
							</div>
						</div>
					</li>
	<!-- 미디움 사이즈가 있을시에 리스트를 하나 더 추가 -->
					<c:if test="${ not empty item.item_price_l  }">
					<li data-v-1b66704d="" class="detail-item">
						<input type="hidden" name="itemCode " value="${item.item_code}">
						<input type="hidden" name="tagMain" value="${item.item_tag_main }">
						<input type="hidden" name="price" value="${item.item_price_m }">
						<input type="hidden" name="priceSub" value="${item.item_price_m_sub }">
						<input type="hidden" name="itemName" value="${item.item_name }">
						<input type="hidden" name="itemImage" value="${item.item_image }">
						<input type="hidden" name="tagSub" value="${item.item_tag_sub }">
						<div data-v-1b66704d="" class="detail-left">
							<div data-v-1b66704d="" class="detail-name" id="라지">1box</div>
							<div data-v-1b66704d="" class="detail-price">${item.item_price_l }원</div>
						</div>
						<div data-v-1b66704d="" class="detail-right">
							<div data-v-1b66704d="" class="spinner-wrap">
								<nav data-v-4ba0dee4="" data-v-1b66704d="" class="form-number spinner">
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="minus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M7 11.5h10v1H7z">
												</path>
											</g>
										</svg>
									</button>
									<span data-v-4ba0dee4="" class="form-number__input">
										<input data-v-4ba0dee4="" id="3799" type="number" min="0" max="9999" step="1" value="0">
									</span>
									<button data-v-4ba0dee4="" type="button" class="form-number__control" id="plus-button">
										<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
												<path data-v-4ba0dee4="" fill="currentColor" d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z">
												</path>
											</g>
										</svg>
									</button>
								</nav>
							</div>
						</div>
					</li>	
					</c:if>			
				</ul>
			</section>
			<footer data-v-1b66704d="" class="cart-modal-footer">
				<section data-v-1b66704d="" class="price-wrap">
					<div data-v-1b66704d="" class="price-left">총 상품 금액</div>
					<div data-v-1b66704d="" class="price-right">0원</div>
				</section>
				<section data-v-1b66704d="" class="btns-wrap">
					<div data-v-1b66704d="" class="btn-wrap">
						<button data-v-a1c889e0="" data-v-1b66704d="" type="button" title="" class="button cancel-btn button--outline2">
							<span data-v-a1c889e0="" class="button__wrap">
								취소
							</span>
						</button>
					</div>
					<div data-v-1b66704d="" class="btn-wrap">
						<button data-v-a1c889e0="" data-v-1b66704d="" type="button" title="" disabled="disabled" class="button cart-btn button--disabled" id="mobCart">
							<span data-v-a1c889e0="" class="button__wrap">
								장바구니 담기
							</span>
						</button>
					</div>
				</section>
			</footer>
		</div>
	</section>
</c:if>
