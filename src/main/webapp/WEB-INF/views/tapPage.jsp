<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/tapPage"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<link href="${path}/style1.css" rel="stylesheet" type="text/css" />
	<link href="${path}/style2.css?ver=3" rel="stylesheet" type="text/css" />
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
	var tag = $(this).children('#tagMain').attr('value');
	var tagSub = $(this).children('#tagSub').attr('value');
	f.tagMain01.value = tag;
	f.itemCode01.value = code;
	f.tagSub01.value = tagSub;
	f.action="detail.do"; // 상세페이지 url 로 연결만 시키기
	f.method="post";
	f.submit();
})


$(function() { 
	$(document).on('click', '.btn-order', function(){
		$(location).attr("href", "order.do");
	})
	
	var tagMainStart = ${tagMain};
	$('#menu' + tagMainStart).attr('class','nuxt-link-exact-active nuxt-link-active all-menus-item-link');
	
	
	
	$(document).on('click', '.all-menus-arrow-wrap.spread', function(){
		$('.all-menus-spread-container.height-plus').detach();
	})
	
	$('.all-menus-arrow-wrap').on('click', function(){
		$.ajax({
			url : 'dropDownAllMenu.do',
			dataType : 'html',
			success : function(htmlOut){
				$('header').append(htmlOut);
				$('#menuSe' + tagMainStart).attr('class','nuxt-link-exact-active nuxt-link-active all-menus-item-link');
				$('#menuSe' + tagMainStart).sibling().attr('class','all-menus-item-link');
			}
		})
	})
	
	$('.all-menus-item-link').on('click', function(){
		$(this).attr('class', 'nuxt-link-exact-active nuxt-link-active all-menus-item-link');
		$(this).sibling().attr('class', 'all-menus-item-link');
	})
	
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
	
	$('.category-tab-content00').children().on('click', function(){
		$(this).addClass('active-category00');
		$(this).siblings().removeClass('active-category00');
	});
	
	// ajax 태그기능 넣을 함수
	$(document).on("click", ".active-category00", function(event){
        // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
        var tagNum = $(this).attr('id');
        var tagMainNum = $(this).next().attr('value');
        $.ajax({
        	url : 'tag.do',
        	type : 'post',
        	dataType : 'html',
        	data : {
        		"tagNum" : tagNum
        	},
        	success : function(htmlOut){
        		if(tagNum % 100 != 0){
        			$('.row' + tagMainNum).html(htmlOut);
        		}else{
        			$('.row' + tagNum).html(htmlOut);
        		}
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
    
    
 // 작은 장바구니
 	$(document).on('click','.btn-cart',function(e){
 		e.stopPropagation();
 		var code = $(this).parent().parent().prev().prev().prev().attr('value');
 		var tagMain = $(this).parent().parent().prev().prev().attr('value');
 		var tagSub = $(this).parent().parent().prev().attr('value');
 		
 		$.ajax({
 			url : 'detaillLginCheck.do',
 			success : function(data){
 				if(data == 1){
 					$.ajax({
 			 			url : 'cartModal.do',
 			 			type : 'post',
 			 			dataType : 'html',
 			 			data :{
 			 				"code" : code,
 			 				"tagMain" : tagMain,
 			 				"tagSub" : tagSub
 			 			},
 			 			success : function(htmlOut){
 			 				$('#forModal').append(htmlOut);
 			 			}
 			 		
 			 		})
 				}else{
 					$(location).attr("href", "login.do");
 				}
 			}
 		})
		
 		
 		
 	})
 // 작은 장바구니 + 버튼 처리
 	$(document).on('click','#plus-button',function(){
 		var val = Number($(this).prev().children().val());
 		// 찍을 가격
 		var strPrice2 = $(this).parent().parent().parent().prev().children('.detail-price').text();
 		var getPrice =  Number(strPrice2.replace('원','').replace(',', ''));
 		// 찍힐가격
 		var strPrice = $('.price-wrap').children('.price-right').text();
 		var nowPrice =  Number(strPrice.replace('원','').replace(',', ''));
 		
 	// 버튼 누를시 개수 +
 		val +=1;
 		$(this).prev().children().val(val);
 	// + 만큼 값 찍기
 		nowPrice += getPrice;
 		$('.price-wrap').children('.price-right').text(Number(nowPrice).toLocaleString('en')+"원");
 	// 장바구니 담기 버튼 활성화
 		$('#mobCart').removeClass('button--disabled');
 		$('#mobCart').removeAttr('disabled');
 		
 	})
 	
 // 작은 장바구니 - 버튼 처리
 	$(document).on('click','#minus-button',function(){
		var val = Number($(this).next().children().val());
		// 찍을 가격
 		var strPrice2 = $(this).parent().parent().parent().prev().children('.detail-price').text();
 		var getPrice =  Number(strPrice2.replace('원','').replace(',', ''));
		// 찍힐 가격
		var strPrice = $('.price-wrap').children('.price-right').text();
 		var nowPrice =  Number(strPrice.replace('원','').replace(',', ''));
		
		
 	// 버튼 누를시 개수 -
		if(val > 0){
	 		val -=1;
	 		$(this).next().children().val(val);
	 		nowPrice -= getPrice;
	 		$('.price-wrap').children('.price-right').text(Number(nowPrice).toLocaleString('en')+"원");
		}
		else{
			val = 0;
		}
 	
 	// 장바구니에 아무것도없을시에 장바구니담기 비활성화
 		if(nowPrice ==0){
 			$('#mobCart').addClass('button--disabled');
 			$('#mobCart').attr('disabled','disabled');
 		}
 		
 	})
 	
 // 작은 장바구니 장바구니에 담기 처리
 	$(document).on('click','#mobCart',function(){ 
 		//alert("장바구니 담기");
	// 장바구니에 넒길 값
		var itemCode = [], data = {};
		var tagMain = [];
		var strPrice =[];	// 원 , , 지우기용
		var strPrice2 =[];  // 원 , , 지우기용
		var price = [];
		var priceSub = [];
		var itemName = [];
		var itemSize = [];
		var itemImage = [];
		var tagSub = [];
		var itemQuantity = [];
		

		var length = $('.detail-item').children().length;
		// 길이 조절
		if(length == 9){
			length = 1;
		}else if(length == 18){
			length = 2;
		}
		
		for(var i =0; i < length; i++){
			itemCode[i] = $('.detail-item').eq(i).children().eq(0).attr('value')
			tagMain[i] = $('.detail-item').eq(i).children().eq(1).attr('value')
			strPrice[i] = $('.detail-item').eq(i).children().eq(2).attr('value')
			price[i] = Number(strPrice[i].replace('원','').replace(',', ''))
			strPrice2[i] = $('.detail-item').eq(i).children().eq(3).attr('value')
			priceSub[i] = Number(strPrice2[i].replace('원','').replace(',', ''))
			itemName[i] = $('.detail-item').eq(i).children().eq(4).attr('value')
			itemSize[i] = $('.detail-name').eq(i).attr('id');
			itemImage[i] = $('.detail-item').eq(i).children().eq(5).attr('value')
			tagSub[i] = $('.detail-item').eq(i).children().eq(6).attr('value')
			itemQuantity[i] = Number($('.form-number__input').eq(i).children().val())
		}
		
	    data.itemCode = itemCode;
	    data.tagMain = tagMain;
	    data.price = price;
	    data.priceSub = priceSub;
	    data.itemName = itemName;
	    data.itemSize = itemSize;
	    data.tagSub = tagSub;
	    data.itemImage = itemImage;
	    data.itemQuantity = itemQuantity;
	    jQuery.ajaxSettings.traditional = true;
	    
	    $.ajax({ // 장바구니 넣기 확인 모달
	    	url : "test.do",  // detail Controller에 있음.
	    	type : 'post',
	    	dataType : 'html',
	    	data : data,
	    	success : function(html){
	    		$('#cart-modal').remove();
	    		$('body').append(html);
	    		setTimeout(function() {
					$('.swal2-container').detach();
				}, 2500);

	   			
	    		
	    	}
	    }) //ajax 끝
	    
	    var thisItemImage = $('.detail-item').eq(0).children().eq(5).attr('value')
	    var thisItemName = $('.detail-item').eq(0).children().eq(4).attr('value');
	 	var thisItemSize =  $('.detail-name').eq(0).attr('id');
	    
	    
	    $.ajax({ // 장바구니 아래에 모달
	    	url : "addCart.do",
	    	type : 'post',
	    	dataType : 'html',
	    	data : {
	    		"image" : thisItemImage,
	    		"name" : thisItemName,
	    		"size" : thisItemSize  		
	    	},
	    	success:function(html){
	    		$('.cart-logo-wrap').append(html);
	    		setTimeout(function() {
					$('.add-cart-modal').detach();
				}, 2500);
	    		
	    	}
	    }) // ajax 끝

 		
 	})
 
 // 작은 장바구니 모달 닫기
 	$(document).on('click','.cancel-btn',function(){
 		$('#cart-modal').remove();
 	})
	
	
});
</script>
<style type="text/css">
.btn-cart[data-v-15082832] {
    position: absolute;
    bottom: 8px;
    right: 8px;
    width: 36px;
    height: 36px;
    background-color: #35ad73;
    opacity: .9;
    border-radius: 100%;
    background-image: url(https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_cart_white2.png);
    background-repeat: no-repeat;
    background-size: 24px;
    background-position: 50%;
}
a[data-v-7aa1f9b44]{
    position: left;
    bottom: 20px;
    right: 20px;
    width: 150px;
    height: 50px;
    opacity: .9;
    background-image: url(https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Delivery-on-Header.gif);
    background-repeat: no-repeat;
    background-size: 150px;
    background-position: 100%;
	
}

</style>	
</head>
<body>
	<div id="__nuxt">
		<div id="__layout">
			<main class="viewport" data-v-0f5971ec="">
				<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b44 href="#" class="header__top-left"></a>
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
						<form name="paging">
							<input type="hidden" name="tagMain01" value="">
							<input type="hidden" name="itemCode01" value="">
							<input type="hidden" name="tagSub01" value="">
						</form>
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
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(600);" class="item">세트상품 </a>
									<a data-v-7aa1f9b4="" href="event.do" class="item">이벤트 </a>
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
										href="javascript:page_move(200);" data-v-7aa1f9b4="" class=""> 샐러드 </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(300);" data-v-7aa1f9b4="" class=""> 샌드위치·랩 </a></li>
								</ul>
							</div>
							<div class="all-menus-container" style="display:;"
								data-v-7aa1f9b4="">
								<div class="all-menus-list-wrap" data-v-7aa1f9b4="">
									<ul class="all-menus-list js-all-menus-list" data-v-7aa1f9b4="">
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(0);" id="menu0"
											class="all-menus-item-link"
											data-v-7aa1f9b4=""> 전체보기 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(200);" id="menu200"
											class="all-menus-item-link"
											data-v-7aa1f9b4="" aria-current="page"> 샐러드 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(100);" id="menu100"
											class="all-menus-item-link new"
											data-v-7aa1f9b4=""> 정기구독 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(300);" id="menu300"
											class="all-menus-item-link new"
											data-v-7aa1f9b4=""> 샌드위치·랩 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(400);" id="menu400"
											class="all-menus-item-link new"
											data-v-7aa1f9b4=""> 도시락·간편식 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(500);" id="menu500"
											class="all-menus-item-link"
											data-v-7aa1f9b4=""> 죽·스프 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(600);" id="menu600"
											class="all-menus-item-link new"
											data-v-7aa1f9b4=""> 세트상품 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(700);" id="menu700"
											class="all-menus-item-link new"
											data-v-7aa1f9b4=""> 간식 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(800);" id="menu800"
											class="all-menus-item-link new"
											data-v-7aa1f9b4=""> 음료 </a></li>
										<li class="all-menus-item" data-v-7aa1f9b4=""><a
											href="javascript:page_move(1);" id="menu1"
											class="all-menus-item-link new"
											data-v-7aa1f9b4=""> 초코베리머치 </a></li>
									</ul>
								</div>
								<div class="all-menus-shadow" data-v-7aa1f9b4=""></div>
								<div class="all-menus-arrow-wrap" data-v-7aa1f9b4="">
									<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" alt=""
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
					<div data-v-0f5971ec="" id="forModal">
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
							
							
								<c:if test="${tagMain != 0 }">
									<section data-v-4c9a9e82="" id="content_salad"
										class="menus__section">
											<h3 data-v-4c9a9e82="" class="category-title">${tagInfo[0].tagNameMain }</h3>
											<c:if test="${itemInfo[0].tagMain != 700 && itemInfo[0].tagMain != 800 && itemInfo[0].tagMain != 1}">
												<div data-v-0ca25db4="" data-v-4c9a9e82="" class="category-tab">
													<div data-v-0ca25db4="" class="category-tab-content">
														<div data-v-0ca25db4="" class="active-category" id="${itemInfo[0].tagMain }">전체</div>
														<c:forEach var="tag" items="${tagInfo }">
															<div data-v-0ca25db4="" id="${tag.tagSub }">${tag.tagNameSub }</div>
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
														<input type="hidden" value="${item.tagSub }" id="tagSub">
														<div data-v-15082832="" class="for-loop-cloned-item-244">
															<figure data-v-15082832=""
																class="item__image for-loop-cloned-item-244">
																<div data-v-15082832="" class="item-badge for-loop-cloned-item-244">
																	<!---->
																	<c:if test="${item.tagSub eq 302}">
																		<div data-v-15082832="" class="for-loop-cloned-item-244">
        																  하루 50개 한정
        																</div>
																	</c:if>
																	<c:if test="${item.kind eq '락토'}">
																		<div data-v-15082832="" class="for-loop-cloned-item-244">
        																	best item
        																</div>
																	</c:if>
																</div>
																<img data-v-15082832=""
																	src="${item.itemImage }"
																	alt="${item.itemName } " title="${item.itemName } "
																	class="for-loop-cloned-item-244">
																	<c:if test="${item.tagMain ne 100}">
																		<div data-v-15082832="" class="btn-cart js-btn-cart"></div>
																	</c:if>
																	
															</figure>
															<div data-v-15082832=""
																class="item__body for-loop-cloned-item-244">
																<!---->
<!-- 																구독 애들이 허전해보여서 추가해보았다 -->
															<c:if test="${item.tagMain eq 100}">
																<div data-v-29c2185a="" data-v-15082832="" style="position: relative; z-index: 1;">
																	<div data-v-29c2185a="" class="move-balloon">
																		<span data-v-29c2185a="" class="tooltip-text-orange" style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">
																			구독전용 15% 쿠폰
																		</span>
																	</div>
																</div>
															</c:if>
<!-- 															샐러드에 그냥 하나 추가 시켜봄 ㅋㅋ -->
															<c:if test="${item.kind eq '비건'}">
																<div data-v-29c2185a="" data-v-15082832="" style="position: relative; z-index: 1;">
																	<div data-v-29c2185a="" class="move-balloon">
																		<span data-v-29c2185a="" class="tooltip-text-orange" style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">
																			비건 추천 상품
																		</span>
																	</div>
																</div>
															</c:if>
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
																			
																			<c:if test="${item.kind eq '비건'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					비건</div>
																			</c:if>
																			<c:if test="${item.kind eq '페스코'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					페스코 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '폴로'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					폴로 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '락토'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					락토 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '플렉시'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					플렉시 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '채식'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					채식</div>
																			</c:if>
																			<c:if test="${item.kind eq '오보'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					오보 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '프로틴'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					프로틴</div>
																			</c:if>	
	
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
								</c:if>
								
								
								
								<c:if test="${tagMain == 0 }">
									<c:forEach var="itemList" items="${itemInfo }" varStatus="i">
										<section data-v-4c9a9e82="" id="content_salad" class="menus__section">
										<article data-v-4c9a9e82="" class="menus">
											<div data-v-4c9a9e82="" class="menus__body">
											<section data-v-4c9a9e82="" id="content_salad" class="menus__section">
											<h3 data-v-4c9a9e82="" class="category-title">${tagInfo[i.index][0].tagNameMain }</h3>
											
											<c:if test="${tagInfo[i.index][0].tagMain != 700 && tagInfo[i.index][0].tagMain != 800}">
												<div data-v-0ca25db4="" data-v-4c9a9e82="" class="category-tab">
													<div data-v-0ca25db4="" class="category-tab-content00">
														<div data-v-0ca25db4="" class="active-category00" id="${tagInfo[i.index][0].tagMain }">전체</div>
														<c:forEach var="tag" items="${tagInfo[i.index] }">
															<div data-v-0ca25db4="" class="" id="${tag.tagSub }">${tag.tagNameSub }</div>
															<input type="hidden" value="${tag.tagMain }">
														</c:forEach>
													</div>
												</div>
											</c:if>
										<div data-v-4c9a9e82="" class="menus-index">
											<ul data-v-4c9a9e82="" class="row${tagInfo[i.index][0].tagMain }">
											
											<c:forEach var="item" items="${itemList }">
												<li data-v-4c9a9e82="" class="col-6 col--lg-3">
												<article
														data-v-15082832="" data-v-4c9a9e82=""
														class="item for-loop-cloned-item-244">
														<input type="hidden" value="${item.itemCode }" id="itemCode">
														<input type="hidden" value="${item.tagMain }" id="tagMain">
														<input type="hidden" value="${item.tagSub }" id="tagSub">
														<div data-v-15082832="" class="for-loop-cloned-item-244">
															<figure data-v-15082832=""
																class="item__image for-loop-cloned-item-244">
																<div data-v-15082832="" class="item-badge for-loop-cloned-item-244">
																	<!---->
																	
																</div>
																<img data-v-15082832=""
																	src="${item.itemImage }"
																	alt="${item.itemName } " title="${item.itemName } "
																	class="for-loop-cloned-item-244">
																<c:if test="${item.tagMain ne 100}">
																	<div data-v-15082832="" class="btn-cart js-btn-cart"></div>
																</c:if>
															</figure>
															<div data-v-15082832=""
																class="item__body for-loop-cloned-item-244">
																<!---->
<!-- 																구독 애들이 허전해보여서 추가해보았다 -->
															<c:if test="${item.tagMain eq 100}">
																<div data-v-29c2185a="" data-v-15082832="" style="position: relative; z-index: 1;">
																	<div data-v-29c2185a="" class="move-balloon">
																		<span data-v-29c2185a="" class="tooltip-text-orange" style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">
																			20% 쿠폰
																		</span>
																	</div>
																</div>
															</c:if>
<!-- 															샐러드에 그냥 하나 추가 시켜봄 ㅋㅋ -->
															<c:if test="${item.kind eq '비건'}">
																<div data-v-29c2185a="" data-v-15082832="" style="position: relative; z-index: 1;">
																	<div data-v-29c2185a="" class="move-balloon">
																		<span data-v-29c2185a="" class="tooltip-text-orange" style="background: rgb(253, 116, 73) !important; top: -33px; left: 0px;">
																			비건에 어그로 끌기
																		</span>
																	</div>
																</div>
															</c:if>
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
																		<c:if test="${item.kind eq '비건'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					비건</div>
																			</c:if>
																			<c:if test="${item.kind eq '페스코'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					페스코 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '폴로'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					폴로 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '락토'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					락토 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '플렉시'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					플렉시 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '채식'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					채식</div>
																			</c:if>
																			<c:if test="${item.kind eq '오보'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					오보 베지테리언</div>
																			</c:if>
																			<c:if test="${item.kind eq '프로틴'}">
																				<div data-v-15082832=""
																					class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag">
																					프로틴</div>
																			</c:if>	
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
									</section>
									</c:forEach>
								</c:if>
								
								
								
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
</body>
</html>