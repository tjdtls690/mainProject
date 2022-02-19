<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/tapPage"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프레시코드 - 프리미엄 샐러드 배달 서비스</title>
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
	<link href="${path}/style1.css" rel="stylesheet" type="text/css" />
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

$(document).on('click', 'article.item', function(){ // 상세페이지와 연계되는 기능
	var f = document.paging;
	var code = $(this).children('#itemCode').attr('value');
	var tag = $(this).children('#tagMain').attr('value')
	f.tagMain01.value = tag;
	f.itemCode01.value = code;
	f.action="test01.do"; // 상세페이지 url 로 연결만 시키기
	f.method="post";
	f.submit();
})


$(function() { 
	$('.category-tab-content').children().on('click', function(){
		$(this).addClass('active-category');
		$(this).siblings().removeClass('active-category');
	});
	
	// ajax 태그기능 넣을 함수
	$(document).on("click", ".active-category", function(event){
        // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
        var tagNum = $(this).attr('id');
        $.ajax({
        	url : 'tag.do',
        	type : 'post',
        	dataType : 'html',
        	data : {
        		"tagNum" : tagNum
        	},
        	success : function(htmlOut){
        		$('.row').html(htmlOut);
        	}
        })
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
});
</script>
	
</head>
<body>
	<div id="__nuxt">
		<div id="__layout">
			<main class="viewport" data-v-0f5971ec="">
				<header id="header-area" class="header" data-v-7aa1f9b4=""
					data-v-0f5971ec="">
					<div id="header__body" class="header__body" data-v-7aa1f9b4="">
						<div class="header__top" data-v-7aa1f9b4="">
							<a href="/info" class="header__top-left" data-v-7aa1f9b4=""></a>
							<div class="header__top-right" data-v-7aa1f9b4="">
								<c:choose>
									<c:when test="${empty name}">
										<a href="/user/signup" data-v-7aa1f9b4="">회원가입</a>
										<a data-v-7aa1f9b4="" href="login.do">로그인</a>
									</c:when>
									<c:otherwise>
										<a href="/mypage/orders" id="nickname" data-v-7aa1f9b4>${name } <span data-v-7aa1f9b4>님</span></a>
									</c:otherwise>
								</c:choose>
									<span data-v-7aa1f9b4="">1:1문의</span>
								<a href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank"
									data-v-7aa1f9b4="">B2B 신청</a>
							</div>
						</div>
						<!---->
						<div class="header__logo" data-v-7aa1f9b4="">
							<a href="/" class="nuxt-link-active" data-v-7aa1f9b4=""></a>
							<!---->
						</div>
						<form name="paging">
							<input type="hidden" name="tagMain01" value="">
							<input type="hidden" name="itemCode01" value="">
						</form>
						<nav class="header__menus" data-v-7aa1f9b4="">
							<div data-v-7aa1f9b4="">
								<div class="dropdown" data-v-7aa1f9b4="">
									<span class="item" data-v-7aa1f9b4="">전체 카테고리</span>
									<div class="dropdown" data-v-7aa1f9b4="">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(0);"
												class="nuxt-link-active" data-v-7aa1f9b4=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(200);"
												class="nuxt-link-exact-active nuxt-link-active"
												data-v-7aa1f9b4="" aria-current="page"> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(100);"
												data-v-7aa1f9b4="" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(300);"
												data-v-7aa1f9b4="" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(400);"
												data-v-7aa1f9b4="" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(500);"
												data-v-7aa1f9b4="" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(600);"
												data-v-7aa1f9b4="" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(700);"
												data-v-7aa1f9b4="" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(800);"
												data-v-7aa1f9b4="" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a href="javascript:page_move(1);"
												data-v-7aa1f9b4="" class="new"> 초코베리머치 </a></li>
<!-- 											<li data-v-7aa1f9b4=""><a href="/menu/soon" -->
<!-- 												data-v-7aa1f9b4="" class=""> 오픈예정 </a></li> -->
										</ul>
									</div>
								</div>
								<a href="javascript:page_move(100);" class="item" data-v-7aa1f9b4="">정기구독
								</a><a href="javascript:page_move(200);"
									class="item nuxt-link-exact-active nuxt-link-active"
									data-v-7aa1f9b4="" aria-current="page">샐러드 </a><a
									href="javascript:page_move(300);" class="item" data-v-7aa1f9b4="">샌드위치·랩
								</a><a href="javascript:page_move(1);" class="item" data-v-7aa1f9b4="">초코베리머치
								</a><a href="/event" class="item" data-v-7aa1f9b4="">이벤트 </a><a
									href="/fcospot" class="item" data-v-7aa1f9b4="">프코스팟 </a>
							</div>
							<div class="header__menus-side" data-v-7aa1f9b4="">
								<a href="/search" class="search-logo" data-v-7aa1f9b4=""><img
									src="/images/ic-navi-search@3x.png" alt="메뉴 검색"
									class="search-logo-img" style="width: 24px; height: 24px;"
									data-v-7aa1f9b4="">
									<div data-v-7aa1f9b4="">검색</div></a> <a href="basket.do"
									class="cart-logo-wrap item" data-v-7aa1f9b4=""><div
										alt="프레시코드 장바구니" class="cart-logo empty" data-v-7aa1f9b4="">
										<!---->
									</div> <!----> 장바구니 </a> <a href="/order" class="item" data-v-7aa1f9b4=""><div
										class="icon-order" data-v-7aa1f9b4=""></div> 바로주문 </a>
							</div>
						</nav>
						<div class="header__side" data-v-7aa1f9b4="">
							<a href="/search" class="search-logo" data-v-7aa1f9b4=""><img
								src="/images/ic-navi-search@3x.png" alt="메뉴 검색"
								class="search-logo-img" style="width: 24px; height: 24px;"
								data-v-7aa1f9b4=""></a> <a href="basket.do"
								class="cart-logo-wrap item" data-v-7aa1f9b4=""><div
									alt="프레시코드 장바구니" class="cart-logo empty" data-v-7aa1f9b4="">
									<!---->
								</div></a>
							<nav class="header__toggle-button" data-v-7aa1f9b4="">
								<button type="button" data-v-7aa1f9b4="">
									<img src="/images/header-img/menu_new@2x.png" alt="user-menu"
										style="width: 24px; height: 24px;" data-v-7aa1f9b4="">
								</button>
							</nav>
						</div>
					</div>
					<div class="mobile-nav js-mobile-nav" data-v-7aa1f9b4="">
						<div class="mobile-nav-wrap" data-v-7aa1f9b4="">
							<div class="mobile-nav-scroll" data-v-7aa1f9b4="">
								<ul class="mobile-nav-contents" data-v-7aa1f9b4="">
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(0);" class="nuxt-link-active all-menu-btn-active"
										data-v-7aa1f9b4=""> 전체 메뉴 </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(100);" class="" data-v-7aa1f9b4="">
											정기구독 </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(1);" data-v-7aa1f9b4="" class=""> 초코베리머치 </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="/info" data-v-7aa1f9b4="" class=""> 배송안내 </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="/fcospot" data-v-7aa1f9b4="" class=""> 프코스팟 </a></li>
								</ul>
							</div>
							<div class="all-menus-container" style="display:;"
								data-v-7aa1f9b4="">
								<div class="all-menus-list-wrap" data-v-7aa1f9b4="">
									<ul class="all-menus-list js-all-menus-list" data-v-7aa1f9b4="">
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(0);"
											class="nuxt-link-active js-all-menus-item-link-0 all-menus-item-link"
											data-v-7aa1f9b4=""> 전체보기 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(200);"
											class="nuxt-link-exact-active nuxt-link-active js-all-menus-item-link-2 all-menus-item-link"
											data-v-7aa1f9b4="" aria-current="page"> 샐러드 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(100);"
											class="js-all-menus-item-link-1 all-menus-item-link new"
											data-v-7aa1f9b4=""> 정기구독 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(300);"
											class="js-all-menus-item-link-3 all-menus-item-link new"
											data-v-7aa1f9b4=""> 샌드위치·랩 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(400);"
											class="js-all-menus-item-link-4 all-menus-item-link new"
											data-v-7aa1f9b4=""> 도시락·간편식 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(500);"
											class="js-all-menus-item-link-10 all-menus-item-link"
											data-v-7aa1f9b4=""> 죽·스프 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(600);"
											class="js-all-menus-item-link-5 all-menus-item-link new"
											data-v-7aa1f9b4=""> 세트상품 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(700);"
											class="js-all-menus-item-link-6 all-menus-item-link new"
											data-v-7aa1f9b4=""> 간식 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(800);"
											class="js-all-menus-item-link-7 all-menus-item-link new"
											data-v-7aa1f9b4=""> 음료 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(1);"
											class="js-all-menus-item-link-8 all-menus-item-link new"
											data-v-7aa1f9b4=""> 초코베리머치 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="/menu/soon"
											class="js-all-menus-item-link-9 all-menus-item-link"
											data-v-7aa1f9b4=""> 오픈예정 </a></li>
									</ul>
								</div>
								<div class="all-menus-shadow" data-v-7aa1f9b4=""></div>
								<div class="all-menus-arrow-wrap" data-v-7aa1f9b4="">
									<img src="/images/icon-arrow-down@2x.png" alt=""
										class="all-menus-arrow" data-v-7aa1f9b4="">
								</div>
							</div>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
				</header>
				<div class="container"
					data-v-0f5971ec="">
					<div data-v-0f5971ec="">
						<div data-v-32208b1c="" class="menu-top-banner-container">
							<div data-v-32208b1c="" class="menu-top-banner-wrap">
								<div data-v-32208b1c="" class="menu-top-banner expired"
									style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/banner/mobile/1057_20220210100123&quot;);"></div>
								<div data-v-32208b1c="" class="menu-top-banner expired"
									style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/banner/web/1057_20220210100123&quot;);"></div>
							</div>
						</div>
						<article data-v-4c9a9e82="" class="menus">
							<div data-v-4c9a9e82="" class="menus__body">
								<section data-v-4c9a9e82="" id="content_salad"
									class="menus__section">
										<h3 data-v-4c9a9e82="" class="category-title">${tagInfo[0].tagNameMain }</h3>
										<c:if test="${itemInfo[0].tagMain != 700 && itemInfo[0].tagMain != 800 && itemInfo[0].tagMain != 1}">
											<div data-v-0ca25db4="" data-v-4c9a9e82="" class="category-tab">
												<div data-v-0ca25db4="" class="category-tab-content">
													<div data-v-0ca25db4="" class="active-category" id="${itemInfo[0].tagMain }">전체</div>
													<c:forEach var="tag" items="${tagInfo }">
														<div data-v-0ca25db4="" class="" id="${tag.tagSub }">${tag.tagNameSub }</div>
													</c:forEach>
												</div>
											</div>
										</c:if>
									<div data-v-4c9a9e82="" class="menus-index">
										<ul data-v-4c9a9e82="" class="row">
										
										
										<c:forEach var="item" items="${itemInfo }">
											<li data-v-4c9a9e82="" class="col-6 col--lg-3">
											<article
													data-v-15082832="" data-v-4c9a9e82=""
													class="item for-loop-cloned-item-244">
													<input type="hidden" value="${item.itemCode }" id="itemCode">
													<input type="hidden" value="${item.tagMain }" id="tagMain">
													<div data-v-15082832="" class="for-loop-cloned-item-244">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-244">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-244">
																<!---->
															</div>
															<img data-v-15082832=""
																src="${item.itemImage }"
																alt="${item.itemName } " title="${item.itemName } "
																class="for-loop-cloned-item-244">
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-244">
															<!---->
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
												
												
										</ul>
									</div>
								</section>
							</div>
						</article>
						<!---->
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



								<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>