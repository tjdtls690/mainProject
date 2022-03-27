<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<article data-v-067cf1c4="" data-v-3222e1c8="" class="add-items"
	data-v-09c23eb4="">
	<div data-v-067cf1c4="" class="add-items-body">
		<div data-v-067cf1c4="" class="add-items-body-header">
			<div data-v-067cf1c4="" class="header-img">
				<img data-v-067cf1c4="" class="except1"
					src="${vo.item_image }">
			</div>
			<div data-v-067cf1c4="" class="header-content">
				<div data-v-067cf1c4="" class="header-content-left">
					<div data-v-067cf1c4="" class="header-content-title">
						${vo.item_name }</div>
					<div data-v-067cf1c4="" class="header-content-badge"></div>
					<div data-v-067cf1c4="" class="header-content-price-wrap">
						<div data-v-067cf1c4="" class="header-content-discounted-price">
							${vo.item_price_m }원 ~&nbsp;</div>
						<c:if test="${!empty vo.item_price_m_sub }">
							<div data-v-067cf1c4="" class="header-content-price">
								${vo.item_price_m_sub }원</div>
						</c:if>
					</div>
				</div>
				<div data-v-067cf1c4="" class="header-content-right"></div>
			</div>
		</div>
		<section data-v-067cf1c4="" class="add-items-group">
			<div data-v-2706028c="" data-v-067cf1c4="" class="menu-select-panel">
				<div data-v-2706028c="" class="menu__select-size bundle-modal-style">
					<ul data-v-2706028c=""
						class="menu__select-size-list normal bundle-modal-style">
						<li data-v-2706028c="" class="menu__options"><label
							data-v-2706028c="" class="menu__label" style="width: 120px;">사이즈
								선택</label>
							<div data-v-2706028c="" class="row--v-center">
								<div data-v-2706028c="" class="row--v-center radio-label">
									<label data-v-3f971378="" data-v-2706028c="" class="form-radio"><input
										data-v-3f971378="" id="Medium" type="radio"
										name="menu-sizebundleSelect" class="form-radio-input"
										value="Medium"> <span data-v-3f971378=""
										class="form-radio-circle"><i data-v-3f971378=""
											class="form-radio-circle-interior"></i></span> Medium </label> <label
										data-v-2706028c="" for="Medium" class="radio-side-text">Medium</label>
								</div>
								<c:if test="${!empty vo.item_price_l }">
									<div data-v-2706028c="" class="row--v-center radio-label">
										<label data-v-3f971378="" data-v-2706028c="" class="form-radio"><input
											data-v-3f971378="" id="Large" type="radio"
											name="menu-sizebundleSelect" class="form-radio-input"
											value="Large"> <span data-v-3f971378=""
											class="form-radio-circle"><i data-v-3f971378=""
												class="form-radio-circle-interior"></i></span> Large </label> <label
											data-v-2706028c="" for="Large" class="radio-side-text">Large</label>
									</div>
								</c:if>
								<!---->
							</div></li>
						<li data-v-2706028c="" class="menu__period-select">
							<!---->
							<div data-v-4837bb91="" data-v-2706028c=""
								class="dropdown-btn-flex-wrap">
								<div data-v-4837bb91="" class="dropdown-btn">
									<div data-v-4837bb91="" class="button dropdown">
										<div data-v-4837bb91="" class="except1">기간 선택</div>
									</div>
									<!---->
								</div>
							</div>
						</li>
						<li data-v-2706028c=""
							class="menu__date-select bundle-modal-style">
							<!---->
							<div data-v-2706028c="" class="date-picker-with-icon">
								<span data-v-56ae83be="" data-v-2706028c="" disabled="disabled"
									class="v-date-custom"><input data-v-2706028c=""
									data-v-56ae83be="" disabled="disabled" placeholder="시작 예정일 선택"
									readonly="readonly" type="input" class="date-picker-input">
								<div data-v-7605e1b2="" data-v-56ae83be=""
										class="vc-popover-content-wrapper">
										<!---->
									</div></span> <img data-v-2706028c=""
									src="/images/icon-calendar-active@3x.png" alt="시작일 선택 달력 아이콘"
									class="date-select-calendar-icon" style="cursor: pointer;">
							</div>
						</li>
					</ul>
					<!---->
				</div>
				<div data-v-2706028c="" class="menu__price">
					<label data-v-2706028c="" class="menu__label menu__price-label">
						상품 금액 </label>
					<div data-v-2706028c="" class="menu__price-right">
						<!---->
						<div data-v-2706028c="" class="menu__price-current-price__wrapper">
							<!---->
							<div data-v-2706028c="" class="menu__price-current-price">
								0원</div>
						</div>
					</div>
				</div>
			</div>
			<button data-v-a1c889e0="" data-v-067cf1c4="" type="button" title=""
				disabled="disabled" class="button add-items-button button--disabled">
				<span data-v-a1c889e0="" class="button__wrap">선택 완료</span>
			</button>
		</section>
	</div>
</article>