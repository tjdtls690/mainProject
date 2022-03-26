<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:if test="${check == 0}">
	<div data-v-6b53621a="" data-v-d06869c8="" class="error-list"
		data-v-421abad8="">
		<p data-v-6b53621a="">작성한 후기가 없습니다.</p>
	</div>
</c:if>
<c:if test="${check > 0}">
	<div data-v-d06869c8="" data-v-421abad8="" class="review-index__index">
	
		<c:forEach var="list1" items="${list1 }" varStatus="i">
			<c:if test="${list1.payment_item_mapping_review == 1 }">
				<ul data-v-d06869c8="" data-v-421abad8="">
					<!---->
					<div data-v-2e8f90f6="" data-v-d06869c8="" class="wrote-review-wrap"
						data-v-421abad8="">
						<div data-v-2e8f90f6="" class="wrote-review-wrap-header">
							<div data-v-2e8f90f6="" class="wrote-review-created-date">
								작성일 <em data-v-2e8f90f6="">${list2[i.index].write_date }</em>
							</div>
							<div data-v-2e8f90f6="" class="wrote-review-menu">
								<p data-v-2e8f90f6="">${list1.payment_item_mapping_item_name_size }</p>
							</div>
							<div data-v-2e8f90f6="" class="wrote-review-image"></div>
						</div>
						<div data-v-2e8f90f6="" class="wrote-review-content">
							<div data-v-2e8f90f6="" class="wrote-review-rating">
								<div data-v-fde73a0c="" data-v-2e8f90f6=""
									class="review-item__score vue-star-rating">
									<div data-v-fde73a0c="" class="sr-only">
										<span data-v-fde73a0c=""></span>
									</div>
									<div data-v-fde73a0c="" class="vue-star-rating">
										<span data-v-fde73a0c="" class="vue-star-rating-star"
											style="margin-right: 0px;"><svg data-v-ef4bc576=""
												data-v-fde73a0c="" height="16" width="16" viewBox="0 0 16 16"
												class="vue-star-rating-star" step="50">
												<linearGradient data-v-ef4bc576="" id="exnoh" x1="0" x2="100%"
													y1="0" y2="0">
												<stop data-v-ef4bc576="" offset="100%" stop-color="#27B06E"
													stop-opacity="1"></stop>
												<stop data-v-ef4bc576="" offset="100%" stop-color="#F4F5F6"
													stop-opacity="1"></stop></linearGradient>
												<filter data-v-ef4bc576="" id="yhalha" height="130%"
													width="130%" filterUnits="userSpaceOnUse">
												<feGaussianBlur data-v-ef4bc576="" stdDeviation="0"
													result="coloredBlur"></feGaussianBlur>
												<feMerge data-v-ef4bc576="">
												<feMergeNode data-v-ef4bc576="" in="coloredBlur"></feMergeNode>
												<feMergeNode data-v-ef4bc576="" in="SourceGraphic"></feMergeNode></feMerge></filter>
												<!----><!-- irtz8t -->
												<c:if test="${list2[i.index].star > 0}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#exnoh)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#exnoh)"></polygon>
												</c:if>
												<c:if test="${list2[i.index].star == 0}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#zvjix)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#zvjix)"></polygon>
												</c:if>
													</svg></span><span data-v-fde73a0c=""
											class="vue-star-rating-star" style="margin-right: 0px;"><svg
												data-v-ef4bc576="" data-v-fde73a0c="" height="16" width="16"
												viewBox="0 0 16 16" class="vue-star-rating-star" step="50">
												<linearGradient data-v-ef4bc576="" id="ld0xqb" x1="0" x2="100%"
													y1="0" y2="0">
												<stop data-v-ef4bc576="" offset="100%" stop-color="#27B06E"
													stop-opacity="1"></stop>
												<stop data-v-ef4bc576="" offset="100%" stop-color="#F4F5F6"
													stop-opacity="1"></stop></linearGradient>
												<filter data-v-ef4bc576="" id="xiy8cwp" height="130%"
													width="130%" filterUnits="userSpaceOnUse">
												<feGaussianBlur data-v-ef4bc576="" stdDeviation="0"
													result="coloredBlur"></feGaussianBlur>
												<feMerge data-v-ef4bc576="">
												<feMergeNode data-v-ef4bc576="" in="coloredBlur"></feMergeNode>
												<feMergeNode data-v-ef4bc576="" in="SourceGraphic"></feMergeNode></feMerge></filter>
												<!---->
												<c:if test="${list2[i.index].star > 1}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#ld0xqb)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#ld0xqb)"></polygon>
												</c:if>
												<c:if test="${list2[i.index].star <= 1}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#f381j8)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#f381j8)"></polygon>
												</c:if>
												
												</svg></span><span data-v-fde73a0c=""
											class="vue-star-rating-star" style="margin-right: 0px;"><svg
												data-v-ef4bc576="" data-v-fde73a0c="" height="16" width="16"
												viewBox="0 0 16 16" class="vue-star-rating-star" step="50">
												<linearGradient data-v-ef4bc576="" id="ooqju" x1="0" x2="100%"
													y1="0" y2="0">
												<stop data-v-ef4bc576="" offset="100%" stop-color="#27B06E"
													stop-opacity="1"></stop>
												<stop data-v-ef4bc576="" offset="100%" stop-color="#F4F5F6"
													stop-opacity="1"></stop></linearGradient>
												<filter data-v-ef4bc576="" id="zb34w" height="130%"
													width="130%" filterUnits="userSpaceOnUse">
												<feGaussianBlur data-v-ef4bc576="" stdDeviation="0"
													result="coloredBlur"></feGaussianBlur>
												<feMerge data-v-ef4bc576="">
												<feMergeNode data-v-ef4bc576="" in="coloredBlur"></feMergeNode>
												<feMergeNode data-v-ef4bc576="" in="SourceGraphic"></feMergeNode></feMerge></filter>
												<!---->
												<c:if test="${list2[i.index].star > 2}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#ooqju)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#ooqju)"></polygon>
												</c:if>
												<c:if test="${list2[i.index].star <= 2}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#irtz8t)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#irtz8t)"></polygon>
												</c:if>
												
												</svg></span><span data-v-fde73a0c=""
											class="vue-star-rating-star" style="margin-right: 0px;"><svg
												data-v-ef4bc576="" data-v-fde73a0c="" height="16" width="16"
												viewBox="0 0 16 16" class="vue-star-rating-star" step="50">
												<linearGradient data-v-ef4bc576="" id="683uk" x1="0" x2="100%"
													y1="0" y2="0">
												<stop data-v-ef4bc576="" offset="100%" stop-color="#27B06E"
													stop-opacity="1"></stop>
												<stop data-v-ef4bc576="" offset="100%" stop-color="#F4F5F6"
													stop-opacity="1"></stop></linearGradient>
												<filter data-v-ef4bc576="" id="97w9d6" height="130%"
													width="130%" filterUnits="userSpaceOnUse">
												<feGaussianBlur data-v-ef4bc576="" stdDeviation="0"
													result="coloredBlur"></feGaussianBlur>
												<feMerge data-v-ef4bc576="">
												<feMergeNode data-v-ef4bc576="" in="coloredBlur"></feMergeNode>
												<feMergeNode data-v-ef4bc576="" in="SourceGraphic"></feMergeNode></feMerge></filter>
												<!---->
												<c:if test="${list2[i.index].star > 3}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#683uk)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#683uk)"></polygon>
												</c:if>
												<c:if test="${list2[i.index].star <= 3}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#irtz8t)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#irtz8t)"></polygon>
												</c:if>
												
												</svg></span><span data-v-fde73a0c=""
											class="vue-star-rating-star" style="margin-right: 0px;"><svg
												data-v-ef4bc576="" data-v-fde73a0c="" height="16" width="16"
												viewBox="0 0 16 16" class="vue-star-rating-star" step="50">
												<linearGradient data-v-ef4bc576="" id="q0c60kk" x1="0"
													x2="100%" y1="0" y2="0">
												<stop data-v-ef4bc576="" offset="100%" stop-color="#27B06E"
													stop-opacity="1"></stop>
												<stop data-v-ef4bc576="" offset="100%" stop-color="#F4F5F6"
													stop-opacity="1"></stop></linearGradient>
												<filter data-v-ef4bc576="" id="7x4ktc" height="130%"
													width="130%" filterUnits="userSpaceOnUse">
												<feGaussianBlur data-v-ef4bc576="" stdDeviation="0"
													result="coloredBlur"></feGaussianBlur>
												<feMerge data-v-ef4bc576="">
												<feMergeNode data-v-ef4bc576="" in="coloredBlur"></feMergeNode>
												<feMergeNode data-v-ef4bc576="" in="SourceGraphic"></feMergeNode></feMerge></filter>
												<!---->
												<c:if test="${list2[i.index].star > 4}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#q0c60kk)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#q0c60kk)"></polygon>
												</c:if>
												<c:if test="${list2[i.index].star <= 4}">
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#irtz8t)" stroke="#999" stroke-width="0"
														stroke-linejoin="miter"></polygon>
													<polygon data-v-ef4bc576=""
														points="7.36,0.64,4.48,5.44,0,6.08,3.2,10.88,2.24,16,7.36,13.76,12.16,16,11.52,10.88,14.72,6.08,9.92,5.44"
														fill="url(#irtz8t)"></polygon>
												</c:if>
												
												</svg></span><span data-v-fde73a0c=""
											class="vue-star-rating-rating-text state-rating-label">${list2[i.index].star }</span>
									</div>
								</div>
							</div>
							<div data-v-2e8f90f6="" class="wrote-review-content-text">
								<p data-v-2e8f90f6="">${list2[i.index].content }</p>
							</div>
							<div data-v-2e8f90f6="" class="wrote-review-content-btn">
								<span data-v-2e8f90f6="" class="delete-review" style="cursor: pointer;">삭제</span> <span
									data-v-2e8f90f6=""
									style="color: rgb(201, 202, 204); padding-left: 5px; padding-right: 5px;">|</span>
								<span data-v-2e8f90f6="" class="modify-review" style="cursor: pointer;">수정</span>
								<input type="hidden" value="${list1.payment_item_mapping_code }">
								<input type="hidden" value="${list2[i.index].seq }">
							</div>
						</div>
						<!---->
					</div>
				</ul>
			</c:if>
		</c:forEach>
		
		
	</div>
</c:if>