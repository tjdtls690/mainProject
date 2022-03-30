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
<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
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
<link href="${path}/style.css?ver=1" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
$(function (){
	
	$(document).on('click', '#closeFinalCheck', function(){
		$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
		$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
		setTimeout(function() {
			$('.swal2-container').detach();
		}, 100);
	})
	
	$(document).on('click', '.swal2-container.swal2-center.swal2-backdrop-show', function(e){
		if (!$(e.target).hasClass("swal2-popup") && !$(e.target).hasClass("swal2-header") && !$(e.target).hasClass("swal2-content") && !$(e.target).hasClass("swal2-actions")
				&& !$(e.target).hasClass("swal2-icon") && !$(e.target).hasClass("swal2-icon-content") && !$(e.target).hasClass("swal2-html-container")) {
			$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
			$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
			setTimeout(function() {
				$('.swal2-container').detach();
			}, 100);
		}
	});


	$(document).on('click', '#sideEvent', function(){
		$(location).attr("href", "event.do");
	});
	
	$(document).on('click', '#sideBasket', function(){
		$(location).attr("href", "basket.do");
	})
	
	$(document).on('click', '.header__toggle-button', function(){
		$('html').attr('class', 'mode-popup');
		$.ajax({
			url : 'sideMune.do',
			dataType : 'html',
			success : function(htmlOut){
				$('#header-area').after(htmlOut);
			}
		})
	});
	$(document).on('click', '.side-nav__overlay', function(e){
		if (!$(e.target).hasClass(".side-nav__wrap")) {
			$('.side-nav').attr('class', 'side-nav side-nav-leave-active side-nav-leave-to');
			$('html').removeClass('mode-popup');
			setTimeout(function() {
				$('.side-nav').detach();
			}, 350);
		}
	});

	var lastScrollTop = 0,
    	delta = 90;
    	$(window).scroll(function(event){
    		var st = $(this).scrollTop();
    		if(Math.abs(lastScrollTop - st) <= delta) return;
    		if((st > lastScrollTop) && (lastScrollTop > 0)){
    			if(window.innerWidth > 1023){
    				$(".header").css("top","-130px");
    			}else{
    				$(".header").css("top","-50px");
    			}
    		}else{
    			$(".header").css("top","0px");
    		}
    		lastScrollTop = st;
    	});
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
					<form name="paging">
						<input type="hidden" name="tagMain01" value="">
						<input type="hidden" name="itemCode01" value="">
						<input type="hidden" name="tagSub01" value="">
					</form>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b4="" href="/info" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">
							
								<c:choose>
										<c:when test="${empty member.gender}">
											<a href="signup.do" data-v-30697495="">회원가입</a>
											<a data-v-30697495="" href="login.do">로그인</a>
										</c:when>
										<c:otherwise>
											<a href="myPayInfo.do" id="nickname" data-v-30697495>${member.name } <span data-v-30697495>님</span></a>
										</c:otherwise>
									</c:choose>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="main.do" class="nuxt-link-active"></a>
							<!---->
						</div>
						<nav data-v-7aa1f9b4="" class="header__menus">
							<div data-v-7aa1f9b4="">
								<div data-v-7aa1f9b4="" class="dropdown">
									<span data-v-7aa1f9b4="" class="item">전체 카테고리</span>
									<div data-v-7aa1f9b4="" class="dropdown">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(0);" class=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(200);" class=""> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(100);" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(300);" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(400);" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(500);" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(600);" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(700);" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(800);" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(1);" class="new"> 초코베리머치 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="javascript:page_move(100);" class="item">정기구독
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(200);" class="item">샐러드 </a><a
									data-v-7aa1f9b4="" href="javascript:page_move(300);" class="item">샌드위치·랩
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(1);" class="item">초코베리머치
								</a><a data-v-7aa1f9b4="" href="event.do" class="item">이벤트 </a><a
									data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
									data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 30px; height: 30px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="basket.do" class="cart-logo-wrap item"><div
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
										<!---->
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="order.do" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
								data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 30px; height: 30px;"></a> <a data-v-7aa1f9b4=""
								href="basket.do" class="cart-logo-wrap item"><div style="width: 24px; height: 24px;"
									data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
									<!---->
								</div></a>
							<nav data-v-7aa1f9b4="" class="header__toggle-button">
								<button data-v-7aa1f9b4="" type="button">
									<img data-v-7aa1f9b4=""
										src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_menu.PNG" alt="user-menu"
										style="width: 30px; height: 30px;">
								</button>
							</nav>
						</div>
					</div>
					<!---->
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