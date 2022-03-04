<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/subscribeDetail"/>
<!DOCTYPE html>
<html class="">
<head>
<style>
.gm-style-moc {
	background-color: rgba(0, 0, 0, 0.45);
	pointer-events: none;
	text-align: center;
	transition: opacity ease-in-out
}

.gm-style-mot {
	color: white;
	font-family: Roboto, Arial, sans-serif;
	font-size: 22px;
	margin: 0;
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%)
}
</style>
<style>
.gm-style img {
	max-width: none;
}

.gm-style {
	font: 400 11px Roboto, Arial, sans-serif;
	text-decoration: none;
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
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="16x16">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="24x24">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="32x32">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="57x57">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="120x120">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="152x152">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="196x196">
<link href="${path}/style.css" rel="stylesheet" type="text/css" />
<link href="${path}/style2.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
	
	$(function(){
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
	    		if(Math.abs(lastScrollTop - st) > delta) return;
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
	})
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
			<main class="viewport" data-v-0f5971ec="">
								<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<form name="paging">
								<input type="hidden" name="tagMain01" value="">
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
								<span data-v-7aa1f9b4="">1:1문의</span> <a data-v-7aa1f9b4=""
									href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank">B2B
									신청</a>
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
				<div class="container"
					data-v-0f5971ec="">
					<div data-v-32a18372="" data-v-0f5971ec="" class="menu__container">
						<article data-v-32a18372="" class="menu">
							<div data-v-32a18372="" id="menu__head" class="menu__head">
								<figure data-v-32a18372="" class="menu__image">
									<div data-v-32a18372="" class="menu-badge">
										<!---->
									</div>
									<img data-v-32a18372=""
										src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/818_20211227174326"
										alt="">
								</figure>
								<div data-v-32a18372="" class="menu__body">
									<header data-v-32a18372="" class="menu__header">
										<h2 data-v-32a18372="" class="menu__name">[새벽/정기구독] 한끼
											샐러드/샌드위치 교차</h2>
										<div data-v-32a18372="" class="menu__summary">[기간] 1주-8주
											/ [배송] 주 2회 / [사이즈] M L Size</div>
										<div data-v-32a18372="" class="review">
											<div data-v-32a18372="" class="row--v-center review-wrap">
												<div data-v-32a18372="" class="review-stars">
													<img data-v-32a18372="" src="/images/icon_star_full@2x.png"><img
														data-v-32a18372="" src="/images/icon_star_full@2x.png"><img
														data-v-32a18372="" src="/images/icon_star_full@2x.png"><img
														data-v-32a18372="" src="/images/icon_star_full@2x.png">
													<img data-v-32a18372="" src="/images/icon_star_half@2x.png">
												</div>
												<div data-v-32a18372="">
													<span data-v-32a18372="" class="review-count">4.8
														(후기 2,890)</span>
												</div>
											</div>
										</div>
										<div data-v-32a18372="" class="price-wrap">
											<b data-v-32a18372="">38,606원</b> <b data-v-32a18372="">~</b>
											<del data-v-32a18372="">39,800원</del>
										</div>
										<ul data-v-32a18372="" class="menu-detail">
											<li data-v-32a18372="" class="menu-detail__describe"><label
												data-v-32a18372="" class="menu__label">상품설명</label>
												<p data-v-32a18372="" class="menu__admin-describe">
													주 6일, 하루 한끼 모두를 책임지는 식단<br> 1회 배송시 3일치 식단 배송<br>
													<br> ✔ 구성<br> 총 17종의 샐러드<br> 총 6종의 샐러드<br>
													원하는 샐러드/샌드위치로 변경 가능해요.<br> <br> ✔ 주문<br> 수령
													요일 : 화/수/금/토 중 자율 선택<br> 주문 마감 : 시작일 D-1 오전 8시<br>
													<br> ✔ 혜택<br> 구독 기간이 길어질수록 할인율이 높아져요.<br>
													추가옵션 상품도 주차별 할인율이 적용돼요.<br>
												</p> <!----></li>
											<li data-v-32a18372="" class="menu-detail__deliveryType"><div
													data-v-32a18372="" class="menu-detail__deliveryType-text">
													<label data-v-32a18372="" class="menu__label">배송 방법</label>
													<div data-v-32a18372="" class="menu-text-wrap">
														<span data-v-32a18372="" class="menu__text"
															style="color: rgb(46, 58, 130);"> 새벽배송 <span
															data-v-32a18372="" class="menu__sub-text"> (서울 전체,
																경기/인천 일부) </span></span> <span data-v-32a18372=""
															class="subs-desc-bold">밤 12시 - 새벽 7시 이내 도착</span> <span
															data-v-32a18372="" class="subs-desc">월요일부터 토요일까지
															배송됩니다.</span>
													</div>
												</div></li>
										</ul>
										<!---->
										<div data-v-2706028c="" data-v-32a18372=""
											class="menu-select-panel">
											<div data-v-2706028c="" class="menu__select-size">
												<ul data-v-2706028c="" class="menu__select-size-list normal">
													<li data-v-2706028c="" class="menu__options"><label
														data-v-2706028c="" class="menu__label">사이즈 선택</label>
														<div data-v-2706028c="" class="row--v-center">
															<div data-v-2706028c="" class="row--v-center radio-label">
																<label data-v-3f971378="" data-v-2706028c=""
																	class="form-radio"><input data-v-3f971378=""
																	id="Medium" type="radio" name="menu-sizeboth"
																	class="form-radio-input" value="Medium"> <span
																	data-v-3f971378="" class="form-radio-circle"><i
																		data-v-3f971378="" class="form-radio-circle-interior"></i></span>
																	Medium </label> <label data-v-2706028c="" for="Medium"
																	class="radio-side-text">Medium</label>
															</div>
															<div data-v-2706028c="" class="row--v-center radio-label">
																<label data-v-3f971378="" data-v-2706028c=""
																	class="form-radio"><input data-v-3f971378=""
																	id="Large" type="radio" name="menu-sizeboth"
																	class="form-radio-input" value="Large"> <span
																	data-v-3f971378="" class="form-radio-circle"><i
																		data-v-3f971378="" class="form-radio-circle-interior"></i></span>
																	Medium </label> <label data-v-2706028c="" for="Large"
																	class="radio-side-text">Large</label>
															</div>
														</div></li>
													<li data-v-2706028c="" class="menu__period-select"><label
														data-v-2706028c="" class="menu__label only-desktop">기간
															선택</label>
														<div data-v-4837bb91="" data-v-2706028c=""
															class="dropdown-btn-flex-wrap both-style">
															<div data-v-4837bb91="" class="dropdown-btn">
																<div data-v-4837bb91="" class="button dropdown">
																	<div data-v-4837bb91="" class="">기간 선택(기간이 길수록 더
																		많이 할인됩니다)</div>
																</div>
																<!---->
															</div>
														</div></li>
													<li data-v-2706028c="" class="menu__date-select"><label
														data-v-2706028c="" class="menu__label only-desktop">시작일(수령일)
															선택</label>
														<div data-v-2706028c="" class="date-picker-with-icon">
															<span data-v-56ae83be="" data-v-2706028c=""
																disabled="disabled" class="v-date-custom"><input
																data-v-2706028c="" data-v-56ae83be=""
																disabled="disabled" placeholder="시작일 선택"
																readonly="readonly" type="input"
																class="date-picker-input">
															<div data-v-7605e1b2="" data-v-56ae83be=""
																	class="vc-popover-content-wrapper">
																	<!---->
																</div></span> <img data-v-2706028c=""
																src="/images/icon-calendar-active@3x.png"
																alt="시작일 선택 달력 아이콘" class="date-select-calendar-icon"
																style="cursor: pointer;">
														</div></li>
												</ul>
												<!---->
											</div>
											<div data-v-2706028c="" class="menu__price">
												<label data-v-2706028c=""
													class="menu__label menu__price-label"> 상품 금액 </label>
												<div data-v-2706028c="" class="menu__price-right">
													<!---->
													<div data-v-2706028c=""
														class="menu__price-current-price__wrapper">
														<!---->
														<div data-v-2706028c="" class="menu__price-current-price">
															0원</div>
													</div>
												</div>
											</div>
										</div>
									</header>
									<nav data-v-32a18372="" class="menu__button-order-body">
										<div data-v-32a18372="" class="row--v-center"
											style="width: 100%; flex-wrap: nowrap;">
											<!---->
											<div data-v-32a18372="" class="purchase-btn-wrap"
												style="width: 100%;">
												<button data-v-a1c889e0="" data-v-32a18372="" type="button"
													title="" class="button button">
													<span data-v-a1c889e0="" class="button__wrap">구독하기</span>
												</button>
											</div>
										</div>
										<div data-v-32a18372="" class="morning-delivery-wrap">
											<svg data-v-32a18372="" version="1.1"
												xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
												viewBox="0 0 512 512" xml:space="preserve">
												<g data-v-32a18372="">
												<path data-v-32a18372="" fill="currentColor"
													d="M256,0C153.755,0,70.573,83.182,70.573,185.426c0,126.888,165.939,313.167,173.004,321.035
                c6.636,7.391,18.222,7.378,24.846,0c7.065-7.868,173.004-194.147,173.004-321.035C441.425,83.182,358.244,0,256,0z M256,278.719
                c-51.442,0-93.292-41.851-93.292-93.293S204.559,92.134,256,92.134s93.291,41.851,93.291,93.293S307.441,278.719,256,278.719z"></path></g></svg>
											<div data-v-32a18372="">새벽배송 가능지역 조회</div>
										</div>
									</nav>
								</div>
							</div>
							<article data-v-3ebe8eb0="" data-v-32a18372="" class="reco-index">
								<header data-v-3ebe8eb0=""
									class="row--v-center reco-index__header">
									<div data-v-3ebe8eb0="" class="col reco-title-wrap">
										<img data-v-3ebe8eb0="" src="/images/icon-like@2x.png"
											alt="다른 고객들이 함께 본 상품" class="reco-title-img">
										<h2 data-v-3ebe8eb0="">다른 고객들이 함께 본 상품</h2>
									</div>
									<nav data-v-3ebe8eb0="">
										<button data-v-3ebe8eb0="" type="button">
											<svg data-v-3ebe8eb0="" xmlns="http://www.w3.org/2000/svg"
												width="24" height="24" viewBox="0 0 24 24"
												aria-labelledby="close" role="presentation" class="icon">
												<g fill="none" fill-rule="evenodd"> <path
													fill="currentColor" fill-rule="evenodd"
													d="M12.707 12l7.647 7.646a.5.5 0 0 1-.708.708L12 12.707l-7.646 7.647a.5.5 0 0 1-.708-.708L11.293 12 3.646 4.354a.5.5 0 1 1 .708-.708L12 11.293l7.646-7.647a.5.5 0 0 1 .708.708L12.707 12z"></path></g></svg>
										</button>
									</nav>
								</header>
								<div data-v-3ebe8eb0="" class="reco-index__list">
									<div data-v-3ebe8eb0="">
										<span id="carousel_prev_59r94zrwju" style="display: none;"></span>
										<div id="carousel_uczbrmpovc"
											class="owl-carousel owl-theme owl-loaded owl-drag">
											<div class="owl-stage-outer">
												<div class="owl-stage"
													style="transform: translate3d(-1160px, 0px, 0px); transition: all 0s ease 0s; width: 5800px;">
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-821"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-821">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-821">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/821_20211227174531"
																			alt="" class="for-loop-cloned-item-821">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-821">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-821"> [새벽/정기구독]
																			한끼 도시락</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-821">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-821">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-821">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-821">32,010</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-821">[기간] 1주-8주 /
																			[배송] 주 1회</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-901"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-901">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-901">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/901_20220223131311.jpg"
																			alt="" class="for-loop-cloned-item-901">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-901">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-901">[스팟/정기구독]
																			베스트 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-901">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-901">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-901">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-901">37,636</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-901">[기간] 1주 /
																			[배송] 주 5회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-904"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-904">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-904">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/904_20220224113205.jpg"
																			alt="" class="for-loop-cloned-item-904">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-904">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-904">[스팟/정기구독]
																			매니아 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-904">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-904">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-904">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-904">8,730</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-904">[기간] 1주 /
																			[배송] 주 5회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-439"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-439">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-439">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/439_20211227174954"
																			alt="" class="for-loop-cloned-item-439">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-439">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-439">[스팟/정기구독]
																			한끼 샐러드 주3일</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-439">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-439">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-439">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-439">18,915</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-439">[기간] 1주-8주 /
																			[배송] 주 3회 / [사이즈] M or L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item active"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-899"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-899">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-899">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/899_20220223131425.jpg"
																			alt="" class="for-loop-cloned-item-899">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-899">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-899">[새벽/정기구독]
																			베스트 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-899">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-899">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-899">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-899">44,911</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-899">[기간] 1주 /
																			[배송] 주 2회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item active"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-902"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-902">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-902">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/902_20220224113234.jpg"
																			alt="" class="for-loop-cloned-item-902">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-902">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-902">[새벽/정기구독]
																			매니아 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-902">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-902">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-902">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-902">48,209</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-902">[기간] 1주 /
																			[배송] 주 2회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item active"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-442"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-442">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-442">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/442_20211227174908"
																			alt="" class="for-loop-cloned-item-442">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-442">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-442">[새벽/정기구독]
																			한끼 샐러드 주3일</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-442">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-442">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-442">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-442">36,660</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-442">[기간] 2주-8주 /
																			[배송] 주 1회 / [사이즈] M/L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item active"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-432"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-432">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-432">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/432_20211227175213"
																			alt="" class="for-loop-cloned-item-432">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-432">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-432">[새벽/정기구독]
																			한끼 샐러드 주6일</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-432">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-432">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-432">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-432">37,830</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-432">[기간] 1주-8주 /
																			[배송] 주 2회 / [사이즈] M/L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-825"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-825">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-825">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/825_20211227173835"
																			alt="" class="for-loop-cloned-item-825">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-825">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-825"> [새벽/정기구독]
																			600kcal 유지어터</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-825">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-825">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-825">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-825">70,080</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-825">[기간] 1주-8주 /
																			[배송] 주 2회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-667"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-667">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-667">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/667_20211227174743"
																			alt="" class="for-loop-cloned-item-667">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-667">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-667">[새벽/정기구독]
																			900kcal 집중관리</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-667">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-667">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-667">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-667">94,734</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-667">[기간] 1주-8주 /
																			[배송] 주 2회 / [사이즈] M Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-434"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-434">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-434">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/434_20211227175159"
																			alt="" class="for-loop-cloned-item-434">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-434">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-434">[새벽/정기구독]
																			두끼 샐러드+샐러드</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-434">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-434">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-434">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-434">74,880</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-434">[기간] 1주-8주 /
																			[배송] 주 2회 / [사이즈] M/L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-435"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-435">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-435">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/435_20211227175134"
																			alt="" class="for-loop-cloned-item-435">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-435">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-435">[새벽/정기구독]
																			두끼 샐러드+도시락</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-435">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-435">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-435">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-435">69,120</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-435">[기간] 1주-8주 /
																			[배송] 주 2회 / [사이즈] M/L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-821"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-821">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-821">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/821_20211227174531"
																			alt="" class="for-loop-cloned-item-821">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-821">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-821"> [새벽/정기구독]
																			한끼 도시락</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-821">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-821">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-821">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-821">32,010</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-821">[기간] 1주-8주 /
																			[배송] 주 1회</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-901"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-901">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-901">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/901_20220223131311.jpg"
																			alt="" class="for-loop-cloned-item-901">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-901">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-901">[스팟/정기구독]
																			베스트 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-901">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-901">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-901">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-901">37,636</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-901">[기간] 1주 /
																			[배송] 주 5회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-904"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-904">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-904">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/904_20220224113205.jpg"
																			alt="" class="for-loop-cloned-item-904">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-904">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-904">[스팟/정기구독]
																			매니아 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-904">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-904">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-904">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-904">8,730</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-904">[기간] 1주 /
																			[배송] 주 5회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-439"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-439">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-439">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/439_20211227174954"
																			alt="" class="for-loop-cloned-item-439">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-439">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-439">[스팟/정기구독]
																			한끼 샐러드 주3일</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-439">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-439">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-439">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-439">18,915</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-439">[기간] 1주-8주 /
																			[배송] 주 3회 / [사이즈] M or L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-899"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-899">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-899">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/899_20220223131425.jpg"
																			alt="" class="for-loop-cloned-item-899">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-899">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-899">[새벽/정기구독]
																			베스트 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-899">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-899">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-899">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-899">44,911</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-899">[기간] 1주 /
																			[배송] 주 2회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-902"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-902">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-902">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/902_20220224113234.jpg"
																			alt="" class="for-loop-cloned-item-902">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-902">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-902">[새벽/정기구독]
																			매니아 일주일 맛보기 </strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-902">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-902">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-902">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-902">48,209</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-902">[기간] 1주 /
																			[배송] 주 2회 / [사이즈] M L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-442"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-442">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-442">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/442_20211227174908"
																			alt="" class="for-loop-cloned-item-442">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-442">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-442">[새벽/정기구독]
																			한끼 샐러드 주3일</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-442">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-442">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-442">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-442">36,660</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-442">[기간] 2주-8주 /
																			[배송] 주 1회 / [사이즈] M/L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-item cloned"
														style="width: 266px; margin-right: 24px;">
														<div data-v-3ebe8eb0="">
															<div data-v-26ece326="" data-v-3ebe8eb0=""
																class="item for-loop-cloned-item-432"
																is-loop-carousel="true">
																<div data-v-26ece326=""
																	class="item-wrap for-loop-cloned-item-432">
																	<figure data-v-26ece326=""
																		class="item__image for-loop-cloned-item-432">
																		<img data-v-26ece326=""
																			src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/432_20211227175213"
																			alt="" class="for-loop-cloned-item-432">
																		<!---->
																		<!---->
																	</figure>
																	<div data-v-26ece326=""
																		class="item__body for-loop-cloned-item-432">
																		<strong data-v-26ece326=""
																			class="for-loop-cloned-item-432">[새벽/정기구독]
																			한끼 샐러드 주6일</strong>
																		<div data-v-26ece326=""
																			class="options for-loop-cloned-item-432">
																			<dl data-v-26ece326=""
																				class="row--v for-loop-cloned-item-432">
																				<dd data-v-26ece326=""
																					class="for-loop-cloned-item-432">
																					<em data-v-26ece326=""
																						class="for-loop-cloned-item-432">37,830</em>~
																				</dd>
																			</dl>
																		</div>
																		<span data-v-26ece326=""
																			class="for-loop-cloned-item-432">[기간] 1주-8주 /
																			[배송] 주 2회 / [사이즈] M/L Size</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="owl-nav">
												<div class="owl-prev">next</div>
												<div class="owl-next">prev</div>
											</div>
											<div class="owl-dots disabled"></div>
										</div>
										<span id="carousel_next_tbuxelza8pq"></span>
									</div>
								</div>
								<!---->
							</article>
							<div data-v-32a18372="" class="menu__tab">
								<nav data-v-61e19c34="" data-v-32a18372="" class="menu-tab unit">
									<div data-v-61e19c34="" class="menu-tab-btn-wrap on">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">상품정보</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="menu-tab-btn-wrap">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">상세정보</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="menu-tab-btn-wrap">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">FAQ</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="menu-tab-btn-wrap">
										<button data-v-61e19c34="" type="button">
											<span data-v-61e19c34="">고객후기</span>
										</button>
									</div>
									<div data-v-61e19c34="" class="desktop-tab-blank"></div>
								</nav>
							</div>
							<div data-v-32a18372="" class="menu-description-container">
								<div data-v-32a18372="" class="menu-description">
									<div data-v-32a18372="" class="menu-description-left">
										<div data-v-32a18372="" id="menu-detail"
											class="menu__tab-info">
											<div data-v-79f00ef9="" data-v-32a18372="" class="menu-info">
												<div data-v-79f00ef9="" class="detail-wrapper">
													<div data-v-79f00ef9="" id="bundle-detail" class="detail">
														<div data-v-79f00ef9="" class="img-wrapper">
															<div data-v-79f00ef9="" id="gtm-div-sub-0">
																<img data-v-79f00ef9=""
																	src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11487_20211216154038"
																	class="hide-image">
															</div>
															<div data-v-79f00ef9="" id="gtm-div-sub-1">
																<img data-v-79f00ef9=""
																	src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11712_20220120153836"
																	class="click img-fade">
															</div>
															<div data-v-79f00ef9="" id="gtm-div-sub-2">
																<img data-v-79f00ef9=""
																	src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/12120_20220304175234"
																	class="img-fade">
															</div>
															<div data-v-79f00ef9="" id="gtm-div-sub-3">
																<img data-v-79f00ef9=""
																	src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/12121_20220304175235"
																	class="img-fade">
															</div>
															<div data-v-79f00ef9="" id="gtm-div-sub-4">
																<img data-v-79f00ef9=""
																	src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/12122_20220304175235"
																	class="img-fade">
															</div>
															<div data-v-79f00ef9="" id="gtm-div-sub-5">
																<img data-v-79f00ef9=""
																	src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11489_20211216154039"
																	class="img-fade">
															</div>
															<div data-v-79f00ef9="" id="gtm-div-sub-6">
																<img data-v-79f00ef9=""
																	src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11488_20211216154039"
																	class="img-fade">
															</div>
															<div data-v-79f00ef9="" class="shadow"></div>
														</div>
													</div>
													<div data-v-79f00ef9="" class="more-btn">
														<span data-v-79f00ef9="" class="more-btn-text">상품정보
															더보기</span> <img data-v-79f00ef9=""
															src="/images/arrow-down-green@2x.png" alt="상세정보 접기 화살표"
															class="more-btn-arrow">
													</div>
												</div>
											</div>
										</div>
										<div data-v-32a18372="" class="menu__tab-info delivery">
											<h1 data-v-32a18372="" class="menu__tab-info-title delivery">배송
												정보</h1>
											<div data-v-79f00ef9="" data-v-32a18372="" class="menu-info">
												<div data-v-79f00ef9="">
													<img data-v-79f00ef9=""
														src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11450_20211215152749"
														class="img-fade">
												</div>
											</div>
										</div>
									</div>
									<div data-v-32a18372="" class="menu-select-panel-desktop">
										<h4 data-v-32a18372="">상품 선택</h4>
										<div data-v-2706028c="" data-v-32a18372=""
											class="menu-select-panel floating-panel-default">
											<div data-v-2706028c="" class="menu__select-size"
												style="border-bottom: 0px;">
												<ul data-v-2706028c="" class="menu__select-size-list normal">
													<li data-v-2706028c="" class="menu__options"><label
														data-v-2706028c="" class="menu__label"
														style="width: 108px;">사이즈 선택</label>
														<div data-v-2706028c="" class="row--v-center">
															<div data-v-2706028c="" class="row--v-center radio-label">
																<label data-v-3f971378="" data-v-2706028c=""
																	class="form-radio"><input data-v-3f971378=""
																	id="Medium" type="radio" name="menu-sizedesktop"
																	class="form-radio-input" value="Medium"> <span
																	data-v-3f971378="" class="form-radio-circle"><i
																		data-v-3f971378="" class="form-radio-circle-interior"></i></span>
																	Medium </label> <label data-v-2706028c="" for="Medium"
																	class="radio-side-text">Medium</label>
															</div>
															<div data-v-2706028c="" class="row--v-center radio-label">
																<label data-v-3f971378="" data-v-2706028c=""
																	class="form-radio"><input data-v-3f971378=""
																	id="Large" type="radio" name="menu-sizedesktop"
																	class="form-radio-input" value="Large"> <span
																	data-v-3f971378="" class="form-radio-circle"><i
																		data-v-3f971378="" class="form-radio-circle-interior"></i></span>
																	Medium </label> <label data-v-2706028c="" for="Large"
																	class="radio-side-text">Large</label>
															</div>
														</div></li>
													<li data-v-2706028c="" class="menu__period-select">
														<!---->
														<div data-v-4837bb91="" data-v-2706028c=""
															class="dropdown-btn-flex-wrap">
															<div data-v-4837bb91="" class="dropdown-btn">
																<div data-v-4837bb91="" class="button dropdown">
																	<div data-v-4837bb91="" class="">기간 선택(기간이 길수록 더
																		많이 할인됩니다)</div>
																</div>
																<!---->
															</div>
														</div>
													</li>
													<li data-v-2706028c="" class="menu__date-select">
														<!---->
														<div data-v-2706028c="" class="date-picker-with-icon">
															<span data-v-56ae83be="" data-v-2706028c=""
																disabled="disabled" class="v-date-custom"><input
																data-v-2706028c="" data-v-56ae83be=""
																disabled="disabled" placeholder="시작일 선택"
																readonly="readonly" type="input"
																class="date-picker-input">
															<div data-v-7605e1b2="" data-v-56ae83be=""
																	class="vc-popover-content-wrapper">
																	<!---->
																</div></span> <img data-v-2706028c=""
																src="/images/icon-calendar-active@3x.png"
																alt="시작일 선택 달력 아이콘" class="date-select-calendar-icon"
																style="cursor: pointer;">
														</div>
													</li>
												</ul>
												<!---->
											</div>
											<div data-v-2706028c="" class="menu__price isDesktop">
												<label data-v-2706028c=""
													class="menu__label menu__price-label" style="width: 108px;">
													상품 금액 </label>
												<div data-v-2706028c="" class="menu__price-right">
													<!---->
													<div data-v-2706028c=""
														class="menu__price-current-price__wrapper">
														<!---->
														<div data-v-2706028c="" class="menu__price-current-price">
															0원</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-32a18372="" class="row--v-center"
											style="width: 100%; flex-wrap: nowrap;">
											<!---->
											<div data-v-32a18372="" class="purchase-btn-wrap"
												style="width: 100%;">
												<button data-v-a1c889e0="" data-v-32a18372="" type="button"
													title="" class="button button" style="height: 52px;">
													<span data-v-a1c889e0="" class="button__wrap">구독하기</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div data-v-32a18372="" id="product-info">
									<h3 data-v-32a18372="" class="menu__tab-info-title menu-info">
										<span data-v-32a18372="">상품 정보 고시</span>
										<div data-v-32a18372="" class="info-title-img"></div>
									</h3>
									<!---->
								</div>
								<div data-v-32a18372="" id="nutrition-info">
									<h3 data-v-32a18372="" class="menu__tab-info-title menu-info">
										<span data-v-32a18372="">영양 정보 고시</span>
										<div data-v-32a18372="" class="info-title-img"></div>
									</h3>
									<!---->
								</div>
								<div data-v-32a18372="" id="faq"
									class="menu__tab-info tab_menu_detail" style="">
									<p data-v-32a18372="" class="menu__tab-info-title faq">FAQ</p>
									<div data-v-e3f957fc="" data-v-32a18372=""
										class="menu-info-table-wrap">
										<div data-v-e3f957fc="" class="menu-info-table-opener"
											style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc="" src="/images/fa-question@2x.png"
													alt="질문 아이콘" class="menu-info-table-img question">
												<p data-v-e3f957fc="" class="menu-info-table-title">[결제
													안내]</p>
											</div>
											<img data-v-e3f957fc="" src="/images/arrow-down@2x.png"
												alt="질문 화살표" class="menu-info-table-opener-arrow">
										</div>
										<!---->
									</div>
									<div data-v-e3f957fc="" data-v-32a18372=""
										class="menu-info-table-wrap">
										<div data-v-e3f957fc="" class="menu-info-table-opener"
											style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc="" src="/images/fa-question@2x.png"
													alt="질문 아이콘" class="menu-info-table-img question">
												<p data-v-e3f957fc="" class="menu-info-table-title">[주문단계안내]</p>
											</div>
											<img data-v-e3f957fc="" src="/images/arrow-down@2x.png"
												alt="질문 화살표" class="menu-info-table-opener-arrow">
										</div>
										<!---->
									</div>
									<div data-v-e3f957fc="" data-v-32a18372=""
										class="menu-info-table-wrap">
										<div data-v-e3f957fc="" class="menu-info-table-opener"
											style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc="" src="/images/fa-question@2x.png"
													alt="질문 아이콘" class="menu-info-table-img question">
												<p data-v-e3f957fc="" class="menu-info-table-title">[취소
													및 환불 안내]</p>
											</div>
											<img data-v-e3f957fc="" src="/images/arrow-down@2x.png"
												alt="질문 화살표" class="menu-info-table-opener-arrow">
										</div>
										<!---->
									</div>
									<div data-v-e3f957fc="" data-v-32a18372=""
										class="menu-info-table-wrap">
										<div data-v-e3f957fc="" class="menu-info-table-opener"
											style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc="" src="/images/fa-question@2x.png"
													alt="질문 아이콘" class="menu-info-table-img question">
												<p data-v-e3f957fc="" class="menu-info-table-title">[배송
													안내]</p>
											</div>
											<img data-v-e3f957fc="" src="/images/arrow-down@2x.png"
												alt="질문 화살표" class="menu-info-table-opener-arrow">
										</div>
										<!---->
									</div>
									<div data-v-e3f957fc="" data-v-32a18372=""
										class="menu-info-table-wrap">
										<div data-v-e3f957fc="" class="menu-info-table-opener"
											style="border-bottom: 1px solid rgb(233, 233, 233);">
											<div data-v-e3f957fc="" class="menu-info-table-title-wrapper">
												<img data-v-e3f957fc="" src="/images/fa-question@2x.png"
													alt="질문 아이콘" class="menu-info-table-img question">
												<p data-v-e3f957fc="" class="menu-info-table-title">[기타
													사항(자주 묻는 질문)]</p>
											</div>
											<img data-v-e3f957fc="" src="/images/arrow-down@2x.png"
												alt="질문 화살표" class="menu-info-table-opener-arrow">
										</div>
										<!---->
									</div>
								</div>
							</div>
							<div data-v-32a18372="" class="menu__tab-review" id="review">
								<a data-v-32a18372="" href="/mypage/review" class=""><div
										data-v-32a18372="" class="menu__tab-review-banner"></div></a>
								<div data-v-f8b893b0="" data-v-32a18372="" class="menu-review">
									<section data-v-f8b893b0="" class="menu-review__album">
										<h3 data-v-f8b893b0="" class="menu-review__album-title">
											고객 후기 사진 (13)</h3>
										<div data-v-f8b893b0="" class="images">
											<div data-v-f8b893b0="">
												<span id="carousel_prev_q0wbctuwunf" style=""></span>
												<div id="carousel_8blt08p8ty9"
													class="owl-carousel owl-theme owl-loaded">
													<div class="owl-stage-outer">
														<div class="owl-stage"
															style="transform: translate3d(-1159px, 0px, 0px); transition: all 0s ease 0s; width: 4834px;">
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="7"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46340_20220224162011&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="8"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46299_20220223225102&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="9"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46269_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="10"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46270_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="11"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46142_20220222113647&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="12"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46101_20220221172529&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="0"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46625_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="1"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46626_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="2"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46618_20220302182048&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="3"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46472_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="4"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46473_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item active"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="5"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46385_20220225113317&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="6"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46386_20220225113317&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="7"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46340_20220224162011&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="8"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46299_20220223225102&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="9"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46269_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="10"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46270_20220223154934&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="11"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46142_20220222113647&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="12"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46101_20220221172529&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="0"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46625_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="1"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46626_20220302211702&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="2"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46618_20220302182048&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="3"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46472_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="4"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46473_20220227221307&quot;);"></i></a>
																</div>
															</div>
															<div class="owl-item cloned"
																style="width: 169.333px; margin-right: 24px;">
																<div data-v-f8b893b0="" class="images__image">
																	<a data-v-f8b893b0="" href="#"><i
																		data-v-f8b893b0="" id="5"
																		style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46385_20220225113317&quot;);"></i></a>
																</div>
															</div>
														</div>
													</div>
													<div class="owl-nav">
														<div class="owl-prev">next</div>
														<div class="owl-next">prev</div>
													</div>
													<div class="owl-dots disabled"></div>
												</div>
												<span id="carousel_next_uy1tpo86erk"></span>
											</div>
										</div>
									</section>
									<section data-v-f8b893b0="" class="menu-review__rating">
										<div data-v-f8b893b0="" class="wrap">
											<h3 data-v-f8b893b0="">고객 후기</h3>
											<div data-v-f8b893b0=""
												class="row--v-center review-box-wrapper">
												<div data-v-f8b893b0="" class="review-stars">
													<img data-v-f8b893b0="" src="/images/icon_star_full@2x.png"
														class="review-stars-star"><img data-v-f8b893b0=""
														src="/images/icon_star_full@2x.png"
														class="review-stars-star"><img data-v-f8b893b0=""
														src="/images/icon_star_full@2x.png"
														class="review-stars-star"><img data-v-f8b893b0=""
														src="/images/icon_star_full@2x.png"
														class="review-stars-star"> <img data-v-f8b893b0=""
														src="/images/icon_star_half@2x.png"
														class="review-stars-star">
												</div>
												<div data-v-f8b893b0="" class="review-rating-counts">
													4.8 후기 (2,890)</div>
											</div>
										</div>
									</section>
									<section data-v-f8b893b0="" class="menu-review__index">
										<ul data-v-f8b893b0="">
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">프레시코드
																샐러드는 무조건 믿고 시켜요! 바게트도 2개나 시킬 수 있어서 든든했어요^^</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">김*영</div>
														<div data-v-22105fb8="" class="text-date">2022. 03.
															02.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">프레시코드
															샐러드는 무조건 믿고 시켜요! 바게트도 2개나 시킬 수 있어서 든든했어요^^</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46625_20220302211702&quot;);"></div>
															</div>
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46626_20220302211702&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">샐러드정기구독중에
																가장 양도 많고 신선한것같아서 자주 이용하게됩니다.</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">여*연</div>
														<div data-v-22105fb8="" class="text-date">2022. 03.
															02.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">
															샐러드정기구독중에 가장 양도 많고 신선한것같아서 자주 이용하게됩니다.<br>
														</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46618_20220302182048&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">들기름메밀면
																이번에 처음 먹어봤는데 콩불고기라서 (고기냄새에 민감한) 울엄마가 냄새안나고 부드럽고 맛있다고
																하셨어요 ㅋㅋㅋ 딸기크림치즈는 드레싱이 저한테는 좀 셔서 드레싱 조금씩만 뿌려먹었음 ㅠ 전체적으로
																맛있었어요</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">임*아</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															27.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">
															들기름메밀면 이번에 처음 먹어봤는데 콩불고기라서 (고기냄새에 민감한) 울엄마가 냄새안나고 부드럽고
															맛있다고 하셨어요 ㅋㅋㅋ <br>딸기크림치즈는 드레싱이 저한테는 좀 셔서 드레싱 조금씩만
															뿌려먹었음 ㅠ 전체적으로 맛있었어요
														</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46472_20220227221307&quot;);"></div>
															</div>
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46473_20220227221307&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">샐러드 잘
																안 먹게 되서 고민하다 주문 했는데 빵순이인제게 샌드위치를 중간에 넣어줘서 행복하게 먹고 있습니다!!</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">고*나</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															25.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">샐러드
															잘 안 먹게 되서 고민하다 주문 했는데 빵순이인제게 샌드위치를 중간에 넣어줘서 행복하게 먹고
															있습니다!!</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46385_20220225113317&quot;);"></div>
															</div>
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46386_20220225113317&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">기본
																미듐사이즈로 주6일 샌드위치&amp;샐러드로 정기구독했는데 다 너무 맛있고 양도 충분해요! 몸이
																가벼워지고 건강해진 느낌이에요! 빵순이라서 샌드위치를 기대많이했는데 품절이 많아서 다양하게 못먹어본게
																아쉬워요ㅜ 그리고 맛있어서 입맛돌아서 딴게 먹고싶어요... 흡ㅜㅜ</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">히*</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															24.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">기본
															미듐사이즈로 주6일 샌드위치&amp;샐러드로 정기구독했는데 다 너무 맛있고 양도 충분해요! 몸이
															가벼워지고 건강해진 느낌이에요! 빵순이라서 샌드위치를 기대많이했는데 품절이 많아서 다양하게 못먹어본게
															아쉬워요ㅜ 그리고 맛있어서 입맛돌아서 딴게 먹고싶어요... 흡ㅜㅜ</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46340_20220224162011&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">두달째 거의
																매일 먹고 있습니다!! 아직까지 질리지않고 잘 먹고 있습니다. 최고에요!!</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">김*미</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															23.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">두달째
															거의 매일 먹고 있습니다!! 아직까지 질리지않고 잘 먹고 있습니다. 최고에요!!</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46299_20220223225102&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">가격이 좀
																비싸서 걱정했는데 생각보다 너무 맛있어서 놀랐어요.</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">강*구</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															23.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">가격이
															좀 비싸서 걱정했는데 생각보다 너무 맛있어서 놀랐어요.</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46269_20220223154934&quot;);"></div>
															</div>
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46270_20220223154934&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">맛있고
																정기배송이라 더 신선하게 자주 받아 좋아요. 바게트샌드 진심 든든하고 맛있어 강추예요! 샐러드
																맛있는건 다들 아실테고요.</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">김*아</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															22.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">
															맛있고 정기배송이라 더 신선하게 자주 받아 좋아요.<br>바게트샌드 진심 든든하고 맛있어
															강추예요!<br>샐러드 맛있는건 다들 아실테고요.
														</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46142_20220222113647&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<!---->
															<div data-v-22105fb8="" class="summary-text">정말 몸이
																건강해지는데 한 몫 합니다. 계속 주문해서 먹게 되네요.</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">김*성</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															21.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">정말
															몸이 건강해지는데 한 몫 합니다. 계속 주문해서 먹게 되네요.</div>
														<!---->
													</div>
													<!---->
												</div></li>
											<li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
													data-v-22105fb8="" class="review-item__head">
													<div data-v-22105fb8="" class="head-rating">
														<img data-v-22105fb8=""
															src="/images/icon_star_full@2x.png" alt="별점"
															class="rating-img">
														<div data-v-22105fb8="" class="rating-count">5</div>
													</div>
													<div data-v-22105fb8="" class="head-summary">
														<div data-v-22105fb8="" class="head-summary-left">
															<img data-v-22105fb8="" src="/images/pics@2x.png"
																alt="후기사진" class="summary-photo">
															<div data-v-22105fb8="" class="summary-text">프코한끼를
																하면서 주문했었습니당!! 진짜 열심히 먹게되고... 프코운동챌린지도 하고싶었는데 연속으로 뽑히는건
																무리였나봐용!다음을 노려야겠어요 ㅎㅎ</div>
														</div>
														<!---->
													</div>
													<div data-v-22105fb8="" class="head-text">
														<div data-v-22105fb8="" class="text-name">이*민</div>
														<div data-v-22105fb8="" class="text-date">2022. 02.
															21.</div>
													</div>
												</div>
												<div data-v-22105fb8=""
													class="review-desktop-toggle review-hide">
													<div data-v-22105fb8="" class="review-item__body">
														<div data-v-22105fb8="" class="review-item__comment">
															프코한끼를 하면서 주문했었습니당!!<br>진짜 열심히 먹게되고... <br>프코운동챌린지도
															하고싶었는데 연속으로 뽑히는건 무리였나봐용!다음을 노려야겠어요 ㅎㅎ
														</div>
														<div data-v-22105fb8="" class="review-item__photos">
															<div data-v-22105fb8="" class="review-item__photo-wrap">
																<div data-v-22105fb8="" class="review-item__photo"
																	style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/46101_20220221172529&quot;);"></div>
															</div>
														</div>
													</div>
													<!---->
												</div></li>
										</ul>
										<div data-v-20ad18c6="" data-v-f8b893b0=""
											class="nav-paginate-wrap">
											<div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
												<nav data-v-43f58a9c="" data-v-20ad18c6=""
													class="nav-paginate">
													<a data-v-43f58a9c="" href="#"
														class="nav-paginate__dir nav-paginate-dir-prev"
														style="opacity: 0.2;"><img data-v-43f58a9c=""
														src="/images/arrow-left@2x.png" alt="이전 페이지"
														class="nav-arrow arrow-left"></a> <strong
														data-v-43f58a9c="">1</strong><a data-v-43f58a9c=""
														href="#">2</a><a data-v-43f58a9c="" href="#">3</a><a
														data-v-43f58a9c="" href="#">4</a><a data-v-43f58a9c=""
														href="#">5</a> <a data-v-43f58a9c="" href="#"
														class="nav-paginate__dir nav-paginate-dir-next"
														style="opacity: 1;"><img data-v-43f58a9c=""
														src="/images/arrow-right@2x.png" alt="다음 페이지"
														class="nav-arrow arrow-right"></a>
												</nav>
											</div>
											<div data-v-20ad18c6="" class="nav-paginate-wrap__desktop">
												<nav data-v-43f58a9c="" data-v-20ad18c6=""
													class="nav-paginate">
													<a data-v-43f58a9c="" href="#"
														class="nav-paginate__dir nav-paginate-dir-prev"
														style="opacity: 0.2;"><img data-v-43f58a9c=""
														src="/images/arrow-left@2x.png" alt="이전 페이지"
														class="nav-arrow arrow-left"></a> <strong
														data-v-43f58a9c="">1</strong><a data-v-43f58a9c=""
														href="#">2</a><a data-v-43f58a9c="" href="#">3</a><a
														data-v-43f58a9c="" href="#">4</a><a data-v-43f58a9c=""
														href="#">5</a> <a data-v-43f58a9c="" href="#"
														class="nav-paginate__dir nav-paginate-dir-next"
														style="opacity: 1;"><img data-v-43f58a9c=""
														src="/images/arrow-right@2x.png" alt="다음 페이지"
														class="nav-arrow arrow-right"></a>
												</nav>
											</div>
										</div>
									</section>
									<!---->
								</div>
							</div>
							<div data-v-32a18372="" class="notify-register-modal">
								<!---->
							</div>
							<!---->
							<!---->
							<!---->
							<div data-v-32a18372="" class="js-mobile-panel-dim"
								style="display: none;">
								<div data-v-32a18372="" class="mobile-panel-wrap">
									<div data-v-32a18372="" class="mobile-panel-wrapper">
										<div data-v-32a18372="" class="mobile-panel">
											<div data-v-32a18372="" class="mobile-panel-header">
												<div data-v-32a18372=""
													class="mobile-panel-header-handle js-mobile-panel-header-handle">
													<img data-v-32a18372="" src="/images/arrow-up@3x.png"
														alt="모바일 판넬 핸들 이미지"
														class="mobile-panel-header-handle-arrow">
												</div>
												<div data-v-32a18372="" class="mobile-panel-header-text">[새벽/정기구독]
													한끼 샐러드/샌드위치 교차</div>
											</div>
											<div data-v-32a18372="" class="mobile-panel-content hide">
												<div data-v-2706028c="" data-v-32a18372=""
													class="menu-select-panel">
													<div data-v-2706028c="" class="menu__select-size">
														<ul data-v-2706028c=""
															class="menu__select-size-list normal">
															<li data-v-2706028c="" class="menu__options"
																style="margin-top: -4px;"><label data-v-2706028c=""
																class="menu__label">사이즈 선택</label>
																<div data-v-2706028c="" class="row--v-center">
																	<div data-v-2706028c=""
																		class="row--v-center radio-label">
																		<label data-v-3f971378="" data-v-2706028c=""
																			class="form-radio"><input data-v-3f971378=""
																			id="Medium" type="radio" name="menu-sizemobile"
																			class="form-radio-input" value="Medium"> <span
																			data-v-3f971378="" class="form-radio-circle"><i
																				data-v-3f971378=""
																				class="form-radio-circle-interior"></i></span> Medium </label> <label
																			data-v-2706028c="" for="Medium"
																			class="radio-side-text">Medium</label>
																	</div>
																	<div data-v-2706028c=""
																		class="row--v-center radio-label">
																		<label data-v-3f971378="" data-v-2706028c=""
																			class="form-radio"><input data-v-3f971378=""
																			id="Large" type="radio" name="menu-sizemobile"
																			class="form-radio-input" value="Large"> <span
																			data-v-3f971378="" class="form-radio-circle"><i
																				data-v-3f971378=""
																				class="form-radio-circle-interior"></i></span> Medium </label> <label
																			data-v-2706028c="" for="Large"
																			class="radio-side-text">Large</label>
																	</div>
																</div></li>
															<li data-v-2706028c="" class="menu__period-select">
																<!---->
																<div data-v-4837bb91="" data-v-2706028c=""
																	class="dropdown-btn-flex-wrap">
																	<div data-v-4837bb91="" class="dropdown-btn">
																		<div data-v-4837bb91="" class="button dropdown">
																			<div data-v-4837bb91="" class="">기간 선택(기간이 길수록
																				더 많이 할인됩니다)</div>
																		</div>
																		<!---->
																	</div>
																</div>
															</li>
															<li data-v-2706028c="" class="menu__date-select">
																<!---->
																<div data-v-2706028c="" class="date-picker-with-icon">
																	<span data-v-56ae83be="" data-v-2706028c=""
																		disabled="disabled" class="v-date-custom"><input
																		data-v-2706028c="" data-v-56ae83be=""
																		disabled="disabled" placeholder="시작일 선택"
																		readonly="readonly" type="input"
																		class="date-picker-input">
																	<div data-v-7605e1b2="" data-v-56ae83be=""
																			class="vc-popover-content-wrapper">
																			<!---->
																		</div></span> <img data-v-2706028c=""
																		src="/images/icon-calendar-active@3x.png"
																		alt="시작일 선택 달력 아이콘" class="date-select-calendar-icon"
																		style="cursor: pointer;">
																</div>
															</li>
														</ul>
														<!---->
													</div>
													<div data-v-2706028c="" class="menu__price">
														<label data-v-2706028c=""
															class="menu__label menu__price-label"> 상품 금액 </label>
														<div data-v-2706028c="" class="menu__price-right">
															<!---->
															<div data-v-2706028c=""
																class="menu__price-current-price__wrapper">
																<!---->
																<div data-v-2706028c=""
																	class="menu__price-current-price">0원</div>
															</div>
														</div>
													</div>
												</div>
												<div data-v-32a18372="" class="row--v-center"
													style="width: 100%; flex-wrap: nowrap;">
													<!---->
													<div data-v-32a18372="" class="purchase-btn-wrap"
														style="width: 100%;">
														<button data-v-a1c889e0="" data-v-32a18372=""
															type="button" title="" class="button button">
															<span data-v-a1c889e0="" class="button__wrap">구독하기</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										<div data-v-32a18372="" class="white-box"></div>
									</div>
									<div data-v-32a18372="" class="white-box"></div>
								</div>
							</div>
						</article>
					</div>
				</div>
				<!---->
				<footer class="footer footer-menu-detail" data-v-438b4fe4=""
					data-v-0f5971ec="">
					<div class="footer__wrap" data-v-438b4fe4="">
						<h2 class="footer__logo" data-v-438b4fe4="">
							<img src="/images/logo-20211111.png" alt="FRESHCODE"
								data-v-438b4fe4="">
							<div data-v-438b4fe4="" class="open"></div>
						</h2>
						<div class="footer__body" data-v-438b4fe4="">
							<nav class="footer__menus" data-v-438b4fe4="">
								<div class="footer__menus-item" data-v-438b4fe4="">
									<a href="#" data-v-438b4fe4="">FAQ</a> <a href="/terms"
										data-v-438b4fe4="" class="">이용약관</a> <a href="/privacy"
										data-v-438b4fe4="" class="">개인정보처리방침</a>
								</div>
								<div class="footer__menus-item" data-v-438b4fe4="">
									<a href="#" data-v-438b4fe4="">제휴문의</a> <a href="#"
										data-v-438b4fe4="">채용문의</a> <a href="#" data-v-438b4fe4="">케이터링
										문의</a>
								</div>
							</nav>
							<address class="footer__cs" data-v-438b4fe4="">
								<h3 data-v-438b4fe4="">프코고객센터</h3>
								<div class="cs-time" data-v-438b4fe4="">
									<div class="btn-channel-talk" data-v-438b4fe4="">1:1 문의하기</div>
									<div class="cs-time__inner" data-v-438b4fe4="">
										<div data-v-438b4fe4="">
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">평일</b>
												<p data-v-438b4fe4="">9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
											</div>
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">토요일</b>
												<p data-v-438b4fe4="">
													9:00 - 13:00 <span data-v-438b4fe4="">&nbsp;(홈페이지
														채팅문의만 운영)</span>
												</p>
											</div>
										</div>
										<div data-v-438b4fe4="">
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">공휴일</b>
												<p data-v-438b4fe4="">휴무</p>
											</div>
											<div class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">고객센터</b>
												<p data-v-438b4fe4="">1644-4559</p>
											</div>
										</div>
									</div>
								</div>
							</address>
							<address class="footer__address" data-v-438b4fe4="">
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
							<address class="footer__address help" data-v-438b4fe4="">
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">제휴문의</b><a href="mailto:biz@freshcode.me"
										data-v-438b4fe4="">biz@freshcode.me</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">카카오ID</b><a href="#" data-v-438b4fe4="">@프레시코드-freshcode</a>
								</p>
								<p data-v-438b4fe4="">
									<b data-v-438b4fe4="">단체주문문의</b><a
										href="mailto:order@freshcode.me" data-v-438b4fe4="">order@freshcode.me</a>
								</p>
							</address>
							<aside class="footer__side" data-v-438b4fe4="">
								<p class="footer__copyright" data-v-438b4fe4="">
									ⓒ 2020. FreshCode, Inc. All Rights Reserved<br
										data-v-438b4fe4="">프레시코드가 제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은
									특허법, 저작권법, 부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4="">무단
									복제, 유사한 변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
								</p>
								<div class="footer__sns-wrap" data-v-438b4fe4="">
									<nav class="footer__sns" data-v-438b4fe4="">
										<img src="/images/instagram@2x.png" title="instagram"
											data-v-438b4fe4="" class=""><img
											src="/images/facebook@2x.png" title="facebook"
											data-v-438b4fe4="" class=""><img
											src="/images/youtube@3x.png" title="youtube"
											data-v-438b4fe4="" class=""><img
											src="/images/group-21@2x.png" title="blog" data-v-438b4fe4=""
											class=""><img src="/images/blog-post@2x.png"
											title="Naver post" data-v-438b4fe4="" class=""><img
											src="/images/kakao-channel@2x.png" title="kakao channel"
											data-v-438b4fe4="" class="">
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