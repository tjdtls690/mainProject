<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myReviewWrite" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="title" name="title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description"
	content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords"
	content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:title" property="og:title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description"
	property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image"
	content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
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
<link href="${path}/style2.css?ver=2" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
	
	function checkForm(){
		var content = $('#form-review-textarea').val();
		
		if(content.length == 0){
			alert('후기 내용을 입력해주세요');
			return false;
		}else{
			return true;
		}
	}
	
	function readURL1(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
				$('.row--h-center.files').append('<label data-v-89f34e0a="" data-v-421abad8=""><em data-v-89f34e0a="" data-v-421abad8="" class="preview-images1">image</em></label>');
	        	$(".preview-images1").css({"background":"url(" + e.target.result + ")"}); 	
	        	$(".preview-images1").css('background-repeat', 'no-repeat');
	        	$(".preview-images1").css('background-color', '#fbfbfb');
	        	$(".preview-images1").css('background-position', '50% 50%');
	        	$(".preview-images1").css('background-size', 'cover');
	        	$('#imageCheck').val(1);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	    
	    $('#image-file-button1').parent().css('display', 'none');
	    $('#image-file-button2').parent().css('display', '');
	}
	
	function readURL2(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
				$('.row--h-center.files').append('<label data-v-89f34e0a="" data-v-421abad8=""><em data-v-89f34e0a="" data-v-421abad8="" class="preview-images2">image</em></label>');
	        	$(".preview-images2").css({"background":"url(" + e.target.result + ")"}); 	
	        	$(".preview-images2").css('background-repeat', 'no-repeat');
	        	$(".preview-images2").css('background-color', '#fbfbfb');
	        	$(".preview-images2").css('background-position', '50% 50%');
	        	$(".preview-images2").css('background-size', 'cover');
	        	$('#imageCheck').val(1);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$(function(){
		// 리뷰 내용 30자 기준 점검 초기화
		var contentSuFirst = $('#contentFirst').val().length;
		var countFirst = 30 - contentSuFirst;
		if(countFirst > 0){
			$('.form__count').html('<span data-v-89f34e0a="" data-v-421abad8="" class="msg">' + countFirst + '자만 더 쓰면 포인트 적립 조건 충족!</span>' + String(contentSuFirst) + '/1000');
			$('#contentCheck').val(0);
		}else{
			$('.form__count').html('<span data-v-89f34e0a="" data-v-421abad8="" class="msg">글자수 조건 충족!</span>' + String(contentSuFirst) + '/1000');
			$('#contentCheck').val(1);
		}
		
		// 별점 초기화
		var starFirst = $('#star').val();
		for(var i = 0; i < $('.star-rating').children('.star').length; i++){
			if((String(starFirst) + '-stars') == $('.star-rating').children('.star').eq(i).attr('for')){
				$('.star-rating').children('.star').eq(i).trigger('click');
				$('html').scrollTop(0);
			}
		}
		
		
		// 내용 삽입
		$('#form-review-textarea').val($('#contentFirst').val());
		
		
		
		
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
		
	    // 별점 찍기	
		$('.star-rating').children('.star').on('click', function(){
			var star = $(this).attr('for');
			document.review_form.star.value = $('.star-rating').children('input#' + star).val();
		})
		
		
		// 사진 등록 버튼1
		$("#image-file-button1").on('change', function(){
			if($('.preview-images1').length == 1 && $('.preview-images2').length == 1){
				alert('사진은 2개까지만 등록 가능합니다.');
				return false;
			}
	    	readURL1(this);
	    });
	    
		// 사진 등록 버튼2
		$("#image-file-button2").on('change', function(){
			if($('.preview-images1').length == 1 && $('.preview-images2').length == 1){
				alert('사진은 2개까지만 등록 가능합니다.');
				return false;
			}
	    	readURL2(this);
	    });
		
		// 사진 프리뷰 버튼1
		$(document).on('click', '.preview-images1', function(){
			$(this).parent().detach();
			$('#image-file-button1').val('');
			$("#image-file-button1").parent().css('display', '');
			$("#image-file-button2").parent().css('display', 'none');
			
			if($('.preview-images1').length == 0 && $('.preview-images2').length == 0){
				$('#imageCheck').val(0);
			}
		})
		
		// 사진 프리뷰 버튼2
		$(document).on('click', '.preview-images2', function(){
			$(this).parent().detach();
			if($('.preview-images1').length == 0){
				$('#image-file-button2').val('');
				$("#image-file-button1").parent().css('display', '');
				$("#image-file-button2").parent().css('display', 'none');
			}else{
				$('#image-file-button2').val('');
				$("#image-file-button1").parent().css('display', 'none');
				$("#image-file-button2").parent().css('display', '');
			}
			
			if($('.preview-images1').length == 0 && $('.preview-images2').length == 0){
				$('#imageCheck').val(0);
			}
		})
		
		
		// 리뷰 내용 글자 수 카운트
		$(document).on('keyup', '#form-review-textarea', function(){
			var contentSu = $('#form-review-textarea').val().length;
			var count = 30 - contentSu;
			if(count > 0){
				$('.form__count').html('<span data-v-89f34e0a="" data-v-421abad8="" class="msg">' + count + '자만 더 쓰면 포인트 적립 조건 충족!</span>' + String(contentSu) + '/1000');
				$('#contentCheck').val(0);
			}else{
				$('.form__count').html('<span data-v-89f34e0a="" data-v-421abad8="" class="msg">글자수 조건 충족!</span>' + String(contentSu) + '/1000');
				$('#contentCheck').val(1);
			}
		})
		
		// 취소 버튼
		$(document).on('click', '.row--gutter .button.button--outline', function(){
			$(location).attr("href", "myReviewSearch.do");
		})

		
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
				<div data-v-0f5971ec="" class="container">
					<div data-v-421abad8="" data-v-89f34e0a="" data-v-0f5971ec=""
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
										<strong data-v-3e2784be="">신준혁</strong> <span
											data-v-3e2784be="">tjdtls690@naver.com</span>
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
											href="/mypage/coupons" class=""><em data-v-3e2784be="">0</em></a>
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
												href="myPayInfo.do" aria-current="page">주문/결제 내역</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myDelivery.do" class="">배송현황</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myBesongji.do" aria-current="page">배송지 관리</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myPointSearch.do" class="">포인트 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myCouponSearch.do" class="">쿠폰 조회</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myReviewSearch.do" class="nuxt-link-exact-active nuxt-link-active">나의 후기</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myMemberModify.do" class="">회원정보 수정</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992="" href="#" id="logout">로그아웃</a></li>
										</ul>
									</aside>
								</aside>
								<div data-v-421abad8="" class="mypage-layout__body">
									<article data-v-89f34e0a="" data-v-421abad8=""
										class="review-write">
										<header data-v-2c0651a8="" data-v-89f34e0a=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">후기 작성</h2>
											<!---->
										</header>
										<div data-v-89f34e0a="" data-v-421abad8="" class="drawer-wrap">
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="row row--v-center row--v-center"
												style="background: rgb(80, 80, 80);">
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="col-12 row row--h-between row--v-center"
													style="height: 40px; cursor: pointer; flex-wrap: nowrap;">
													<em data-v-89f34e0a="" data-v-421abad8=""
														class="drawer-title">지금 후기를 작성해주시면 <span
														data-v-89f34e0a="" data-v-421abad8=""
														style="color: rgb(245, 163, 36);">최대 300원의 포인트</span>를
														적립해드려요!
													</em>
													<!---->
													<svg data-v-89f34e0a="" xmlns="http://www.w3.org/2000/svg"
														width="24" height="24" viewBox="0 0 24 24"
														aria-labelledby="arrow-down-1" role="presentation"
														class="icon" data-v-421abad8=""
														style="padding-right: 16px; color: white;">
														<g fill="none" fill-rule="evenodd"> <path
															fill="currentColor" fill-rule="nonzero"
															d="M3.455 8.138a.5.5 0 0 0-.69.724l8.946 8.5a.5.5 0 0 0 .689 0l8.944-8.5a.5.5 0 0 0-.688-.724l-8.6 8.172-8.601-8.172z"></path></g></svg>
												</div>
												<!---->
											</div>
										</div>
										<div data-v-290d27aa="" data-v-89f34e0a=""
											class="review-item review-write__item" data-v-421abad8=""
											style="border: 1px solid rgb(231, 231, 231); padding: 24px; margin: 3px 0px 0px;">
											<p data-v-290d27aa="" class="review-item__date">
												<c:if test="${paymentInfo.payment_delivery_condition eq null}">
													배송준비중
												</c:if>
												<c:if test="${paymentInfo.payment_delivery_condition ne null }">
													${paymentInfo.payment_delivery_condition}
												</c:if> 
												<em data-v-290d27aa="">${paymentInfo.payment_date }</em>
											</p>
											<div data-v-290d27aa="" class="row--v-center">
												<div data-v-290d27aa="" href="#" target="_blank"
													class="col-12 col--lg review-item__body">
													<dl data-v-290d27aa="" class="row">
														<dt data-v-290d27aa="">
															<figure data-v-290d27aa=""
																style="background-image: url(&quot;${itemInfo.item_image}&quot;);"></figure>
														</dt>
														<dd data-v-290d27aa="" class="col">
															<strong data-v-290d27aa="">${paymentMappingInfo.payment_item_mapping_item_name_size }</strong>
														</dd>
													</dl>
												</div>
												<!---->
											</div>
										</div>
										
										<!-- todo -->
										<form name="review_form" action="modifyReview.do" data-v-89f34e0a="" data-v-421abad8="" method="POST" enctype="multipart/form-data"
												onsubmit="return checkForm()">
											<input id="tagMain" name="tagMain" type="hidden" value="${paymentMappingInfo.payment_item_mapping_tag_main }"/>
											<input id="itemCode" name="itemCode" type="hidden" value="${paymentMappingInfo.payment_item_mapping_item_code }"/>
											<input id="mappingCode" name="mappingCode" type="hidden" value="${paymentMappingInfo.payment_item_mapping_code }"/>
											<input id="contentCheck" name="contentCheck" type="hidden" value="0"/>
											<input id="imageCheck" name="imageCheck" type="hidden" value="0"/>
											<input id="star" name="star" type="hidden" value="${reviewInfo.star }"/>
											<input id="seq" name="seq" type="hidden" value="${reviewInfo.seq }"/>
											<input id="contentFirst" type="hidden" value="${reviewInfo.content}">
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__rating">
												<h3 data-v-89f34e0a="" data-v-421abad8="">만족도는 어느정도
													였나요?</h3>
												<p data-v-89f34e0a="" data-v-421abad8="">터치하여 별점을 선택해주세요</p>
												<div data-v-89f34e0a="" data-v-421abad8="" class="star">
													
													<div class="star-wrap">
														<div class="star-rating">
															<input type="radio" id="5-stars" name="rating" value="5"/>
															<label for="5-stars" class="star">★</label>
															<input type="radio" id="4-stars" name="rating" value="4"/>
															<label for="4-stars" class="star">★</label>
															<input type="radio" id="3-stars" name="rating" value="3"/>
															<label for="3-stars" class="star">★</label>
															<input type="radio" id="2-stars" name="rating" value="2"/>
															<label for="2-stars" class="star">★</label>
															<input type="radio" id="1-star" name="rating" value="1"/>
															<label for="1-star" class="star">★</label>
														</div>
													</div>
												</div>
											</div>
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__comment">
												<div data-v-89f34e0a="" data-v-421abad8="" class="form">
													<textarea data-v-8bb17226="" data-v-89f34e0a="" name="content"
														id="form-review-textarea"
														placeholder="
텍스트후기: 100 포인트 / 사진후기: 300 포인트

<공통 조건>
- 후기 작성 후 조건에 부합할 시 포인트가 자동 지급
- 후기 내용은 띄어쓰기를 포함한 글자 수로 체크
- 비방성, 광고글, 문의사항 후기는 관리자 임의로 삭제 가능
- 상품을 교환하여 후기를 수정하거나 추가 작성하는 경우 적립금 미지급
- 사진이 자사 제품과 무관할 경우 자동 지급된 포인트 삭제 및 미지급의 불이익이 발생할 수 있음"
														maxlength="1000" rows="10"
														class="form__input form-text form-text--textarea"
														data-v-421abad8=""></textarea>
													<p data-v-89f34e0a="" data-v-421abad8=""
														class="form__count">
														<span data-v-89f34e0a="" data-v-421abad8="" class="msg">30자만
															더 쓰면 포인트 적립 조건 충족!</span> 0/1000
													</p>
												</div>
											</div>
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__upload-photo">
												<div data-v-89f34e0a="" data-v-421abad8="" class="tooltip">
													<span data-v-89f34e0a="" data-v-421abad8=""
														class="tooltip-text">사진과 함께 등록 시 300원 적립! </span>
													<!---->
												</div>
												<h3 data-v-89f34e0a="" data-v-421abad8="">사진 등록</h3>
												<p data-v-89f34e0a="" data-v-421abad8="">사진은 2장까지 등록
													가능해요</p>
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="row--h-center files">
													<label data-v-89f34e0a="" data-v-421abad8=""> <input id="image-file-button1"
														data-v-89f34e0a="" data-v-421abad8="" type="file" name="uploadFile1"
														accept="image/*"> <i data-v-89f34e0a=""
														data-v-421abad8=""> <svg data-v-89f34e0a=""
																xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" aria-labelledby="plus"
																role="presentation" class="icon" data-v-421abad8="">
																<g fill="none" fill-rule="evenodd"> 
																	<path fill="currentColor" fill-rule="evenodd"
																	d="M13 11h9v2h-9v9h-2v-9H2v-2h9V2h2v9z"></path>
																</g>
															</svg>
														</i>
													</label>
													<label data-v-89f34e0a="" data-v-421abad8="" style="display:none"> <input id="image-file-button2"
														data-v-89f34e0a="" data-v-421abad8="" type="file" name="uploadFile2"
														accept="image/*"> <i data-v-89f34e0a=""
														data-v-421abad8=""> <svg data-v-89f34e0a=""
																xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" aria-labelledby="plus"
																role="presentation" class="icon" data-v-421abad8="">
																<g fill="none" fill-rule="evenodd"> 
																	<path fill="currentColor" fill-rule="evenodd"
																	d="M13 11h9v2h-9v9h-2v-9H2v-2h9V2h2v9z"></path>
																</g>
															</svg>
														</i>
													</label>
													<!-- todo -->
												</div>
												<p data-v-89f34e0a="" data-v-421abad8=""
													style="font-size: 12px; font-weight: 300; color: rgb(246, 100, 62);">
													자사 제품과 무관한 사진 첨부 시 통보 없이<br data-v-89f34e0a=""
														data-v-421abad8=""> 후기 삭제 및 포인트 회수가 진행 될 수 있습니다.
												</p>
											</div>
											<div data-v-89f34e0a="" data-v-421abad8=""
												class="footer-drawer-wrap">
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="row row--v-center row--v-center"
													style="background: rgb(244, 245, 246);">
													<div data-v-89f34e0a="" data-v-421abad8=""
														class="col-12 row row--h-between row--v-center"
														style="height: 64px; cursor: pointer; border: 1px solid rgb(231, 231, 231);">
														<em data-v-89f34e0a="" data-v-421abad8=""
															class="footer-drawer-title">포인트 적립 유의사항</em>
														<svg data-v-89f34e0a="" xmlns="http://www.w3.org/2000/svg"
															width="24" height="24" viewBox="0 0 24 24"
															aria-labelledby="arrow-up-1" role="presentation"
															class="icon" data-v-421abad8=""
															style="padding-right: 16px;">
															<g fill="none" fill-rule="evenodd"> <path
																fill="currentColor" fill-rule="nonzero"
																d="M3.455 16.362a.5.5 0 0 1-.69-.724l8.946-8.5a.5.5 0 0 1 .689 0l8.944 8.5a.5.5 0 0 1-.688.724l-8.6-8.172-8.601 8.172z"></path></g></svg>
													</div>
													<div data-v-89f34e0a="" data-v-421abad8=""
														class="col-12 footer-drawer-contents">
														<ul data-v-89f34e0a="" data-v-421abad8="">
															<li data-v-89f34e0a="" data-v-421abad8="">상품마다 개별
																작성건만 해당 가능</li>
															<li data-v-89f34e0a="" data-v-421abad8="">사진 후기는 자사
																제품 사진에 한 함</li>
															<li data-v-89f34e0a="" data-v-421abad8="">비방성, 광고글,
																문의사항 후기는 관리자 임의로 삭제될 수 있음</li>
															<li data-v-89f34e0a="" data-v-421abad8="">상품 교환하여
																후기를 수정하거나 추가 작성하는 경우 추가 적립금 미지급</li>
														</ul>
													</div>
												</div>
											</div>
											<nav data-v-89f34e0a="" data-v-421abad8=""
												class="review-write__nav">
												<div data-v-89f34e0a="" data-v-421abad8=""
													class="row--gutter">
													<div data-v-89f34e0a="" data-v-421abad8="" class="col">
														<button data-v-a1c889e0="" data-v-89f34e0a=""
															type="button" title="" class="button button--outline"
															data-v-421abad8="">
															<span data-v-a1c889e0="" class="button__wrap">취소</span>
														</button>
													</div>
													<div class="col">
														<button data-v-a1c889e0="" 
															type="submit" class="button" >
															<span>수정</span>
														</button>
													</div>
												</div>
											</nav>
										</form>
									</article>
									<!---->
								</div>
							</div>
						</div>
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