<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:if test="${check == 0}">
	<div data-v-6b53621a="" data-v-d06869c8="" class="error-list"
		data-v-421abad8="">
		<p data-v-6b53621a="">작성가능한 후기가 없습니다.</p>
	</div>
</c:if>

<c:if test="${check > 0}">
	<div data-v-d06869c8="" data-v-421abad8=""
		class="review-index__index">
		<ul data-v-d06869c8="" data-v-421abad8="">
		
			<c:forEach var="list1" items="${list1 }" varStatus="i">
				<c:forEach var="list2" items="${list2[i.index] }" varStatus="j">
					<c:if test="${list2.payment_item_mapping_review == 0 }">
						<li data-v-d06869c8="" data-v-421abad8=""><div
								data-v-290d27aa="" data-v-d06869c8="" class="review-item"
								data-v-421abad8="">
								<p data-v-290d27aa="" class="review-item__date">
									<c:if test="${list1.payment_delivery_condition eq null}">
										배송준비중
									</c:if>
									<c:if test="${list1.payment_delivery_condition ne null }">
										${list1.payment_delivery_condition}
									</c:if>
									<em data-v-290d27aa="">${list1.payment_date}</em>
								</p>
								<div data-v-290d27aa="" class="row--v-center">
									<div data-v-290d27aa="" href="#" target="_blank"
										class="col-12 col--lg review-item__body">
										<dl data-v-290d27aa="" class="row">
											<dt data-v-290d27aa="">
												<figure data-v-290d27aa=""
													style="background-image: url(&quot;${list3[i.index][j.index].item_image}&quot;);"></figure>
											</dt>
											<dd data-v-290d27aa="" class="col">
												<strong data-v-290d27aa="">
													${list2.payment_item_mapping_item_name_size } ${list2.payment_item_mapping_item_quantity }개
												</strong>
											</dd>
										</dl>
									</div>
									<nav data-v-290d27aa="" class="col-12 col--lg-auto">
										<div data-v-290d27aa="" class="review-write-wrap">
											<div data-v-290d27aa="">
												<button data-v-a1c889e0="" data-v-290d27aa=""
													type="button" title=""
													class="button button--outline2">
													<span data-v-a1c889e0="" class="button__wrap">후기
														남기기</span>
												</button>
												<input type="hidden" value="${list3[i.index][j.index].item_tag_main }">
												<input type="hidden" value="${list3[i.index][j.index].item_code }">
												<input type="hidden" value="${list2.payment_item_mapping_code }">
												<input type="hidden" value="${list1.payment_code }">
											</div>
											<div data-v-290d27aa="">
												<span data-v-290d27aa="" class="review-write-due"></span>
											</div>
										</div>
										<div data-v-290d27aa="" class="review-write-wrap-mobile">
											<div data-v-290d27aa="">
												<span data-v-290d27aa="" class="review-write-due"></span>
											</div>
											<div data-v-290d27aa="">
												<button data-v-a1c889e0="" data-v-290d27aa=""
													type="button" title=""
													class="button button--side-padding button--outline2">
													<span data-v-a1c889e0="" class="button__wrap">후기
														남기기</span>
												</button>
												<input type="hidden" value="${list3[i.index][j.index].item_tag_main }">
												<input type="hidden" value="${list3[i.index][j.index].item_code }">
												<input type="hidden" value="${list2.payment_item_mapping_code }">
												<input type="hidden" value="${list1.payment_code }">
											</div>
										</div>
									</nav>
								</div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</c:forEach>
			
			<!---->
		</ul>
	</div>
</c:if>