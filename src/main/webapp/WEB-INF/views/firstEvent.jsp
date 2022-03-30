<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/firstEvent"/>
<!DOCTYPE html>
<html class="">
<head>

<title>샐러딧 - 신규 회원가입 시 샐러드 100+정기배송 50%쿠폰</title>
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
$(function() {
	
		var lastScrollTop = 0,
	    delta = 100;
	    $(window).scroll(function(event){
	    var st = $(this).scrollTop();
	    if(Math.abs(lastScrollTop - st) > delta) return;
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
	    
	    var userCode = $('#userCode').val();
		if(userCode == ""){
			$('.btn').click(function(){
				location.href = "login.do";
			})
		}
		
		$('#newMemberCoupon').click(function(){
			$.ajax({
				url : 'coupon01.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
		})
		
		$('#1manCouponPack').click(function(){
			$.ajax({
				url : 'coupon04.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
		})
		
		$(document).on('click', '#closeModal', function(){
			$('.swal2-container').detach();
		})

		$('.btn.half-menu.right, .btn.half-menu.left').click(function(){			
			var userCode = $('#userCode').val();
			console.log(userCode);
			var coupon_code = $(this).attr('id');
			console.log(coupon_code);
			if(userCode == "") {
				location.href = "login.do";
			}else {
				$.ajax({
					url : 'coupon02.do',
					dataType : 'html',
					type : 'post',
					data : {
						"userCode" : userCode,
						"coupon_code" : coupon_code
					},
					success : function(htmlOut){
						$('body').append(htmlOut);
					}
				})
			}
		})
		
		$('.btn.coupon.left, .btn.coupon.right').click(function(){
			var userCode = $('#userCode').val();
			console.log(userCode);
			var coupon_code = $(this).attr('id');
			console.log(coupon_code);
			if(userCode == "") {
				location.href = "login.do";
			}else {
				$.ajax({
					url : 'coupon02.do',
					dataType : 'html',
					type : 'post',
					data : {
						"userCode" : userCode,
						"coupon_code" : coupon_code
					},
					success : function(htmlOut){
						$('body').append(htmlOut);
					}
				})
			}
		})
	});
function memberModify_page() {
	location.href = "myMemberModify.do";
}
</script>
</head>
<body class="" style="padding-right: 0px;">
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<input type="hidden" value="${member.memberCode }" id="userCode">
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-0f5971ec="" class="viewport">
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
				<div data-v-0f5971ec="" class="container"
					style="padding-top: 182px;">
					<div data-v-6c57d82e="" data-v-0f5971ec="" class="container">
						<img data-v-6c57d82e=""
							src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/00.jpg">
						<nav data-v-6c57d82e="" class="nav">
							<ul data-v-6c57d82e="" class="nav-container">
								<li data-v-6c57d82e="" class="nav-item-wrapper active"><div
										data-v-6c57d82e="" class="nav-item" onclick="location.href='#section-01';" >
										<span data-v-6c57d82e="" class="nav-item-number">01</span> <span
											data-v-6c57d82e="" class="nav-item-text">첫주문 혜택</span>
									</div></li>
								<li data-v-6c57d82e="" class="nav-item-wrapper"><div
										data-v-6c57d82e="" class="nav-item" onclick="location.href='#section-02';" >
										<span data-v-6c57d82e="" class="nav-item-number">02</span> <span
											data-v-6c57d82e="" class="nav-item-text">1만원 쿠폰팩</span>
									</div></li>
								<li data-v-6c57d82e="" class="nav-item-wrapper"><div
										data-v-6c57d82e="" class="nav-item" onclick="location.href='#section-03';" >
										<span data-v-6c57d82e="" class="nav-item-number">03</span> <span
											data-v-6c57d82e="" class="nav-item-text">스페셜 추가 혜택</span>
									</div></li>
							</ul>
						</nav>
						<section data-v-6c57d82e="" id="section-01"
							class="section section-01">
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/01.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/02.jpg">
								<div data-v-6c57d82e="" class="btn" id="newMemberCoupon"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/03.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/04.jpg">
								<div data-v-6c57d82e="" class="btn half-menu left"></div>
								<div data-v-6c57d82e="" class="btn half-menu right"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/05.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/06.jpg">
								<div data-v-6c57d82e="" class="btn half-menu left" id="1"></div>
								<div data-v-6c57d82e="" class="btn half-menu right" id="2"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/07.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/08-1.jpg">
								<div data-v-6c57d82e="" class="btn half-menu left"></div>
								<div data-v-6c57d82e="" class="btn half-menu right"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/09-1.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/10-1.jpg">
								<div data-v-6c57d82e="" class="btn half-menu left" id="3"></div>
								<div data-v-6c57d82e="" class="btn half-menu right" id="4"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/11.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/12.jpg">
								<div data-v-6c57d82e="" class="btn half-menu left"></div>
								<div data-v-6c57d82e="" class="btn half-menu right"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/13.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/14.jpg">
								<div data-v-6c57d82e="" class="btn half-menu left" id="5"></div>
								<div data-v-6c57d82e="" class="btn half-menu right" id="6"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/15.jpg">
						</section>
						<section data-v-6c57d82e="" id="section-02"
							class="section section-02">
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/16.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/17.jpg">
								<div data-v-6c57d82e="" class="btn" id="1manCouponPack"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/18.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/19.jpg">
								<div data-v-6c57d82e="" class="btn coupon left" id="7"></div>
								<div data-v-6c57d82e="" class="btn coupon right" id="8"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/20.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/21.jpg">
								<div data-v-6c57d82e="" class="btn coupon left" id="9"></div>
								<div data-v-6c57d82e="" class="btn coupon right" id="10"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/22.jpg">
						</section>
						<section data-v-6c57d82e="" id="section-03"
							class="section section-03">
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/23.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/24.jpg">
								<div data-v-6c57d82e="" class="btn"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/25.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/26.jpg">
								<div data-v-6c57d82e="" class="btn"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/27.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/28.jpg">
								<div data-v-6c57d82e="" class="btn"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/29.jpg">
							<div data-v-6c57d82e="" class="btn-wrap">
								<img data-v-6c57d82e=""
									src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/30.jpg">
								<div data-v-6c57d82e="" class="btn" onclick="memberModify_page()"></div>
							</div>
							<img data-v-6c57d82e=""
								src="https://freshcode.s3.ap-northeast-2.amazonaws.com/img/new_secret_coupon/20211001-renewal/31.jpg">
						</section>
					</div>
				</div>
				<!---->
				<footer class="footer" data-v-438b4fe4="" data-v-0f5971ec="">
					<div class="footer__wrap" data-v-438b4fe4="">
						<h2 class="footer---logo" data-v-438b4fe4="">
							<img class="footer--logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/logo.PNG" alt="SALAD:IT" data-v-438b4fe4=""> 
							<div data-v-438b4fe4=""></div>
						</h2> 
						<div class="footer__body" data-v-438b4fe4="">
							<address class="footer__cs" data-v-438b4fe4="">
								<h3 data-v-438b4fe4="">샐러딧고객센터</h3> 
								<div class="cs-time" data-v-438b4fe4="">
									<div class="btn-channel-talk" data-v-438b4fe4="">1:1 문의하기</div> 
									<div class="cs-time__inner" data-v-438b4fe4="">
										<div data-v-438b4fe4="">
											<div id="sa04" class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">평일</b> 
												<p data-v-438b4fe4="">9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
											</div> 
											<div id="sa03" class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">토요일</b> 
												<p data-v-438b4fe4="">9:00 - 13:00
		                  							<span data-v-438b4fe4=""> (홈페이지 채팅문의만 운영)</span>
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
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">대표</b>신준혁</p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">주소</b> <span data-v-438b4fe4="">서울특별시 성동구 왕십리로 115, 헤이그라운드 서울숲점 7층</span></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">사업자등록번호</b>883-81-00307</p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">통신판매업신고</b>제 2016-서울용산-00657</p>
		                  	</address> 
		                  	<address class="footer__address help hide" data-v-438b4fe4="">
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">제휴문의</b><a href="mailto:biz@freshcode.me" data-v-438b4fe4="">biz@saladit.me</a></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">카카오ID</b><a href="#" data-v-438b4fe4="">@샐러딧-saladit</a></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">단체주문문의</b><a href="mailto:order@freshcode.me" data-v-438b4fe4="">order@saladit.me</a></p>
		                  	</address> 
		                  	<aside class="footer__side" data-v-438b4fe4="">
		                  		<p class="footer__copyright hide" data-v-438b4fe4="">
						          ⓒ 2020. Saladit, Inc. All Rights Reserved<br data-v-438b4fe4="">샐러딧이
						          제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은 특허법, 저작권법,
						          부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4="">무단 복제, 유사한
						          변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
						        </p> 
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