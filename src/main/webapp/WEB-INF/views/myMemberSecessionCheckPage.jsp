<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myMemberSecessionCheckPage"/>
<!DOCTYPE html>
<html class="">
<head>

<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
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
<link rel="stylesheet" href="${path }/style.css">
<link rel="stylesheet" href="${path }/style2.css?ver=1">
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
	$('.form-radio').eq(0).trigger('click');
	
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
    	
    	// 탈퇴 이유 선택
    	$(document).on('click', '.form-radio', function(){
    		var secessionReason = $(this).children('input').val()
    		if(secessionReason != '기타'){
    			$('.form-text-wrap').css('display', 'none');
    		}else {
    			$('.form-text-wrap').css('display', '');
    		}
    	})
    	
    	// 탈퇴하기 버튼
    	$(document).on('click', '.survey__buttons.row--v-center button:odd', function(){
    		$.ajax({
    			url : 'myMemberSecessionCheckPageFinalCheckModal.do',
    			dataType : 'html',
    			success : function(htmlOut){
    				$('body').append(htmlOut);
    			}
    		})
    	})
    	
    	// 탈퇴 묻는 모달창 확인 버튼
    	$(document).on('click', '#secessionOkBtn', function(){
    		$(location).attr("href", "myMemberSecessionSuccess.do");
    	})
})
</script>
</head>
<body class="">
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
				<!---->
				<div data-v-1739428d="" class="container">
					<div data-v-0172258b="" data-v-1739428d="" class="survey">
						<header data-v-0172258b="" class="survey__header">
							<h2 data-v-0172258b="">회원 탈퇴</h2>
							<p data-v-0172258b="">
								프레시코드를 아끼고 사랑해주신 시간에 감사드립니다.<br data-v-0172258b="">고객님이
								느끼셨던 점을 저희에게 공유해주시면<br data-v-0172258b="">더욱 건강한 서비스를 제공할 수
								있는 프레시코드가 되도록 노력하겠습니다.
							</p>
						</header>
						<div data-v-0172258b="" class="survey__container">
							<h3 data-v-0172258b="">회원 탈퇴를 결정하신 이유를 선택해주세요!</h3>
							<ul data-v-0172258b="">
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="이용안함"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 사이트 방문을 잘 하지 않아요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="배송불가"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 배송 불가능 지역이에요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="배송이슈"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 배송 지연 및 실수가 잦아요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="상품가격"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 상품 가격이 높아요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="품질불만"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 상품이 불만족스러워요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="주문불편"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 주문 과정이 불편해요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="환불불편"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 환불 과정이 불편해요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="혜택부족"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 이용 혜택이 부족해요 </label></li>
								<li data-v-0172258b="" class="row--v-center"><label
									data-v-0172258b="" class="row--v-center"><label
										data-v-12d1ffd0="" data-v-0172258b="" class="form-radio"><input
											data-v-12d1ffd0="" type="radio" name="delete-reason-radio"
											value="기타"> <span data-v-12d1ffd0=""><i
												data-v-12d1ffd0=""></i></span></label> 기타 </label></li>
							</ul>
							<div data-v-0172258b="" class="form-text-wrap" style="display:none">
								<textarea data-v-8bb17226="" data-v-0172258b=""
									placeholder="탈퇴하시는 가장 큰 이유를 자유롭게 작성해주세요 :)" rows="8"
									class="form-text form-text--textarea"
									style="height: 120px; font-size: 14px;"></textarea>
							</div>
							<!---->
						</div>
						<div data-v-0172258b="" class="survey__buttons row--v-center">
							<button data-v-a1c889e0="" data-v-0172258b="" type="button"
								title=""
								class="button button--size-large button--radius-little button--outline4"
								style="width: 50%; height: 46px; margin-right: 8px; background-color: rgb(255, 255, 255);">
								<span data-v-a1c889e0="" class="button__wrap">이전</span>
							</button>
							<button data-v-a1c889e0="" data-v-0172258b="" type="button"
								title="" class="button button--size-large button--radius-little"
								style="width: 50%; height: 46px;">
								<span data-v-a1c889e0="" class="button__wrap">탈퇴하기</span>
							</button>
						</div>
					</div>
				</div>
				<!---->
			</main>
		</div>
	</div>
	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>