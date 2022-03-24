<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myPayInfo"/>
<!DOCTYPE html>
<html>
<head>

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
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
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
<link href="${path}/style2.css?ver=1" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
function page_move(tagNum){
   var f = document.paging; //폼 name
   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
   f.action="tapPage.do";//이동할 페이지
   f.method="post";//POST방식
   f.submit();
}

function payDetailInfoPage(payNum){ // 결제 고유 번호를 통해 주문 상세정보로 이동
	var form = document.createElement('form'); // 폼객체 생성
	
	var objs1;
    objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
    objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
    objs1.setAttribute('name', 'payment_code'); // 객체이름
    objs1.setAttribute('value', payNum); //객체값
    form.appendChild(objs1);
    
    form.setAttribute('method', 'post'); //get,post 가능
    form.setAttribute('action', "myPayDetailInfo.do"); //보내는 url
    document.body.appendChild(form);
    form.submit();
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
    		if(Math.abs(lastScrollTop - st) <= delta) return;
    		if((st > lastScrollTop) && (lastScrollTop > 0)){
    			if(window.innerWidth > 1023){
    				$(".header").css("top","-130px");
    			}else{
    				$(".header").css("top","0px");
    			}
    		}else{
    			$(".header").css("top","0px");
    		}
    		lastScrollTop = st;
    	});
    	
	    $('#logout').click(function(){
			$.ajax({
				url : 'logout.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
		})
		
		$(document).on('click', '#closeModal', function(){
			$('.swal2-container').detach();
		})
		
		
		// 일반주문 탭
		$(document).on('click', '.nav-tab__wrap button:even', function(){
			$(this).parent('div').attr('class', 'on');
			$(this).parent('div').siblings('div').attr('class', '');
			$.ajax({
				url : 'myPayInfoAjax.do',
				dataType : 'html',
				success : function(htmlOut){
					$('.orders').children('ul').detach();
					$('.nav-paginate-wrap').detach();
					$('.error-list').detach();
					$('.orders').append(htmlOut);
				}
			})
		})
		
		
		// 정기배송 탭
		$(document).on('click', '.nav-tab__wrap button:odd', function(){
			$(this).parent('div').attr('class', 'on');
			$(this).parent('div').siblings('div').attr('class', '');
			$.ajax({
				url : 'mySubPayInfoAjax.do',
				dataType : 'html',
				success : function(htmlOut){
					$('.orders').children('ul').detach();
					$('.nav-paginate-wrap').detach();
					$('.error-list').detach();
					$('.orders').append(htmlOut);
				}
			})
		})
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
				<div class="container" data-v-0f5971ec="">
					<div data-v-421abad8="" data-v-2e392260="" data-v-0f5971ec=""
						class="mypage-layout">
						<div data-v-3e2784be="" data-v-421abad8=""
							class="mypage-header mypage-layout__header">
							<div data-v-3e2784be="" class="mypage-header-info">
								<div data-v-3e2784be=""
									class="col row row--v-center mypage-header-info__profile">
									<figure data-v-3e2784be="">
										<img data-v-3e2784be="" src="/images/ico-leaf.svg" alt="">
									</figure>
									<div data-v-3e2784be="">
										<strong data-v-3e2784be="">${member.name }</strong> <span
											data-v-3e2784be="">${member.email }</span>
									</div>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">배송예정</span> <a data-v-3e2784be=""
											href="/mypage/delivery" class=""><em data-v-3e2784be="">0</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">포인트</span> <a data-v-3e2784be=""
											href="/mypage/points" class=""><em data-v-3e2784be="">0</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">보유 쿠폰</span> <a data-v-3e2784be=""
											href="/mypage/coupons" class=""><em data-v-3e2784be="">1</em></a>
									</p>
								</div>
							</div>
						</div>
						<div data-v-421abad8="" class="mypage-layout__container-wrap">
							<div data-v-421abad8="" class="mypage-layout__container">
								<aside data-v-421abad8="" class="mypage-layout__side">
									<aside data-v-e99f4992="" data-v-421abad8=""
										class="mypage-side">
										<h2 data-v-e99f4992="">마이페이지</h2>
										<ul data-v-e99f4992="">
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myPayInfo.do" aria-current="page"
												class="nuxt-link-exact-active nuxt-link-active">주문/결제 내역</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myDelivery.do" class="">배송현황</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myBesongji.do" aria-current="page">배송지 관리</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myPointSearch.do" class="">포인트 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myCouponSearch.do" class="">쿠폰 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myReviewSearch.do" class="">나의 후기</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myMemberModify.do" class="">회원정보 수정</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992="" href="#" id="logout">로그아웃</a></li>
										</ul>
									</aside>
								</aside>
								<div data-v-421abad8="" class="mypage-layout__body">
									<article data-v-2e392260="" data-v-421abad8="" class="orders">
										<header data-v-2c0651a8="" data-v-2e392260=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">주문/결제 내역</h2>
											<!---->
										</header>
										<nav data-v-610ea6d8="" data-v-2e392260=""
											class="nav-tab mypage-destination__tab" data-v-421abad8="">
											<div data-v-610ea6d8="" class="nav-tab__wrap">
												<div data-v-610ea6d8="" class="on">
													<button data-v-610ea6d8="" type="button">
														<span data-v-610ea6d8="">일반주문</span>
													</button>
												</div>
												<div data-v-610ea6d8="" class="">
													<button data-v-610ea6d8="" type="button">
														<span data-v-610ea6d8="">정기배송주문</span>
													</button>
												</div>
											</div>
										</nav>
										<!---->
										<c:if test="${check == 0}">
											<div data-v-6b53621a="" data-v-2e392260="" class="error-list"
												data-v-421abad8="">
												<p data-v-6b53621a="">주문/결제 내역이 없습니다.</p>
											</div>
										</c:if>
										<c:if test="${check > 0}">
											<c:forEach var="list1" items="${list1 }" varStatus="i">
												<c:if test="${list3[i.index].item_tag_main != 100 }">
													<ul data-v-2e392260="" data-v-421abad8="" class="orders__body">
														<li data-v-2e392260="" data-v-421abad8=""><div
																data-v-72acf1f8="" data-v-2e392260="" class="orders-item"
																data-v-421abad8="">
																<div data-v-72acf1f8="" class="orders-item__wrap">
																	<figure data-v-72acf1f8="" class="orders-item__image">
																	<!-- ${list1.payment_code} 이용해서 자바스크립트 함수 통해 주문상세보기 페이지로 이동 , todo -->
																	<!-- 쿠폰 갯수, 포인트 가지고 와야함. 배송예정은 0 고정 -->
																		<a data-v-72acf1f8="" href='javascript:void(0);' onclick="payDetailInfoPage(${list1.payment_code});"
																			class=""><i data-v-72acf1f8=""
																			style="background-image: url(&quot;${list3[i.index].item_image}&quot;);"></i></a>
																	</figure>
																	<div data-v-72acf1f8="" class="orders-item__top">
																		<div data-v-72acf1f8="" class="row--v-center">
																			<span data-v-72acf1f8=""
																				style="font-family: Roboto, sans-serif;">${list1.payment_date}</span>
																			<div data-v-72acf1f8="" class="row--v-center">
																				<c:if test="${list1.payment_delivery_type == 0}">
																					<span data-v-7f86e76e="" data-v-72acf1f8=""
																						class="round-text round-text--color-morning">
																						새벽배송
																					</span>
																				</c:if>
																				<c:if test="${list1.payment_delivery_type == 1}">
																					<span data-v-7f86e76e="" data-v-72acf1f8=""
																						class="round-text round-text--color-parcel">
																						택배배송
																					</span>
																				</c:if>
																				<!---->
																			</div>
																		</div>
																		<a data-v-72acf1f8="" href='javascript:void(0);' onclick="payDetailInfoPage(${list1.payment_code});"
																			class="row--v-center"><span data-v-72acf1f8="">주문상세보기</span>
																			<svg data-v-72acf1f8=""
																				xmlns="http://www.w3.org/2000/svg" width="24"
																				height="24" viewBox="0 0 24 24"
																				aria-labelledby="arrow-right-1" role="presentation"
																				class="icon">
																				<g fill="none" fill-rule="evenodd"> <path
																					stroke="currentColor" stroke-linecap="round"
																					stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path></g></svg></a>
																	</div>
																	<div data-v-72acf1f8=""
																		class="order-item-contents-container">
																		<div data-v-72acf1f8=""
																			class="order-item-contents-wrapper">
																			<a data-v-72acf1f8="" href='javascript:void(0);' onclick="payDetailInfoPage(${list1.payment_code});"
																				class="orders-item__head"><strong
																				data-v-72acf1f8="">
																				<c:if test="${fn:length(list2[i.index]) > 1}">
																					${list2[i.index][0].payment_item_mapping_item_name_size } ${list2[i.index][0].payment_item_mapping_item_quantity }개 외 ${(fn:length(list2[i.index]) - 1)}개
																				</c:if>
																				<c:if test="${fn:length(list2[i.index]) == 1}">
																					${list2[i.index][0].payment_item_mapping_item_name_size } ${list2[i.index][0].payment_item_mapping_item_quantity }개
																				</c:if>
																				</strong> <span data-v-72acf1f8=""
																				class="orders-item__info-price only-desktop"><em
																					data-v-72acf1f8=""><fmt:formatNumber value="${list1.payment_final_price }" pattern="#,###" /></em>원</span></a>
																			<div data-v-72acf1f8=""
																				class="order-item-complete-text-container">
																				<div data-v-72acf1f8=""
																					class="complete-order-text-wrapper">
																					<span data-v-72acf1f8=""
																						class="complete-order-text only-desktop complete">배송완료</span>
																				</div>
																			</div>
																		</div>
																		<div data-v-72acf1f8=""
																			class="orders-item__info only-mobile">
																			<span data-v-72acf1f8="" class="orders-item__info-price"><em
																				data-v-72acf1f8=""><fmt:formatNumber value="${list1.payment_final_price }" pattern="#,###" /></em>원</span>
																			<div data-v-72acf1f8="">
																				<div data-v-72acf1f8=""
																					class="order-item-complete-text-container">
																					<div data-v-72acf1f8=""
																						class="complete-order-text-wrapper">
																						<span data-v-72acf1f8=""
																							class="complete-order-text complete">배송완료</span>
																						<!---->
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<!---->
															</div>
														</li>
													</ul>
												</c:if>
											</c:forEach>
											
											
											<!---->
											<div data-v-20ad18c6="" data-v-2e392260=""
												class="nav-paginate-wrap" data-v-421abad8="">
												<div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
													<nav data-v-43f58a9c="" data-v-20ad18c6=""
														class="nav-paginate">
														<a data-v-43f58a9c="" href="#"
															class="nav-paginate__dir nav-paginate-dir-prev"
															style="opacity: 0.2;"><img data-v-43f58a9c=""
															src="/images/arrow-left@2x.png" alt="이전 페이지"
															class="nav-arrow arrow-left"></a> <strong
															data-v-43f58a9c="">1</strong> <a data-v-43f58a9c=""
															href="#" class="nav-paginate__dir nav-paginate-dir-next"
															style="opacity: 0.2;"><img data-v-43f58a9c=""
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
															data-v-43f58a9c="">1</strong> <a data-v-43f58a9c=""
															href="#" class="nav-paginate__dir nav-paginate-dir-next"
															style="opacity: 0.2;"><img data-v-43f58a9c=""
															src="/images/arrow-right@2x.png" alt="다음 페이지"
															class="nav-arrow arrow-right"></a>
													</nav>
												</div>
											</div>
										</c:if>
									</article>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-order-wrap" data-v-0f5971ec="">
					<p data-v-0f5971ec="" class="tooltip">'바로 주문'으로 간편하게!</p>
					<div class="btn-order" data-v-0f5971ec=""></div>
				</div>
				<footer class="footer" data-v-438b4fe4="" data-v-0f5971ec="">
					<div class="footer__wrap" data-v-438b4fe4="">
						<h2 class="footer__logo" data-v-438b4fe4="">
							<img src="/images/logo-20211111.png" alt="FRESHCODE"
								data-v-438b4fe4="">
							<div data-v-438b4fe4="" class=""></div>
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
							<address class="footer__address hide" data-v-438b4fe4="">
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
							<address class="footer__address help hide" data-v-438b4fe4="">
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
								<p class="footer__copyright hide" data-v-438b4fe4="">
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