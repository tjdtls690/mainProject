<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<c:if test="${not empty itemInfo}">
	<c:forEach var="item" items="${itemInfo}">
		<li data-v-4c9a9e82="" class="col-6 col--lg-3">
			<article data-v-15082832="" data-v-4c9a9e82=""
				class="item for-loop-cloned-item-244">
				<input type="hidden" value="${item.itemCode }" id="itemCode">
				<input type="hidden" value="${item.tagMain }" id="tagMain">
				<div data-v-15082832="" class="for-loop-cloned-item-244">
					<figure data-v-15082832=""
						class="item__image for-loop-cloned-item-244">
						<div data-v-15082832="" class="item-badge for-loop-cloned-item-244">
							<!---->
						</div>
						<img data-v-15082832="" src="${item.itemImage }"
							alt="${item.itemName } " title="${item.itemName } "
							class="for-loop-cloned-item-244">
					</figure>
					<div data-v-15082832="" class="item__body for-loop-cloned-item-244">
						<!---->
						<strong data-v-15082832="" class="for-loop-cloned-item-244">${item.itemName }</strong>
						<div data-v-15082832="" class="for-loop-cloned-item-244 options">
							<dl data-v-15082832="" class="for-loop-cloned-item-244 row--v">
								<dd data-v-15082832="" class="for-loop-cloned-item-244">
									<em data-v-15082832="" class="for-loop-cloned-item-244"><b>${item.itemPriceM }원</b></em>~
									<span data-v-15082832="" class="for-loop-cloned-item-244">
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
							<div data-v-15082832="" class="for-loop-cloned-item-244 info-wrap">
								<span data-v-15082832=""
									class="for-loop-cloned-item-244 star-info">${item.starAvg }</span>
								<span data-v-15082832=""
									class="for-loop-cloned-item-244 review-info">${item.reviewCount }</span>
							</div>
							<div data-v-15082832=""
								class="row--v-center for-loop-cloned-item-244 tag-wrap">
								<div data-v-15082832=""
									class="for-loop-cloned-item-244 row--v-center">
									<!-- 																		<div data-v-15082832="" -->
									<!-- 																			class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag"> -->
									<!-- 																			락토베지테리언</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</li>
	</c:forEach>
</c:if>
<c:if test="${empty itemInfo}">
	<div data-v-6e61822c="" class="mobile-body-wrap">
		<div data-v-6e61822c="" class="search-count-wrap">
			<span data-v-6e61822c="" class="search-count">검색결과 0개</span>
		</div>
		<div data-v-6e61822c="" class="content-wrap">
			<div data-v-6e61822c="" class="search-result-wrap">
				<div data-v-6e61822c="">
					<div data-v-6e61822c="" class="search-result-zero-wrap">
						<img data-v-6e61822c="" src="/images/img-empty-produt@3x.png"
							alt="검색결과 없음" class="search-result-zero-img"> <span
							data-v-6e61822c="" class="search-result-zero-desc">검색하신
							상품을 찾을 수 없어요 :(<br>단어의 철자와 띄어쓰기를 확인해보시거나<br>다른 검색어를
							입력해보세요.
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

</c:if>