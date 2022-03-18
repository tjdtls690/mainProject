<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:forEach var="item" items="${itemInfo }">
<li data-v-4c9a9e82="" class="col-6 col--lg-3">
<article
		data-v-15082832="" data-v-4c9a9e82=""
		class="item for-loop-cloned-item-244">
		<input type="hidden" value="${item.itemCode }" id="itemCode">
		<input type="hidden" value="${item.tagMain }" id="tagMain">
		<input type="hidden" value="${item.tagSub }" id="tagSub">
		<div data-v-15082832="" class="for-loop-cloned-item-244">
			<figure data-v-15082832=""
				class="item__image for-loop-cloned-item-244">
				<div data-v-15082832=""
					class="item-badge for-loop-cloned-item-244">
					<c:if test="${item.tagSub eq 302}">
						<div data-v-15082832="" class="for-loop-cloned-item-244">
        					 하루 50개 한정
						</div>
					</c:if>
				</div>
				<img data-v-15082832=""
					src="${item.itemImage }"
					alt="${item.itemName } " title="${item.itemName } "
					class="for-loop-cloned-item-244">
					<div data-v-15082832="" class="btn-cart js-btn-cart"></div>
			</figure>
			<div data-v-15082832=""
				class="item__body for-loop-cloned-item-244">
				<!---->
<!-- 																구독 애들이 허전해보여서 추가해보았다 -->
			<c:if test="${item.tagMain eq 100}">
				<div data-v-29c2185a="" data-v-15082832="" style="position: relative; z-index: 1;">
					<div data-v-29c2185a="" class="move-balloon">
						<span data-v-29c2185a="" class="tooltip-text-orange" style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">
							20% 쿠폰
						</span>
					</div>
				</div>
			</c:if>
				<strong data-v-15082832=""
					class="for-loop-cloned-item-244">${item.itemName }</strong>
				<div data-v-15082832=""
					class="for-loop-cloned-item-244 options">
					<dl data-v-15082832=""
						class="for-loop-cloned-item-244 row--v">
						<dd data-v-15082832="" class="for-loop-cloned-item-244">
							<em data-v-15082832=""
								class="for-loop-cloned-item-244"><b>${item.itemPriceM }원</b></em>~ <span
								data-v-15082832="" class="for-loop-cloned-item-244">
								<c:if test="${item.itemPriceMSub ne ''}">
										${item.itemPriceMSub }
								</c:if>
								</span>
						</dd>
					</dl>
				</div>
				<span data-v-15082832="" class="for-loop-cloned-item-244">${item.itemSummary }</span>
				<div data-v-15082832=""
					class="item-bottom for-loop-cloned-item-244 row--v-center row--h-between">
					<div data-v-15082832=""
						class="for-loop-cloned-item-244 info-wrap">
						<span data-v-15082832=""
							class="for-loop-cloned-item-244 star-info">${item.starAvg }</span>
						<span data-v-15082832=""
							class="for-loop-cloned-item-244 review-info">${item.reviewCount }</span>
					</div>
					<div data-v-15082832=""
						class="row--v-center for-loop-cloned-item-244 tag-wrap">
						<div data-v-15082832=""
							class="for-loop-cloned-item-244 row--v-center">
 									<c:if test="${item.kind eq '비건'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					비건</div>
																			</c:if>
																			<c:if test="${item.kind eq '페스코'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					페스코 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '폴로'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					폴로 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '락토'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					락토 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '플렉시'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					플렉시 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '채식'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					채식</div>
																			</c:if>
																			<c:if test="${item.kind eq '오보'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					오보 베지테리언</div>
																			</c:if>	
																			<c:if test="${item.kind eq '프로틴'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					프로틴</div>
																			</c:if>										
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</li>
</c:forEach>