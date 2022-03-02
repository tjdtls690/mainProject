<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path"
	value="${pageContext.request.contextPath}/resources/search" />
<!DOCTYPE html>
<html class="">
<head>

<title>프레시코드 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-16.png" sizes="16x16">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-24.png" sizes="24x24">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-32.png" sizes="32x32">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-57.png" sizes="57x57">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-120.png" sizes="120x120">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-152.png" sizes="152x152">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-196.png" sizes="196x196">
<link rel="stylesheet" href="${path }/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">

//ajax 태그기능 넣을 함수
$(function(){
	
	 $("#search-input").keydown(function(key) {
        if (key.keyCode == 13) {
        	var search = $(this).val(); //val이 검색창에 값 넣은것
    	    $.ajax({
    	    	url : 'searchDo.do',
    	    	type : 'post',
    	    	dataType : 'html',
    	    	data : {
    	    		"search" : search
    	    	},
    	    	success : function(htmlOut){
    	    		$('.content-wrap').html(htmlOut);
    	    	}
    	    })
        }
    });  
})  
</script>
<body class="" style="padding-right: 0px;">
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-0f5971ec="" class="viewport">
				<header data-v-7aa1f9b4="" data-v-0f5971ec="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b4="" href="/info" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">
								<a data-v-7aa1f9b4="" href="/mypage/orders" class="">신준혁 <span
									data-v-7aa1f9b4="">님</span></a> <span data-v-7aa1f9b4="">1:1문의</span>
								<a data-v-7aa1f9b4="" href="https://forms.gle/92o1ctx6U4CYe2yF9"
									target="_blank">B2B 신청</a>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="/" class="nuxt-link-active"></a>
							<!---->
						</div>
						<nav data-v-7aa1f9b4="" class="header__menus">
							<div data-v-7aa1f9b4="">
								<div data-v-7aa1f9b4="" class="dropdown">
									<span data-v-7aa1f9b4="" class="item">전체 카테고리</span>
									<div data-v-7aa1f9b4="" class="dropdown">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu" class=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/salad" class=""> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/subscription" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/salad-wrap" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/meal" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/soup" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/set" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/snack" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/drink" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/event" class="new"> 초코베리머치 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/soon" class=""> 오픈예정 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="/menu/subscription" class="item">정기구독
								</a><a data-v-7aa1f9b4="" href="/menu/salad" class="item">샐러드 </a><a
									data-v-7aa1f9b4="" href="/menu/salad-wrap" class="item">샌드위치·랩
								</a><a data-v-7aa1f9b4="" href="/menu/event" class="item">초코베리머치
								</a><a data-v-7aa1f9b4="" href="/event" class="item">이벤트 </a><a
									data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="/search"
									class="search-logo nuxt-link-exact-active nuxt-link-active"
									aria-current="page"><img data-v-7aa1f9b4=""
									src="/images/ic-navi-search@3x.png" alt="메뉴 검색"
									class="search-logo-img" style="width: 24px; height: 24px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="/cart" class="cart-logo-wrap item"><div
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo">
										<div data-v-7aa1f9b4="" class="cart-logo-count">3</div>
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="/order" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="/search"
								class="search-logo nuxt-link-exact-active nuxt-link-active"
								aria-current="page"><img data-v-7aa1f9b4=""
								src="/images/ic-navi-search@3x.png" alt="메뉴 검색"
								class="search-logo-img" style="width: 24px; height: 24px;"></a>
							<a data-v-7aa1f9b4="" href="/cart" class="cart-logo-wrap item"><div
									data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo">
									<div data-v-7aa1f9b4="" class="cart-logo-count">3</div>
								</div></a>
							<nav data-v-7aa1f9b4="" class="header__toggle-button">
								<button data-v-7aa1f9b4="" type="button">
									<img data-v-7aa1f9b4=""
										src="/images/header-img/menu_new@2x.png" alt="user-menu"
										style="width: 24px; height: 24px;">
								</button>
							</nav>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
					<!---->
				</header>
				<div data-v-0f5971ec="" class="container"
					style="padding-top: 182px;">
					<div data-v-6e61822c="" data-v-0f5971ec="" class="container">
						<div data-v-6e61822c="" class="search-container">
							<header data-v-6e61822c="" class="header-wrap">
								<div data-v-6e61822c="" class="desktop-header-title">검색</div>
								<div data-v-6e61822c="" class="input-wrap">
									<img data-v-6e61822c="" src="/images/ic-navi-arrow-left@3x.png"
										alt="뒤로가기" class="back-btn"> <input data-v-6e61822c=""
										id="search-input" placeholder="원하시는 상품을 검색해보세요." type="text"
										class="search-input"> <img data-v-6e61822c=""
										src="/images/ic-search-delete@3x.png" alt="검색어 지우기"
										class="text-clear-btn">
								</div>
							</header>
							<div data-v-6e61822c="" class="mobile-body-wrap">
								<!---->
								<div data-v-6e61822c="" class="content-wrap">
									<div data-v-6e61822c="" class="md-reco-wrap">
										<div data-v-6e61822c="" class="md-reco-title">MD추천</div>
										<ul data-v-6e61822c="" class="md-reco-list">
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-825">
													<div data-v-15082832="" class="for-loop-cloned-item-825">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-825">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-825">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/825_20211227173835"
																alt=" [새벽/정기구독] 600kcal 유지어터"
																title=" [새벽/정기구독] 600kcal 유지어터"
																class="for-loop-cloned-item-825">
															<!---->
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-825">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-825"> [새벽/정기구독]
																600kcal 유지어터</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-825 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-825 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-825">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-825">68,352원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-825">71,200</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-825">[기간]
																1주-8주 / [배송] 주 2회 / [사이즈] M L Size</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-825 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-825 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-825 star-info">4.8</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-825 review-info">2,823</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-818">
													<div data-v-15082832="" class="for-loop-cloned-item-818">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-818">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-818">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/818_20211227174326"
																alt="[새벽/정기구독] 한끼 샐러드/샌드위치 교차"
																title="[새벽/정기구독] 한끼 샐러드/샌드위치 교차"
																class="for-loop-cloned-item-818">
															<!---->
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-818">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-818">[새벽/정기구독] 한끼
																샐러드/샌드위치 교차</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-818 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-818 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-818">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-818">38,606원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-818">39,800</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-818">[기간]
																1주-8주 / [배송] 주 2회 / [사이즈] M L Size</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-818 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-818 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-818 star-info">4.8</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-818 review-info">2,881</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-441">
													<div data-v-15082832="" class="for-loop-cloned-item-441">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-441">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-441">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/441_20211227174934"
																alt="[스팟/정기구독] 한끼 샐러드 주4일" title="[스팟/정기구독] 한끼 샐러드 주4일"
																class="for-loop-cloned-item-441">
															<!---->
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-441">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-441">[스팟/정기구독] 한끼
																샐러드 주4일</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-441 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-441 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-441">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-441">25,220원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-441">26,000</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-441">[기간]
																1주-8주 / [배송] 주 2회 / [사이즈] M or L Size</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-441 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-441 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-441 star-info">4.8</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-441 review-info">3,206</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-823">
													<div data-v-15082832="" class="for-loop-cloned-item-823">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-823">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-823">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/823_20211227173920"
																alt=" [스팟/정기구독] 두끼 샐러드+샌드위치"
																title=" [스팟/정기구독] 두끼 샐러드+샌드위치"
																class="for-loop-cloned-item-823">
															<!---->
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-823">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-823"> [스팟/정기구독] 두끼
																샐러드+샌드위치</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-823 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-823 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-823">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-823">38,592원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-823">40,200</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-823">[기간]
																1주-8주 / [배송] 주 5회 / [사이즈] M L Size</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-823 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-823 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-823 star-info">4.8</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-823 review-info">2,824</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-181">
													<div data-v-15082832="" class="for-loop-cloned-item-181">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-181">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-181">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/181_20220217145549.jpg"
																alt="샐러드와 고구마 든든세트" title="샐러드와 고구마 든든세트"
																class="for-loop-cloned-item-181">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-181"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-181">
															<div data-v-29c2185a="" data-v-15082832=""
																style="position: relative; z-index: 1;">
																<div data-v-29c2185a="" class="move-balloon">
																	<span data-v-29c2185a="" class="tooltip-text-orange"
																		style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">리뉴얼
																		5% 쿠폰</span>
																</div>
															</div>
															<strong data-v-15082832=""
																class="for-loop-cloned-item-181">샐러드와 고구마 든든세트</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-181 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-181 row--v">
																	<dd data-v-15082832=""
																		class="for-loop-cloned-item-181 col-12">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-181">10,130원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-181">10,900</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-181">샐러드와
																고구마로 챙기는 든든한 한 끼 </span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-181 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-181 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-181 star-info">4.7</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-181 review-info">304</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-172">
													<div data-v-15082832="" class="for-loop-cloned-item-172">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-172">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-172">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/172_20220217150447.jpg"
																alt="샐러드와 계란 촉촉세트" title="샐러드와 계란 촉촉세트"
																class="for-loop-cloned-item-172">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-172"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-172">
															<div data-v-29c2185a="" data-v-15082832=""
																style="position: relative; z-index: 1;">
																<div data-v-29c2185a="" class="move-balloon">
																	<span data-v-29c2185a="" class="tooltip-text-orange"
																		style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">리뉴얼
																		5% 쿠폰</span>
																</div>
															</div>
															<strong data-v-15082832=""
																class="for-loop-cloned-item-172">샐러드와 계란 촉촉세트</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-172 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-172 row--v">
																	<dd data-v-15082832=""
																		class="for-loop-cloned-item-172 col-12">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-172">9,760원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-172">10,500</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-172">샐러드와
																계란으로 챙기는 건강한 한 끼</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-172 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-172 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-172 star-info">4.8</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-172 review-info">323</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-782">
													<div data-v-15082832="" class="for-loop-cloned-item-782">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-782">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-782">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/782_20220124095906"
																alt="프리미엄 샐러드 3종 세트" title="프리미엄 샐러드 3종 세트"
																class="for-loop-cloned-item-782">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-782"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-782">
															<div data-v-29c2185a="" data-v-15082832=""
																style="position: relative; z-index: 1;">
																<div data-v-29c2185a="" class="move-balloon">
																	<span data-v-29c2185a="" class="tooltip-text-orange"
																		style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">리뉴얼
																		5% 쿠폰</span>
																</div>
															</div>
															<strong data-v-15082832=""
																class="for-loop-cloned-item-782">프리미엄 샐러드 3종 세트</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-782 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-782 row--v">
																	<dd data-v-15082832=""
																		class="for-loop-cloned-item-782 col-12">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-782">23,900원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-782">25,700</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-782">훈제연어,
																갈릭쉬림프, 파인애플 한번에 만나보기</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-782 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-782 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-782 star-info">4.8</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-782 review-info">32</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-875">
													<div data-v-15082832="" class="for-loop-cloned-item-875">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-875">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-875">
																<div data-v-15082832="" class="for-loop-cloned-item-875">
																	NEW</div>
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/875_20220204103748.png"
																alt="버라이어티팩 3종 세트" title="버라이어티팩 3종 세트"
																class="for-loop-cloned-item-875">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-875"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-875">
															<div data-v-29c2185a="" data-v-15082832=""
																style="position: relative; z-index: 1;">
																<div data-v-29c2185a="" class="move-balloon">
																	<span data-v-29c2185a="" class="tooltip-text-orange"
																		style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">리뉴얼
																		5% 쿠폰</span>
																</div>
															</div>
															<strong data-v-15082832=""
																class="for-loop-cloned-item-875">버라이어티팩 3종 세트</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-875 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-875 row--v">
																	<dd data-v-15082832=""
																		class="for-loop-cloned-item-875 col-12">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-875">18,880원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-875">20,300</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-875">프레시코드
																시그니처 메뉴 3종을 한번에!</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-875 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-875 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-875 star-info">5</span> <span
																		data-v-15082832=""
																		class="for-loop-cloned-item-875 review-info">7</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-872">
													<div data-v-15082832="" class="for-loop-cloned-item-872">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-872">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-872">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/872_20220121183820"
																alt="[올가니카]플랜트 왕교자" title="[올가니카]플랜트 왕교자"
																class="for-loop-cloned-item-872">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-872"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-872">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-872">[올가니카]플랜트 왕교자</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-872 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-872 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-872">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-872">4,990원</em>~
																		<!---->
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-872">
																맛과 영양 가득 담은 채식 만두</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-872 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-872 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-872 star-info">5</span> <span
																		data-v-15082832=""
																		class="for-loop-cloned-item-872 review-info">4</span>
																</div>
																<div data-v-15082832=""
																	class="row--v-center for-loop-cloned-item-872 tag-wrap">
																	<div data-v-15082832=""
																		class="for-loop-cloned-item-872 row--v-center">
																		<div data-v-15082832=""
																			class="for-loop-cloned-item-872 vegi-tag md-item-vegi-tag">
																			비건</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-898">
													<div data-v-15082832="" class="for-loop-cloned-item-898">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-898">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-898">
																<div data-v-15082832="" class="for-loop-cloned-item-898">
																	NEW</div>
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/898_20220221112057.png"
																alt="[쿠캣]티라미수쏙 찹쌀떡" title="[쿠캣]티라미수쏙 찹쌀떡"
																class="for-loop-cloned-item-898">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-898"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-898">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-898">[쿠캣]티라미수쏙 찹쌀떡</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-898 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-898 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-898">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-898">1,440원</em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-898">1,600</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-898">티라미수
																케익이 떡 안으로 쏙</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-898 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-898 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-898 star-info">0</span> <span
																		data-v-15082832=""
																		class="for-loop-cloned-item-898 review-info">0</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-731">
													<div data-v-15082832="" class="for-loop-cloned-item-731">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-731">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-731">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/731_20211007190400"
																alt="[달차] 페이크 커피 2종" title="[달차] 페이크 커피 2종"
																class="for-loop-cloned-item-731">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-731"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-731">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-731">[달차] 페이크 커피 2종</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-731 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-731 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-731">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-731">2,300원</em>~
																		<!---->
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-731">카페인
																0%, 보리로 만든 커피 대용 음료!</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-731 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-731 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-731 star-info">4.7</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-731 review-info">40</span>
																</div>
																<!---->
															</div>
														</div>
													</div>
												</article></li>
											<li data-v-6e61822c="" class="md-reco-item"><article
													data-v-15082832="" data-v-6e61822c=""
													class="item for-loop-cloned-item-641">
													<div data-v-15082832="" class="for-loop-cloned-item-641">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-641">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-641">
																<!---->
															</div>
															<img data-v-15082832=""
																src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/641_20220217095835.png"
																alt="[그리팅] 방풍나물&amp;고구마 스프"
																title="[그리팅] 방풍나물&amp;고구마 스프"
																class="for-loop-cloned-item-641">
															<div data-v-15082832=""
																class="btn-cart js-btn-cart js-btn-cart-641"></div>
															<!---->
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-641">
															<div data-v-29c2185a="" data-v-15082832=""
																style="position: relative; z-index: 1;">
																<div data-v-29c2185a="" class="move-balloon">
																	<span data-v-29c2185a="" class="tooltip-text-orange"
																		style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">쿠폰
																		할인</span>
																</div>
															</div>
															<strong data-v-15082832=""
																class="for-loop-cloned-item-641">[그리팅]
																방풍나물&amp;고구마 스프</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-641 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-641 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-641">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-641">5,000원</em>~
																		<!---->
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-641">은은한
																향을 담은 방풍나물과 달달한 고구마의 이색 만남! </span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-641 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-641 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-641 star-info">4.7</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-641 review-info">12</span>
																</div>
																<div data-v-15082832=""
																	class="row--v-center for-loop-cloned-item-641 tag-wrap">
																	<div data-v-15082832=""
																		class="for-loop-cloned-item-641 row--v-center">
																		<div data-v-15082832=""
																			class="for-loop-cloned-item-641 vegi-tag md-item-vegi-tag">
																			플렉시테리언</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</article></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!---->
					</div>
				</div>
				<div data-v-0f5971ec="" class="btn-order-wrap">
					<p data-v-0f5971ec="" class="tooltip">'바로 주문'으로 간편하게!</p>
					<div data-v-0f5971ec="" class="btn-order"></div>
				</div>
				<footer data-v-438b4fe4="" data-v-0f5971ec="" class="footer">
					<div data-v-438b4fe4="" class="footer__wrap">
						<h2 data-v-438b4fe4="" class="footer__logo">
							<img data-v-438b4fe4="" src="/images/logo-20211111.png"
								alt="FRESHCODE">
							<div data-v-438b4fe4="" class=""></div>
						</h2>
						<div data-v-438b4fe4="" class="footer__body">
							<nav data-v-438b4fe4="" class="footer__menus">
								<div data-v-438b4fe4="" class="footer__menus-item">
									<a data-v-438b4fe4="" href="#">FAQ</a> <a data-v-438b4fe4=""
										href="/terms" class="">이용약관</a> <a data-v-438b4fe4=""
										href="/privacy" class="">개인정보처리방침</a>
								</div>
								<div data-v-438b4fe4="" class="footer__menus-item">
									<a data-v-438b4fe4="" href="#">제휴문의</a> <a data-v-438b4fe4=""
										href="#">채용문의</a> <a data-v-438b4fe4="" href="#">케이터링 문의</a>
								</div>
							</nav>
							<address data-v-438b4fe4="" class="footer__cs">
								<h3 data-v-438b4fe4="">프코고객센터</h3>
								<div data-v-438b4fe4="" class="cs-time">
									<div data-v-438b4fe4="" class="btn-channel-talk">1:1 문의하기</div>
									<div data-v-438b4fe4="" class="cs-time__inner">
										<div data-v-438b4fe4="">
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">평일</b>
												<p data-v-438b4fe4="">9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
											</div>
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">토요일</b>
												<p data-v-438b4fe4="">
													9:00 - 13:00 <span data-v-438b4fe4="">&nbsp;(홈페이지
														채팅문의만 운영)</span>
												</p>
											</div>
										</div>
										<div data-v-438b4fe4="">
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">공휴일</b>
												<p data-v-438b4fe4="">휴무</p>
											</div>
											<div data-v-438b4fe4="" class="cs-time-text">
												<b data-v-438b4fe4="">고객센터</b>
												<p data-v-438b4fe4="">1644-4559</p>
											</div>
										</div>
									</div>
								</div>
							</address>
							<address data-v-438b4fe4="" class="footer__address hide">
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">대표</b>정유석
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">주소</b> <span data-v-438b4fe4="">서울특별시
										성동구 왕십리로 115, 헤이그라운드 서울숲점 7층</span>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">사업자등록번호</b>883-81-00307
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">통신판매업신고</b>제 2016-서울용산-00657
								</p>
							</address>
							<address data-v-438b4fe4="" class="footer__address help hide">
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">제휴문의</b><a data-v-438b4fe4=""
										href="mailto:biz@freshcode.me">biz@freshcode.me</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">카카오ID</b><a data-v-438b4fe4="" href="#">@프레시코드-freshcode</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">단체주문문의</b><a data-v-438b4fe4=""
										href="mailto:order@freshcode.me">order@freshcode.me</a>
								</p>
							</address>
							<aside data-v-438b4fe4="" class="footer__side">
								<p data-v-438b4fe4="" class="footer__copyright hide">
									ⓒ 2020. FreshCode, Inc. All Rights Reserved<br
										data-v-438b4fe4="">프레시코드가 제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은
									특허법, 저작권법, 부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4="">무단
									복제, 유사한 변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
								</p>
								<div data-v-438b4fe4="" class="footer__sns-wrap">
									<nav data-v-438b4fe4="" class="footer__sns">
										<img data-v-438b4fe4="" src="/images/instagram@2x.png"
											title="instagram" class=""><img data-v-438b4fe4=""
											src="/images/facebook@2x.png" title="facebook" class=""><img
											data-v-438b4fe4="" src="/images/youtube@3x.png"
											title="youtube" class=""><img data-v-438b4fe4=""
											src="/images/group-21@2x.png" title="blog" class=""><img
											data-v-438b4fe4="" src="/images/blog-post@2x.png"
											title="Naver post" class=""><img data-v-438b4fe4=""
											src="/images/kakao-channel@2x.png" title="kakao channel"
											class="">
									</nav>
								</div>
							</aside>
						</div>
					</div>
				</footer>
				<!---->
				<!---->
				<!---->
				<!---->
			</main>
		</div>
	</div>



	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>