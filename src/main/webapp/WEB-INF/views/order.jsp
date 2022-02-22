<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/order"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/style.css" rel="stylesheet" type="text/css" />
<link href="${path}/style2.css" rel="stylesheet" type="text/css" />
<meta data-n-head="ssr" data-hid="title" name="title" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description" content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords" content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="og:title" property="og:title" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description" property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:url" property="og:url" content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image" content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
<script src="https://cdn.megadata.co.kr/js/socialLink/social_sns_config_min.js" type="text/javascript" defer="" async=""></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() { 
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
    
    $('#delivery-morning').trigger("click");
});
</script>
</head>
<body>
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&" height="0" width="0" style="display: none; visibility: hidden" title="gtm"></iframe>
	</noscript>
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-1739428d="" class="viewport-none-footer">
				<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
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
												href="/menu/event" class="new"> 프코 편의점 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/soon" class=""> 오픈예정 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="/menu/subscription" class="item">정기구독
								</a><a data-v-7aa1f9b4="" href="/menu/salad" class="item">샐러드 </a><a
									data-v-7aa1f9b4="" href="/menu/salad-wrap" class="item">샌드위치·랩
								</a><a data-v-7aa1f9b4="" href="/menu/event" class="item">프코 편의점
								</a><a data-v-7aa1f9b4="" href="/event" class="item">이벤트 </a><a
									data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
									data-v-7aa1f9b4="" src="/images/ic-navi-search@3x.png"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 24px; height: 24px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="/cart" class="cart-logo-wrap item"><div
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo">
										<div data-v-7aa1f9b4="" class="cart-logo-count">3</div>
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="/order"
									class="item nuxt-link-exact-active nuxt-link-active"
									aria-current="page"><div data-v-7aa1f9b4=""
										class="icon-order"></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
								data-v-7aa1f9b4="" src="/images/ic-navi-search@3x.png"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 24px; height: 24px;"></a> <a data-v-7aa1f9b4=""
								href="/cart" class="cart-logo-wrap item"><div
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
				<!---->
				<div data-v-1739428d="" class="container">
					<div data-v-064d23aa="" data-v-1739428d="" class="order-container">
						<div data-v-064d23aa="" class="order">
							<div data-v-064d23aa="" class="order-wrap">
								<div data-v-064d23aa="" class="order-type-wrap">
									<nav data-v-4b8c16c4="" data-v-064d23aa="" class="nav-tab">
										<div data-v-4b8c16c4="" class="nav-tab__wrap">
											<div data-v-4b8c16c4="" class="on">
												<button data-v-4b8c16c4="" type="button" class="general">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">일반배송 주문</span>
												</button>
											</div>
											<div data-v-4b8c16c4="" class="">
												<button data-v-4b8c16c4="" type="button" class="sub">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">정기배송 주문</span>
												</button>
											</div>
										</div>
									</nav>
								</div>
								<div data-v-064d23aa="" class="order-delivery-wrap">
									<div data-v-064d23aa="" class="order-delivery-header">
										<p data-v-064d23aa="" class="header-title">배송지 선택</p>
										<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/pay/besongji.PNG" alt="배송 설명 버튼" class="delivery-desc-btn" data-v-1ccff420>
									</div>
									<div data-v-064d23aa="" class="order-delivery-radio-wrap">
										<div data-v-064d23aa="" class="order-delivery-wrap">
											<input data-v-064d23aa="" id="delivery-spot" type="radio" name="delivery" value="spot" checked="checked">
<!-- 											<label data-v-064d23aa="" for="delivery-spot">스팟배송</label>  -->
<!-- 											<input data-v-064d23aa="" id="delivery-quick" type="radio" name="delivery" value="quick"> -->
<!-- 											<label data-v-064d23aa="" for="delivery-quick">퀵배송</label>  -->
											<input data-v-064d23aa="" id="delivery-morning" type="radio" name="delivery" value="morning">
											<label data-v-064d23aa="" for="delivery-morning"> 새벽배송 </label> 
											<input data-v-064d23aa="" id="delivery-parcel" type="radio" name="delivery" value="parcel">
											<label data-v-064d23aa="" for="delivery-parcel"> 택배배송 </label>
										</div>
									</div>
									<div data-v-064d23aa="" class="order-address-wrap">
										<button data-v-064d23aa="" type="button">
											<span data-v-064d23aa="" class="row--v-center row--h-between">
											<span data-v-064d23aa="" class="col ta-left">서울, 경기 지역 프코스팟 선택</span> 
											<i data-v-064d23aa="" class="ico">
											<svg data-v-064d23aa="" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" aria-labelledby="arrow-right-1" role="presentation"
														class="icon">
														<g fill="none" fill-rule="evenodd"> 
														<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path></g></svg></i></span>
										</button>
									</div>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<div data-v-064d23aa="" class="order-selected-item-wrap">
									<div data-v-064d23aa="" class="order-selected-item-list">
										<div data-v-064d23aa=""
											class="order-selected-item-list-header">
											<div data-v-064d23aa=""
												class="order-selected-item-list-header-left">
												<p data-v-064d23aa="" class="header-title">상품 선택</p>
											</div>
											<div data-v-064d23aa="" class="header-btn">전체 삭제</div>
										</div>
										<div data-v-064d23aa="" style="display: flex; flex-wrap: wrap; width: 100%;">
										<section data-v-003a3d21="" data-v-064d23aa="" class="selected-item">
												<header data-v-003a3d21="" class="row--wrap selected-item-header">
													<div data-v-003a3d21="" class="row row--h-between col-12">
														<div data-v-003a3d21="">
															<h3 data-v-003a3d21="">산펠레그리노 탄산수 500ml / 1개</h3>
															<p data-v-003a3d21="" class="content-info">
																<!---->
																* 해당 상품은 2022-02-01 까지 배송일 선택이 가능합니다.
															</p>
														</div>
														<div data-v-003a3d21="">
															<button data-v-003a3d21="" type="button"
																class="delete-menu-btn">삭제</button>
														</div>
													</div>
													<div data-v-003a3d21="" class="selected-item-header__body">
														<nav data-v-003a3d21="">
															<nav data-v-4ba0dee4="" data-v-003a3d21=""
																class="form-number quantity">
																<button data-v-4ba0dee4="" type="button"
																	class="form-number__control">
																	<svg data-v-4ba0dee4=""
																		xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																		<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																		<path data-v-4ba0dee4="" fill="currentColor"
																			d="M7 11.5h10v1H7z"></path></g></svg>
																</button>
																<span data-v-4ba0dee4="" class="form-number__input"><input
																	data-v-4ba0dee4="" type="number" min="1" max="1000"
																	step="1"></span>
																<button data-v-4ba0dee4="" type="button"
																	class="form-number__control">
																	<svg data-v-4ba0dee4=""
																		xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																		<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																		<path data-v-4ba0dee4="" fill="currentColor"
																			d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
																</button>
															</nav>
														</nav>
														<div data-v-003a3d21=""
															class="selected-item-price-wrap row row--v-end">
															<!---->
															<p data-v-003a3d21="" class="selected-item-price">
																<em data-v-003a3d21="">1,900원</em>
															</p>
														</div>
													</div>
												</header>
												<!---->
											</section>
										</div>
										<div data-v-064d23aa="" class="order-selected-item"
											style="flex-basis: 50%;">
											<button data-v-064d23aa="" type="button" class="add">
												<div data-v-064d23aa="">
													<span data-v-064d23aa="" style="white-space: nowrap;">추가하기</span>
												</div>
											</button>
										</div>
									</div>
								</div>
								<!---->
								<div data-v-064d23aa="" class="order-delivery-date-wrap">
									<div data-v-064d23aa="" class="order-delivery-date-header">
										<p data-v-064d23aa="" class="header-title">배송일 선택</p>
									</div>
									<div data-v-064d23aa="" class="header-description">상품
										수령날짜를 선택해 주세요.</div>
									<!---->
									<div data-v-064d23aa="" class="order-delivery-date-body">
										<div data-v-7322b8a8="" data-v-064d23aa=""
											class="date-picker-with-icon">
											<span data-v-56ae83be="" data-v-7322b8a8=""
												class="v-date-custom">
												<div>
												<input data-v-7322b8a8=""
												data-v-56ae83be="" id="date" placeholder="배송일 선택"
												readonly="readonly" class="date-picker-input">
												</div>
												
											<div data-v-7605e1b2="" data-v-56ae83be=""
													class="vc-popover-content-wrapper">
													<!---->
												</div></span>
										</div>
										<div data-v-064d23aa=""
											class="delivery-time-wrap row--v-center">
											<label data-v-064d23aa="" class="row--v-center"><label
												data-v-12d1ffd0="" data-v-064d23aa=""
												class="form-radio form-radio--small"><input
													data-v-12d1ffd0="" id="" type="radio" name="delivery-time"
													value="lunch"> <span data-v-12d1ffd0=""><i
														data-v-12d1ffd0=""></i></span></label> <span data-v-064d23aa="" class="">점심배송</span></label>
											<label data-v-064d23aa="" class="row--v-center"><label
												data-v-12d1ffd0="" data-v-064d23aa=""
												class="form-radio form-radio--disabled form-radio--small"><input
													data-v-12d1ffd0="" id="" type="radio" name="delivery-time"
													disabled="disabled" value="dinner"> <span
													data-v-12d1ffd0=""><i data-v-12d1ffd0=""></i></span></label> <span
												data-v-064d23aa="" class="disable">저녁배송</span></label>
										</div>
										<p data-v-064d23aa="">
											오전 9:30까지 주문시 <b style="color: #35ad73; font-weight: normal;">12:00
												전 도착</b>
										</p>
									</div>
									<!---->
								</div>
								<div data-v-064d23aa="" class="order-result-info-wrap">
									<div data-v-064d23aa="" class="order-result-info-header">
										<p data-v-064d23aa="" class="header-title">결제예상금액</p>
									</div>
									<div data-v-064d23aa="" class="order-result-info-body">
										<div data-v-064d23aa=""
											class="row--v-center row--h-center order-result-content">
											<div data-v-064d23aa="">
												<div data-v-064d23aa="" class="info-content">
													<div data-v-064d23aa="" class="info-content-title">상품
														수 / 금액</div>
													<div data-v-064d23aa="">1개 / 1,900원</div>
													<!-- <div data-v-064d23aa="" class="min">최소주문금액까지 4,100원
														남았습니다!</div> -->
												</div>
											</div>
											<div data-v-064d23aa="">
												<div data-v-064d23aa="" class="info-content">
													<div data-v-064d23aa="" class="info-content-title">배송횟수
														/ 배송비</div>
													<div data-v-064d23aa="">0회 / 0원(무료배송)</div>
													<!---->
												</div>
											</div>
											<div data-v-064d23aa="">
												<div data-v-064d23aa="" class="info-content">
													<div data-v-064d23aa="" class="info-content-title">
														할인금액</div>
													<div data-v-064d23aa=""
														style="color: rgb(31, 95, 64); font-weight: bold;">
														- 0원</div>
												</div>
											</div>
											<div data-v-064d23aa="" class="order-result-info-total">
												<div data-v-064d23aa="">
													<b data-v-064d23aa="">총 금액</b>
												</div>
												<div data-v-064d23aa="">
													<em data-v-064d23aa="">0원</em>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div data-v-064d23aa="" class="order-result-payment ">
									<div data-v-064d23aa="" class="row--v-center "
										style="flex-basis: 100%;">
										<div data-v-064d23aa="" class="col">
											<button data-v-a1c889e0="" data-v-064d23aa="" type="button"
												title="" disabled="disabled"
												class="button button--size-large"
												style="width: 100%; height: 50px; margin: 0px auto; border-radius: 2px; font-size: 16px; font-weight: 400;">
												<!-- 버튼 비활성 속성 : background-color: rgb(184, 212, 198);" -->
												<!-- 버튼 비활성 클래스 : button--disabled -->
												<span data-v-a1c889e0="" class="button__wrap"> 구매하기 </span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!---->
							<!---->
							<!---->
							<!---->
							<!---->
							<!---->
						</div>
					</div>
				</div>
				<!---->
			</main>
		</div>
	</div>
	<script>window.__NUXT__=(function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o){return {layout:"default",data:[{visibleNotiModal:e,checkedNever:a}],error:b,state:{appFirstLaunch:a,appCheck:a,appData:b,appVersion:b,appPermission:a,showChTalk:a,isRoot:e,userAgent:"Mozilla\u002F5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\u002F537.36 (KHTML, like Gecko) Chrome\u002F97.0.4692.99 Safari\u002F537.36",deviceId:b,devicePlatform:b,user:{id:271132,email:"tjdtls690@naver.com",name:h,nickname:h,tel:"01057113386",gender:"male",birth:"1993-07-12",comName:d,job:d,point:c,confirmEmail:a,confirmTel:e,newsletterEmail:a,newsletterSms:a,newsletterPush:b,promoCode:"1sby67m4cf",promoCount:c,deliveryCount:g,couponCount:c,reviewCount:c,cartCount:c,isAdmin:a,signinDate:"2022-01-25 07:41:23",signinMethod:"kakao",signupDate:"2022-01-11 15:48:53",authority:"[\"user\"]",service080:a,auth:o,isSignup:b},userInfo:b,Authorization:o,orderMenus:[],orderMenusTemp:[],layout:{headerLine:e},userUpdateAccessAuthority:a,currentPageOGInfo:b,payOrderInfo:b,selectDetail:[],readMenu:b,orderInfo:{},menuPageActiveTab:c,isFirstOrder:a,unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b},checkedOptions:[],visibleBanner:a,loading:a,friendInvitationPoint:i,emailAgreePoint:"2,000",reviewPointObj:{subsNormal:"1,000",subsPic:i,generalNormal:"100",generalPic:"300"},categoryItems:[{id:c,name:"전체보기",path:"\u002Fmenu",isNew:a,isHidden:a},{id:g,name:"정기배송",path:"\u002Fmenu\u002Fsubscription",isNew:a,isHidden:a},{id:2,name:"샐러드",path:"\u002Fmenu\u002Fsalad",isNew:a,isHidden:a},{id:3,name:"랩·샌드위치",path:"\u002Fmenu\u002Fsalad-wrap",isNew:a,isHidden:a},{id:4,name:"도시락·간편식",path:"\u002Fmenu\u002Fmeal",isNew:a,isHidden:a},{id:5,name:"세트상품",path:"\u002Fmenu\u002Fset",isNew:a,isHidden:a},{id:6,name:"간식",path:"\u002Fmenu\u002Fsnack",isNew:a,isHidden:a},{id:7,name:"음료",path:"\u002Fmenu\u002Fdrink",isNew:a,isHidden:a},{id:8,name:"할인기획전",path:"\u002Fmenu\u002Fevent",isNew:a,isHidden:a},{id:9,name:"오픈예정",path:"\u002Fmenu\u002Fsoon",isNew:a,isHidden:a},{id:10,name:"죽·스프",path:"\u002Fmenu\u002Fsoup",isNew:a,isHidden:a}],allMenusSpreadFlag:a,isKakaoInApp:a,headerHeight:91,diy:{targetDiyOrderMenu:b,targetDiyOrderMenuFilterOption:b,targetDiyOrderMenuDetail:b,customOrder:b,customOrderContext:b,customOrderSelectedDates:b,saved:b,selectedSubMenu:{menuId:b,selected:a,size:"Medium",selectedWeek:b,subStartDates:[],startDate:d,startDay:d,discountRate:c,menuTypes:[],menus:[],sum:c,subDeliveryDates:[],pickupDays:[]}},cart:{unavailableQuantity:{isUnavailable:a,list:[]},itemsForAddCartMsg:[],cartItems:[],orderItemsFromCart:[],cartModalObj:{isVisible:a,menu:b}},delivery:{deliveryFeeObj:{spot:c,trialSpot:j,quick:j,morning:k,parcel:k},freeDeliveryAmountObj:{spot:c,trialSpot:l,quick:l,morning:m,parcel:m},minOrderAmountObj:{spot:n,trialSpot:n,quick:f,morning:f,parcel:f}},destination:{userSpots:[],userDests:[],isDinner:a,delivery:d,orderType:d},loadingSpinner:{isLoading:a},menu:{salad:b,wrap:b,snack:b,bundle:b,sub:b,set:b,meal:b,drink:b,soup:b,eventMenu:b,soonMenu:b,menuOrigin:b,loading:a,nonMenus:[222,237,258,388,505],deliveryTypeForDefault:"spot"},spot:{}},serverRendered:e}}(false,null,0,"",true,10000,1,"신준혁","3,000",4000,3500,40000,35000,6000,"Basic MjcxMTMyOjlkNDgyYTZkMDNlODRkYWJiNmFjNTZlODg5YjZhOTU3"));</script><script src="/_nuxt/e601fc7af504e3420b41.js" defer=""></script><script src="/_nuxt/82186e2369e23d362989.js" defer=""></script><script src="/_nuxt/59d81c83dceeaa7a664e.js" defer=""></script><script src="/_nuxt/4d07f0e568ef26d5dad5.js" defer=""></script><script src="/_nuxt/4f3d3d73512bc2da9193.js" defer=""></script><script src="/_nuxt/70eeba06b81fa74a5a22.js" defer=""></script><script src="/_nuxt/8d83503d59ea6c2bc36d.js" defer=""></script><script src="/_nuxt/d2d3d674cceb2325d999.js" defer=""></script><script src="/_nuxt/631469dd3ee90d0cde8e.js" defer=""></script><script src="/_nuxt/37c103fc93c8b873cd8b.js" defer=""></script><script src="/_nuxt/605fbd701ca096ca4a89.js" defer=""></script><script src="/_nuxt/36eaadcb8a6fbe10d38e.js" defer=""></script><script src="/_nuxt/8538008e36d3bf94fc00.js" defer=""></script>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-2.0.js" type="text/javascript"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js" id="wcs-log"></script>



<a class="custom-ch-btn" style="display:none">문의하기</a>
<form name="payForm" id="payForm" method="post" action="" accept-charset="UTF-8" style="display:none">
</form>

<form name="payFormMobile" id="payFormMobile" target="_self" method="post" action="https://web.nicepay.co.kr/v3/smart/smartPayment.jsp" accept-charset="euc-kr" style="display:none">
</form>

<!-- Enliple Tracker Start -->
<script type="text/javascript">!function(e,n,t,c,o){e.enp=e.enp||function(){(e.enp.q=e.enp.q||[]).push(arguments)},(c=n.createElement(t)).async=!0,c.defer=!0,c.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js",(o=n.getElementsByTagName(t)[0]).parentNode.insertBefore(c,o)}(window,document,"script"),enp("create","common","freshcode",{device:"B"}),enp("send","common","freshcode")</script> <!-- Enliple Tracker End -->





<script type="text/javascript" src="/javascript/check-browser.js"></script>
<script type="text/javascript" src="/javascript/channel-plugin.js"></script>

<script>function nicepayStart(){goPay(document.payForm)}function nicepaySubmit(){document.payForm.submit()}function nicepayClose(){alert("결제를 취소 하였습니다."),document.getElementById("payForm").innerHTML="",document.getElementById("pay-btn1").removeAttribute("disabled"),document.getElementById("pay-btn1").classList.remove("button--disabled"),document.getElementById("pay-btn2").removeAttribute("disabled"),document.getElementById("pay-btn2").classList.remove("button--disabled")}function getTomorrow(){var e=new Date,t=e.getTime()+60*e.getTimezoneOffset()*1e3,n=new Date(t+324e5),o=n.getFullYear().toString(),i=(n.getMonth()+1).toString(),a=(n.getDate()+1).toString();return i.length<2&&(i="0"+i),a.length<2&&(a="0"+a),o+i+a}function nicepayMobileStart(){document.payFormMobile.submit()}</script>

<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>


<script type="text/javascript" id="">fbq("trackCustom","SearchKeyword",{search_string:google_tag_manager["GTM-WWVZF4F"].macro(6)});</script>
<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("track","PageView");</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=1891781027718758&amp;ev=PageView&amp;noscript=1"></noscript><script type="text/javascript" id="">(function(g,c){function k(a,f){a.prototype[f]=function(){this._q.push([f].concat(Array.prototype.slice.call(arguments,0)));return this}}function l(a){function f(m){a[m]=function(){a._q.push([m].concat(Array.prototype.slice.call(arguments,0)))}}for(var h=0;h<n.length;h++)f(n[h])}var d=g.amplitude||{_q:[],_iq:{}},b=c.createElement("script");b.type="text/javascript";b.integrity="sha384-cukXwabQy+j/QA1+RqiXSzxhgQg5Rrn3zVszlwH3pWj/bXJxlA8Ge7NhcD6vP2Ik";b.crossOrigin="anonymous";b.async=!0;b.src="https://cdn.amplitude.com/libs/amplitude-7.1.0-min.gz.js";
b.onload=function(){g.amplitude.runQueuedFunctions||console.log("[Amplitude] Error: could not load SDK")};c=c.getElementsByTagName("script")[0];c.parentNode.insertBefore(b,c);b=function(){this._q=[];return this};c="add append clearAll prepend set setOnce unset".split(" ");for(var e=0;e<c.length;e++)k(b,c[e]);d.Identify=b;b=function(){this._q=[];return this};c=["setProductId","setQuantity","setPrice","setRevenueType","setEventProperties"];for(e=0;e<c.length;e++)k(b,c[e]);d.Revenue=b;var n="init logEvent logRevenue setUserId setUserProperties setOptOut setVersionName setDomain setDeviceId enableTracking setGlobalUserProperties identify clearUserProperties setGroup logRevenueV2 regenerateDeviceId groupIdentify onInit logEventWithTimestamp logEventWithGroups setSessionId resetSessionId".split(" ");
l(d);d.getInstance=function(a){a=(a&&0!==a.length?a:"$default_instance").toLowerCase();d._iq.hasOwnProperty(a)||(d._iq[a]={_q:[]},l(d._iq[a]));return d._iq[a]};g.amplitude=d})(window,document);amplitude.getInstance().init("b0c55cafb2647021ff77b3457def2cbe",null,{includeGclid:!0,includeUtm:!0,includeReferrer:!0,saveParamsReferrerOncePerSession:!1});</script><div id="ch-plugin" style="display: none;"><div id="ch-plugin-core"><style data-styled="active" data-styled-version="5.1.1"></style><div data-ch-testid="launcher" hidden="" class="Launcherstyled__Wrapper-oef45p-0 cEmVVI"><div class="Launcherstyled__LauncherIconWrapper-oef45p-1 hgRlbE"><div class="LauncherIconstyled__LauncherWrapper-mnslcf-0 fBGgqH launcherIcon"><div style="position: absolute; inset: 0px; margin: auto;"><img src="https://cf.channel.io/asset/plugin/images/shadow-body.png" role="presentation" alt="" class="InnerIconstyled__Icon-sc-197h5bb-0 gKMpRn LauncherIconstyled__Bubble-mnslcf-1 cRwgrT" color="#27b06e" width="48" height="48" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" style="position: absolute;"><svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" class="InnerIconstyled__Icon-sc-197h5bb-0 gKMpRn LauncherIconstyled__Bubble-mnslcf-1 cRwgrT" color="#27b06e" defaultOpacity="1" hoveredOpacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" style="position: absolute;"><path fill="#27b06e" fill-opacity="0.6" d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></svg><img src="https://cf.channel.io/asset/plugin/images/gradient-body.png" role="presentation" alt="" class="InnerIconstyled__Icon-sc-197h5bb-0 gKMpRn LauncherIconstyled__Bubble-mnslcf-1 cRwgrT" color="#27b06e" width="48" height="48" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" style="position: absolute;"><svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" class="InnerIconstyled__Icon-sc-197h5bb-0 gKMpRn LauncherIconstyled__Bubble-mnslcf-1 cRwgrT" color="#27b06e" defaultOpacity="1" hoveredOpacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" style="position: absolute;"><g filter="url(#filter0_i)"><path fill="white" fill-opacity="0.01" d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></g><defs><filter id="filter0_i" x="4" y="2" width="38" height="40" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"></feColorMatrix><feOffset dx="-2" dy="-4"></feOffset><feGaussianBlur stdDeviation="4"></feGaussianBlur><feComposite in2="hardAlpha" operator="arithmetic" k2="-1" k3="1"></feComposite><feColorMatrix type="matrix" values="0 0 0 0 0.15294117647058825 0 0 0 0 0.6901960784313725 0 0 0 0 0.43137254901960786 0 0 0 0.2 0"></feColorMatrix><feBlend mode="normal" in2="shape" result="effect1_innerShadow"></feBlend></filter></defs></svg><svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" class="InnerIconstyled__Icon-sc-197h5bb-0 gKMpRn LauncherIconstyled__Bubble-mnslcf-1 cRwgrT" color="#27b06e" defaultOpacity="1" hoveredOpacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" style="position: absolute;"><g filter="url(#filter0_f)"><path fill="white" fill-opacity="0.15" d="M19.8462 20.1538C19.8462 22.448 19.2404 24.3077 17.4231 24.3077C15.6058 24.3077 15 22.448 15 20.1538C15 17.8597 15.6058 16 17.4231 16C19.2404 16 19.8462 17.8597 19.8462 20.1538Z"></path><path fill="white" fill-opacity="0.15" d="M24.0001 29.8462C21.201 29.8462 19.7599 27.5828 19.3109 25.9843C19.1615 25.4526 19.6016 25.0001 20.1539 25.0001H27.8462C28.3985 25.0001 28.8386 25.4526 28.6893 25.9843C28.2402 27.5828 26.7992 29.8462 24.0001 29.8462Z"></path><path fill="white" fill-opacity="0.15" d="M30.5768 24.3077C32.3941 24.3077 32.9999 22.448 32.9999 20.1538C32.9999 17.8597 32.3941 16 30.5768 16C28.7595 16 28.1537 17.8597 28.1537 20.1538C28.1537 22.448 28.7595 24.3077 30.5768 24.3077Z"></path></g><path fill="#27b06e" d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path><path fill="#17113F" fill-opacity="0.7" d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path><path fill="#27b06e" d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path><path fill="#17113F" fill-opacity="0.7" d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path><path fill="#27b06e" d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path><path fill="#17113F" fill-opacity="0.7" d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path><defs><filter id="filter0_f" x="13" y="14" width="21.9999" height="17.8462" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="1" result="effect1_foregroundBlur"></feGaussianBlur></filter></defs></svg></div><div data-ch-testid="badge" hidden="" class="Badgestyled__Badge-sc-1ztqq4-0 LauncherIconstyled__Badge-mnslcf-2 dPdaQA">0</div></div></div></div></div><div id="ch-plugin-script" style="display:none" class="ch-messenger-hidden"><iframe id="ch-plugin-script-iframe" style="position:relative!important;height:100%;width:100%!important;border:none!important;" data-gtm-yt-inspected-1_19="true"></iframe></div></div><style data-styled="active" data-styled-version="5.1.1"></style><div id="criteo-tags-div" style="display: none;"></div><script type="text/javascript" id="">amplitude.getInstance().logEvent("Main - View");</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Review - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Delivery - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Detail",{orderNo:google_tag_manager["GTM-WWVZF4F"].macro(65)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Detail",{orderNo:google_tag_manager["GTM-WWVZF4F"].macro(88)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Review - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Destination - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - SpotReq - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Delivery - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Card - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - SpotReq - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Review - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Points - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Card - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Delivery - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Card - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Destination - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu Category View",{category:google_tag_manager["GTM-WWVZF4F"].macro(242)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Card - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Invite - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Destination - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu Category View",{category:google_tag_manager["GTM-WWVZF4F"].macro(293)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu Category View",{category:google_tag_manager["GTM-WWVZF4F"].macro(307)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu Category View",{category:google_tag_manager["GTM-WWVZF4F"].macro(320)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu Category View",{category:google_tag_manager["GTM-WWVZF4F"].macro(333)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Event Page - Enter",{pagePath:google_tag_manager["GTM-WWVZF4F"].macro(345)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("New User Benefits - Enter",{howToIn:google_tag_manager["GTM-WWVZF4F"].macro(356),UtmSource:google_tag_manager["GTM-WWVZF4F"].macro(357),UtmMedium:google_tag_manager["GTM-WWVZF4F"].macro(358),UtmCampaign:google_tag_manager["GTM-WWVZF4F"].macro(359),UtmTerm:google_tag_manager["GTM-WWVZF4F"].macro(360)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Event Page - Enter",{pagePath:google_tag_manager["GTM-WWVZF4F"].macro(363)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Event Page - Enter",{pagePath:google_tag_manager["GTM-WWVZF4F"].macro(368)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("New User Benefits - Enter",{howToIn:google_tag_manager["GTM-WWVZF4F"].macro(378),UtmSource:google_tag_manager["GTM-WWVZF4F"].macro(379),UtmMedium:google_tag_manager["GTM-WWVZF4F"].macro(380),UtmCampaign:google_tag_manager["GTM-WWVZF4F"].macro(381),UtmTerm:google_tag_manager["GTM-WWVZF4F"].macro(382)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Event Page - Enter",{pagePath:google_tag_manager["GTM-WWVZF4F"].macro(385)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Event Page - Enter",{pagePath:google_tag_manager["GTM-WWVZF4F"].macro(390)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Mypage - Orders - Enter");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Main - View");</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><meta property="og:title" content="산펠레그리노 탄산수 500ml">
<meta property="og:description" content="당류 0%, 0kcal 천연 고급탄산수">
<meta property="og:url" content="https://www.freshcode.me/menu/780">
<meta property="og:image" content="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/780_20220118123237">
<meta property="product:brand" content="프레시코드">
<meta property="product:availability" content="in stock">
<meta property="product:condition" content="new">
<meta property="product:price:amount" content="1900">
<meta property="product:price:currency" content="KRW">
<meta property="product:retailer_item_id" content="780"><script type="text/javascript" id="">var openGraph={"og:site_name":"\ud504\ub808\uc2dc\ucf54\ub4dc - \ud504\ub9ac\ubbf8\uc5c4 \uc0d0\ub7ec\ub4dc \ubc30\ub2ec \uc11c\ube44\uc2a4","og:title":"산펠레그리노 탄산수 500ml","og:description":"당류 0%, 0kcal 천연 고급탄산수","og:type":"website","og:url":"https:\/\/www.freshcode.me\/menu\/780","og:image":"https:\/\/s3.ap-northeast-2.amazonaws.com\/freshcode\/menu\/origin\/780_20220118123237","product:brand":"\ud504\ub808\uc2dc\ucf54\ub4dc","product:availability":"in stock","product:condition":"new","product:price:amount":"1900","product:price:currency":"KRW",
"product:retailer_item_id":"780"},schemaOrg=[{properties:{brand:"\ud504\ub808\uc2dc\ucf54\ub4dc",name:"산펠레그리노 탄산수 500ml",description:"당류 0%, 0kcal 천연 고급탄산수",productID:"780",url:"https:\/\/www.freshcode.me\/menu\/780",image:"https:\/\/s3.ap-northeast-2.amazonaws.com\/freshcode\/menu\/origin\/780_20220118123237"},subscopes:[{properties:{availability:"https:\/\/schema.org\/InStock",itemCondition:"http://schema.org/NewCondition",price:"1900",priceCurrency:"KRW"},type:"http://schema.org/Offer"}],type:"http://schema.org/Product"}];
fbq("track","Microdata",{OpenGraph:openGraph,"Schema.org":schemaOrg});fbq("track","ViewContent",{content_ids:google_tag_manager["GTM-WWVZF4F"].macro(425),content_name:google_tag_manager["GTM-WWVZF4F"].macro(426),content_category:google_tag_manager["GTM-WWVZF4F"].macro(427),content_type:"product",value:google_tag_manager["GTM-WWVZF4F"].macro(428),currency:"KRW"});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu View",{productId:google_tag_manager["GTM-WWVZF4F"].macro(429),productName:google_tag_manager["GTM-WWVZF4F"].macro(430),productType:google_tag_manager["GTM-WWVZF4F"].macro(431),price:google_tag_manager["GTM-WWVZF4F"].macro(432),couponDownVisibility:google_tag_manager["GTM-WWVZF4F"].macro(433)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu Direct Order",{productId:google_tag_manager["GTM-WWVZF4F"].macro(441),$quantity:google_tag_manager["GTM-WWVZF4F"].macro(443),productName:google_tag_manager["GTM-WWVZF4F"].macro(445),productDetailId:google_tag_manager["GTM-WWVZF4F"].macro(447),productDetailName:google_tag_manager["GTM-WWVZF4F"].macro(449),productType:google_tag_manager["GTM-WWVZF4F"].macro(451),price:google_tag_manager["GTM-WWVZF4F"].macro(453),optionSelect:google_tag_manager["GTM-WWVZF4F"].macro(454)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(463)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(464)});</script><script type="text/javascript" id="">fbq("trackCustom","Order - Enter");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Enter",{spotId:"undefined"});amplitude.getInstance().setUserId("271132");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Main - View");</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Enter");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Enter",{spotId:"undefined"});amplitude.getInstance().setUserId("271132");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(496)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(497)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(516)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(517)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(531)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(532)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(546)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(547)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(561)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(562)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(576)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(577)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(591)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(592)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Cart View",{productId:google_tag_manager["GTM-WWVZF4F"].macro(614),$quantity:google_tag_manager["GTM-WWVZF4F"].macro(616),productName:google_tag_manager["GTM-WWVZF4F"].macro(618),productDetailId:google_tag_manager["GTM-WWVZF4F"].macro(620),productDetailName:google_tag_manager["GTM-WWVZF4F"].macro(622),productType:google_tag_manager["GTM-WWVZF4F"].macro(624),price:google_tag_manager["GTM-WWVZF4F"].macro(626)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Main - View");</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><meta property="og:title" content="산펠레그리노 탄산수 500ml">
<meta property="og:description" content="당류 0%, 0kcal 천연 고급탄산수">
<meta property="og:url" content="https://www.freshcode.me/menu/780">
<meta property="og:image" content="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/780_20220118123237">
<meta property="product:brand" content="프레시코드">
<meta property="product:availability" content="in stock">
<meta property="product:condition" content="new">
<meta property="product:price:amount" content="1900">
<meta property="product:price:currency" content="KRW">
<meta property="product:retailer_item_id" content="780"><script type="text/javascript" id="">var openGraph={"og:site_name":"\ud504\ub808\uc2dc\ucf54\ub4dc - \ud504\ub9ac\ubbf8\uc5c4 \uc0d0\ub7ec\ub4dc \ubc30\ub2ec \uc11c\ube44\uc2a4","og:title":"산펠레그리노 탄산수 500ml","og:description":"당류 0%, 0kcal 천연 고급탄산수","og:type":"website","og:url":"https:\/\/www.freshcode.me\/menu\/780","og:image":"https:\/\/s3.ap-northeast-2.amazonaws.com\/freshcode\/menu\/origin\/780_20220118123237","product:brand":"\ud504\ub808\uc2dc\ucf54\ub4dc","product:availability":"in stock","product:condition":"new","product:price:amount":"1900","product:price:currency":"KRW",
"product:retailer_item_id":"780"},schemaOrg=[{properties:{brand:"\ud504\ub808\uc2dc\ucf54\ub4dc",name:"산펠레그리노 탄산수 500ml",description:"당류 0%, 0kcal 천연 고급탄산수",productID:"780",url:"https:\/\/www.freshcode.me\/menu\/780",image:"https:\/\/s3.ap-northeast-2.amazonaws.com\/freshcode\/menu\/origin\/780_20220118123237"},subscopes:[{properties:{availability:"https:\/\/schema.org\/InStock",itemCondition:"http://schema.org/NewCondition",price:"1900",priceCurrency:"KRW"},type:"http://schema.org/Offer"}],type:"http://schema.org/Product"}];
fbq("track","Microdata",{OpenGraph:openGraph,"Schema.org":schemaOrg});fbq("track","ViewContent",{content_ids:google_tag_manager["GTM-WWVZF4F"].macro(651),content_name:google_tag_manager["GTM-WWVZF4F"].macro(652),content_category:google_tag_manager["GTM-WWVZF4F"].macro(653),content_type:"product",value:google_tag_manager["GTM-WWVZF4F"].macro(654),currency:"KRW"});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu View",{productId:google_tag_manager["GTM-WWVZF4F"].macro(655),productName:google_tag_manager["GTM-WWVZF4F"].macro(656),productType:google_tag_manager["GTM-WWVZF4F"].macro(657),price:google_tag_manager["GTM-WWVZF4F"].macro(658),couponDownVisibility:google_tag_manager["GTM-WWVZF4F"].macro(659)});</script><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;" data-gtm-yt-inspected-1_19="true"></iframe><script type="text/javascript" defer="" id="wcs">
          var _nasa= {};
                          
          if (!wcs_add) var wcs_add={};
          wcs_add["wa"]="s_396f73cd4419";
          if (!_nasa) var _nasa={};
          wcs.inflow();
          wcs_do(_nasa);
        </script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Menu Direct Order",{productId:google_tag_manager["GTM-WWVZF4F"].macro(667),$quantity:google_tag_manager["GTM-WWVZF4F"].macro(669),productName:google_tag_manager["GTM-WWVZF4F"].macro(671),productDetailId:google_tag_manager["GTM-WWVZF4F"].macro(673),productDetailName:google_tag_manager["GTM-WWVZF4F"].macro(675),productType:google_tag_manager["GTM-WWVZF4F"].macro(677),price:google_tag_manager["GTM-WWVZF4F"].macro(679),optionSelect:google_tag_manager["GTM-WWVZF4F"].macro(680)});</script><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","1891781027718758");</script><script type="text/javascript" id="">fbq("trackCustom","Order - Product Select - Enter",{content_category:google_tag_manager["GTM-WWVZF4F"].macro(689)});</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Product Select - Enter",{shippingType:google_tag_manager["GTM-WWVZF4F"].macro(690)});</script><script type="text/javascript" id="">fbq("trackCustom","Order - Enter");</script><script type="text/javascript" id="">amplitude.getInstance().logEvent("Order - Enter",{spotId:"undefined"});amplitude.getInstance().setUserId("271132");</script><script type="text/javascript" defer="" id="wcs">
          var _nasa= {};
                          
          if (!wcs_add) var wcs_add={};
          wcs_add["wa"]="s_396f73cd4419";
          if (!_nasa) var _nasa={};
          wcs.inflow();
          wcs_do(_nasa);
        </script></body></html>