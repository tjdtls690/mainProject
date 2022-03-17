<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/basket"/>
<!DOCTYPE html>
<html class="">
<head>
<style>
input[type="checkbox"] {
    -webkit-appearance: none;
    position: relative;
    width: 21px;
    height: 21px;
    cursor: pointer;
    outline: none !important;
    border: 1px solid #eeeeee;
    border-radius: 2px;
    background: #eee;
}
input[type="checkbox"]:checked {
    -webkit-appearance: none;
    position: relative;
    width: 21px;
    height: 21px;
    cursor: pointer;
    outline: none !important;
    border: 1px solid #eeeeee;
    border-radius: 2px;
    background: #35AD73;
    background-image : url(https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_check.png);
    background-position: 50%;
    background-size: 12px 8px;
    background-repeat: no-repeat;
}
</style>
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
<meta data-n-head="ssr" data-hid="title" name="title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description"
	content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords"
	content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="og:title" property="og:title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description"
	property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image"
	content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
<link href="${path}/style.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function (){
	$(document).on('click','.button.desktop-body-no-item-btn.button--outline2', function(){
			location.href = "main.do";
	});
});

$(function (){
	$(document).on('click','.button.mobile-footer-btn.outline.button--outline2', function(){
			location.href = "main.do";
	});
});
</script>

</head>
<body>
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-1739428d="" class="viewport-none-footer">
				<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b4="" href="/info" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">
								<a data-v-7aa1f9b4="" href="/mypage/orders" class="">${member.name}<span
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
								<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
									data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 24px; height: 24px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="/basket" aria-current="page"
									class="cart-logo-wrap item nuxt-link-exact-active nuxt-link-active"><div><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_baguni.PNG"
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty" >
										<!---->
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="/order" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_pay.PNG" class="icon-order" style="width: 24px; height: 24px;" data-v-30697495=""></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
								data-v-7aa1f9b4="" src="/images/ic-navi-search@3x.png"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 24px; height: 24px;"></a> <a data-v-7aa1f9b4=""
								href="/cart" aria-current="page"
								class="cart-logo-wrap item nuxt-link-exact-active nuxt-link-active"><div
									data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
									<!---->
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
					<div data-v-7aa1f9b4="" class="mobile-nav js-mobile-nav">
						<div data-v-7aa1f9b4="" class="mobile-nav-wrap">
							<div data-v-7aa1f9b4="" class="mobile-nav-scroll">
								<ul data-v-7aa1f9b4="" class="mobile-nav-contents">
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu" class=""> 전체 메뉴 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu/subscription" class="">
											정기구독 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu/event" class=""> 초코베리머치 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/info" class=""> 배송안내 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/fcospot" class=""> 프코스팟 </a></li>
								</ul>
							</div>
							<div data-v-7aa1f9b4="" class="all-menus-container"
								style="display: none;">
								<div data-v-7aa1f9b4="" class="all-menus-list-wrap">
									<ul data-v-7aa1f9b4="" class="all-menus-list js-all-menus-list">
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu"
											class="js-all-menus-item-link-0 all-menus-item-link">
												전체보기 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/salad"
											class="js-all-menus-item-link-2 all-menus-item-link"> 샐러드
										</a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/subscription"
											class="js-all-menus-item-link-1 all-menus-item-link new">
												정기구독 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/salad-wrap"
											class="js-all-menus-item-link-3 all-menus-item-link new">
												샌드위치·랩 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/meal"
											class="js-all-menus-item-link-4 all-menus-item-link new">
												도시락·간편식 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/soup"
											class="js-all-menus-item-link-10 all-menus-item-link">
												죽·스프 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/set"
											class="js-all-menus-item-link-5 all-menus-item-link new">
												세트상품 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/snack"
											class="js-all-menus-item-link-6 all-menus-item-link new">
												간식 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/drink"
											class="js-all-menus-item-link-7 all-menus-item-link new">
												음료 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/event"
											class="js-all-menus-item-link-8 all-menus-item-link new">
												초코베리머치 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/soon"
											class="js-all-menus-item-link-9 all-menus-item-link">
												오픈예정 </a></li>
									</ul>
								</div>
								<div data-v-7aa1f9b4="" class="all-menus-shadow"></div>
								<div data-v-7aa1f9b4="" class="all-menus-arrow-wrap">
									<img data-v-7aa1f9b4="" src="/images/icon-arrow-down@2x.png"
										alt="" class="all-menus-arrow">
								</div>
							</div>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
				</header>
				<!---->
				<div data-v-1739428d="" class="container"
					style="padding-top: 182px;">
					<section data-v-7f39deaa="" data-v-1739428d="" class="cart">
						<section data-v-7f39deaa="" id="cart-mobile-wrap"
							class="mobile-wrap">
							<div data-v-7f39deaa="" class="mobile-scroll-wrap">
								<header class="mobile-header" data-v-7f39deaa="">
									<button data-v-7f39deaa="" class="mobile-header-back-wrap">
										<img data-v-7f39deaa="" src="https://www.freshcode.me/images/arrow-left@2x.png"
											alt="뒤로가기" class="mobile-header-back-img">
									</button>
									<h1 class="mobile-header-title" data-v-7f39deaa="">장바구니</h1>
									<button data-v-7f39deaa="" class="mobile-header-delete-all">
										전체 삭제</button>
								</header>
								<div data-v-7f39deaa="" class="mobile-body-wrap">
									<main data-v-7f39deaa="" class="mobile-body-no-item">
										<div data-v-7f39deaa="" class="mobile-body-no-item-wrap">
											<article data-v-7f39deaa="" class="mobile-body-no-item">
												<img data-v-7f39deaa="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_cart_empty.png" alt="" class="mobile-body-no-item-img"> 
													<span data-v-7f39deaa="" class="mobile-body-no-item-text">장바구니에 담긴 상품이 없습니다 :(</span>
											</article>
										</div>
									</main>
								</div>
								
								<footer data-v-7f39deaa="" class="mobile-footer">
									<section data-v-7f39deaa="" class="mobile-footer-btn-wrap">
										<button data-v-a1c889e0="" data-v-7f39deaa="" type="button" title="" class="button mobile-footer-btn outline button--outline2">
											<span data-v-a1c889e0="" class="button__wrap">상품 담으러 가기</span>
										</button>
									</section>
								</footer>
							</div>
						</section>
						<!-- mobile 끝  -->
						<section data-v-7f39deaa="" class="desktop-wrap">
							<header data-v-7f39deaa="" class="desktop-header">
								<div data-v-7f39deaa="" class="desktop-header-title-wrap">
									<h1 data-v-7f39deaa="" class="desktop-header-title">장바구니</h1>
									<h4 data-v-7f39deaa="" class="desktop-header-subtitle">
										주문하실 상품의 제품명과 수량을 정확히 확인해 주세요.</h4>
								</div>
							</header>
							<main data-v-7f39deaa="" class="desktop-body">
								<section data-v-7f39deaa="" class="desktop-body-title-wrap">
									<div data-v-7f39deaa="" class="desktop-body-title-img-wrap">
										<img data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-product@3x.png"
											alt="상품정보 아이콘" class="desktop-body-title-img">
									</div>
									<h4 data-v-7f39deaa="" class="desktop-body-title">상품 정보</h4>
								</section>
								<section data-v-7f39deaa="" class="desktop-body-table-wrap">
									<header data-v-7f39deaa="" class="desktop-body-table-header">
										<div data-v-7f39deaa="" class="desktop-body-table-header-left">
											<div data-v-7f39deaa=""
												class="desktop-body-table-check-all-wrap">
												<input type="checkbox" name="point-check-all" id="point-check-all" class ="point-check-all">
												&nbsp;<span>전체 선택</span>
											</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column info">상품 정보</div>
										</div>
										<div data-v-7f39deaa=""
											class="desktop-body-table-header-right">
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column quantity">수량</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column price">가격</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column total-price">
												상품 금액</div>
										</div>
									</header>
									<main data-v-7f39deaa="" class="desktop-body-table-body">
<!-- 										<ul data-v-7f39deaa="" class="desktop-body-table-list"> -->
											<!-- 담아주기 -->
											<section data-v-7f39deaa="" class="desktop-body-no-item-wrap">
												<div data-v-7f39deaa="" class="desktop-body-no-item-content-wrap">
													<div data-v-7f39deaa="" class="desktop-body-no-item-img-wrap">
														<img data-v-7f39deaa="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_cart_empty.png" alt="장바구니가 비었습니다." class="desktop-body-no-item-img">
													</div> 
													<span data-v-7f39deaa="" class="desktop-body-no-item-text">장바구니에 담긴 상품이 없습니다 :(</span> 
													<span data-v-7f39deaa="" class="desktop-body-no-item-text"></span>
												</div> 
												<button data-v-a1c889e0="" data-v-7f39deaa="" type="button" title="" class="button desktop-body-no-item-btn button--outline2">
													<span data-v-a1c889e0="" class="button__wrap">상품 담으러 가기</span>
												</button>
											</section>

<!-- 										</ul> -->
									</main>
									<footer data-v-7f39deaa="" class="desktop-body-table-footer">
										<div data-v-7f39deaa="" class="desktop-body-table-footer-left">
											<div data-v-7f39deaa=""a
												class="desktop-body-table-check-all-wrap">
												<input type="checkbox" name="point-check-all" id="point-check-all" class ="point-check-all">
												&nbsp;<span>전체 선택</span>

											</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-footer-btns-wrap">
												<div data-v-7f39deaa=""
													class="desktop-body-table-footer-btn-wrap">
													<button data-v-a1c889e0="" data-v-7f39deaa="" type="button"
														title=""
														class="button desktop-body-table-footer-btn button--outline2 select">
														<span data-v-a1c889e0="" class="button__wrap">선택 삭제</span>
													</button>
												</div>
												<div data-v-7f39deaa=""
													class="desktop-body-table-footer-btn-wrap">
													<button data-v-a1c889e0="" data-v-7f39deaa="" type="button"
														title=""
														class="button desktop-body-table-footer-btn button--outline2 all">
														<span data-v-a1c889e0="" class="button__wrap">전체 삭제</span>
													</button>
												</div>
											</div>
										</div>
										<div data-v-7f39deaa=""
											class="desktop-body-table-footer-right">
											<span data-v-7f39deaa=""
												class="desktop-body-table-footer-price">0 원
											</span>
										</div>
									</footer>
								</section>
							</main>
							<footer data-v-7f39deaa="" class="desktop-footer">
								<section data-v-7f39deaa="" class="desktop-footer-price-wrap">
									<div data-v-7f39deaa=""
										class="desktop-footer-price-content-wrap">
										<div data-v-7f39deaa="" class="desktop-footer-price-box">
											<div data-v-7f39deaa="" class="desktop-footer-price-top">상품
												금액</div>
											<div data-v-7f39deaa="" class="desktop-footer-price-bottom price">
												0 원
											</div>
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-icon-wrap">
											<img data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-minus@2x.png"
												alt="뺴기 아이콘" class="desktop-footer-icon">
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-price-box">
											<div data-v-7f39deaa="" class="desktop-footer-price-top">할인
												금액</div>
											<div data-v-7f39deaa="" class="desktop-footer-price-bottom dc">
												0 원
											</div>
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-icon-wrap">
											<img data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-equal@2x.png"
												alt="등호 아이콘" class="desktop-footer-icon">
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-price-box">
											<div data-v-7f39deaa="" class="desktop-footer-price-top">결제
												예상 금액</div>
											<div data-v-7f39deaa=""
												class="desktop-footer-price-bottom discounted">0 원
											</div> 
										</div>
									</div>
								</section>
								<section data-v-7f39deaa="" class="desktop-footer-btn-wrap">
									<button data-v-a1c889e0="" data-v-7f39deaa="" type="button"
										title="" class="button desktop-footer-btn">
										<span data-v-a1c889e0="" class="button__wrap">주문하기</span>
									</button>
								</section>
							</footer>
						</section>
					</section>
				</div>

			</main>
		</div>
	</div>
	



	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>