<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myReviewSearch"/>
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
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
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
		    
		    // 후기 작성 탭 버튼 누를 시
		    $(document).on('click', '.nav-tab__wrap button:even', function(){
		    	$(this).parent().attr('class', 'on');
		    	$(this).parent().siblings().attr('class', '');
		    	
		    	$.ajax({
		    		url : 'myReviewSearchWriteReviewTab.do',
		    		dataType : 'html',
		    		success : function(htmlOut){
		    			$('.review-index').children('div').detach();
		    			$('.review-index').append(htmlOut);
		    		}
		    	})
		    })
		    
		    // 작성한 후기 탭 버튼 누를 시
		    $(document).on('click', '.nav-tab__wrap button:odd', function(){
		    	$(this).parent().attr('class', 'on');
		    	$(this).parent().siblings().attr('class', '');
		    	
		    	$.ajax({
		    		url : 'myReviewSearchWriteCompleteReviewTab.do',
		    		dataType : 'html',
		    		success : function(htmlOut){
		    			$('.review-index').children('div').detach();
		    			$('.review-index').append(htmlOut);
		    		}
		    	})
		    })
	    	
	    	
	    	// 후기 남기기 desktop 버튼
	    	$(document).on('click', '.review-write-wrap button', function(){
	    		var tagMain = $(this).siblings('input').eq(0).val();
	    		var itemCode = $(this).siblings('input').eq(1).val();
	    		var mappingCode = $(this).siblings('input').eq(2).val();
	    		var paymentCode = $(this).siblings('input').eq(3).val();
	    		
	    		var form = document.createElement('form'); // 폼객체 생성
	    		
	    		// 메인 태그 번호
	     		var objs1;
	     		objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs1.setAttribute('name', 'tagMain'); // 객체이름
	     		objs1.setAttribute('value', tagMain); //객체값
	            form.appendChild(objs1);
	     		
	         	// 아이템 코드
	     		var objs2;
	     		objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs2.setAttribute('name', 'itemCode'); // 객체이름
	     		objs2.setAttribute('value', itemCode); //객체값
	            form.appendChild(objs2);
	     		
	        	// 매핑 코드 (고유 번호)
	     		var objs3;
	     		objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs3.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs3.setAttribute('name', 'mappingCode'); // 객체이름
	     		objs3.setAttribute('value', mappingCode); //객체값
	            form.appendChild(objs3);
	     		
	         	// 페이먼트 코드 (고유 번호)
	     		var objs4;
	     		objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs4.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs4.setAttribute('name', 'paymentCode'); // 객체이름
	     		objs4.setAttribute('value', paymentCode); //객체값
	            form.appendChild(objs4);
	     		
	            form.setAttribute('method', 'post'); //get,post 가능
	            form.setAttribute('action', "myReviewWrite.do"); //보내는 url
	            document.body.appendChild(form);
	            form.submit();
	    	})
	    	
	    	// 후기 남기기 mobile 버튼
	    	$(document).on('click', '.review-write-wrap-mobile button', function(){
	    		var tagMain = $(this).siblings('input').eq(0).val();
	    		var itemCode = $(this).siblings('input').eq(1).val();
	    		var mappingCode = $(this).siblings('input').eq(2).val();
	    		var paymentCode = $(this).siblings('input').eq(3).val();
	    		
	    		var form = document.createElement('form'); // 폼객체 생성
	    		
	    		// 메인 태그 번호
	     		var objs1;
	     		objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs1.setAttribute('name', 'tagMain'); // 객체이름
	     		objs1.setAttribute('value', tagMain); //객체값
	            form.appendChild(objs1);
	     		
	         	// 아이템 코드
	     		var objs2;
	     		objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs2.setAttribute('name', 'itemCode'); // 객체이름
	     		objs2.setAttribute('value', itemCode); //객체값
	            form.appendChild(objs2);
	     		
	        	// 매핑 코드 (고유 번호)
	     		var objs3;
	     		objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs3.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs3.setAttribute('name', 'mappingCode'); // 객체이름
	     		objs3.setAttribute('value', mappingCode); //객체값
	            form.appendChild(objs3);
	     		
	     		
	         	// 페이먼트 코드 (고유 번호)
	     		var objs4;
	     		objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs4.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs4.setAttribute('name', 'paymentCode'); // 객체이름
	     		objs4.setAttribute('value', paymentCode); //객체값
	            form.appendChild(objs4);
	     		
	            form.setAttribute('method', 'post'); //get,post 가능
	            form.setAttribute('action', "myReviewWrite.do"); //보내는 url
	            document.body.appendChild(form);
	            form.submit();
	    	});
	    	
	    	
	    	// 작성한 후기 탭에서 삭제 버튼
	    	$(document).on('click', '.delete-review', function(){
	    		if(confirm("작성하신 후기를 삭제하시겠습니까?") == true){
	    			var payment_item_mapping_code = $(this).siblings('input').eq(0).val();
	    			var seq = $(this).siblings('input').eq(1).val();
	    			
		    		$.ajax({
		    			url : 'mySearchReviewDelete.do',
		    			type : 'post',
		    			data : {
		    				'payment_item_mapping_code' : payment_item_mapping_code,
		    				'seq' : seq
		    			},
		    			success : function(data){
		    				$('.nav-tab__wrap button:odd').parent().attr('class', 'on');
		    		    	$('.nav-tab__wrap button:odd').parent().siblings().attr('class', '');
		    		    	
		    		    	$.ajax({
		    		    		url : 'myReviewSearchWriteCompleteReviewTab.do',
		    		    		dataType : 'html',
		    		    		success : function(htmlOut){
		    		    			$('.review-index').children('div').detach();
		    		    			$('.review-index').append(htmlOut);
		    		    		}
		    		    	})
		    			}
		    		})
			    }else{
			        return ;
			    }
	    	})
	    	
	    	
	    	// 작성한 후기 수정 버튼
	    	$(document).on('click', '.modify-review', function(){
	    		var payment_item_mapping_code = $(this).siblings('input').eq(0).val();
	    		var seq = $(this).siblings('input').eq(1).val();
	    		
	    		
				var form = document.createElement('form'); // 폼객체 생성
	    		
	    		// 리뷰 시퀀스 번호 (고유 번호)
	     		var objs1;
	     		objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs1.setAttribute('name', 'seq'); // 객체이름
	     		objs1.setAttribute('value', seq); //객체값
	            form.appendChild(objs1);
	     		
	         	// 페이먼트 매핑 테이블 고유번호 (고유 번호)
	     		var objs2;
	     		objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	     		objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	     		objs2.setAttribute('name', 'payment_item_mapping_code'); // 객체이름
	     		objs2.setAttribute('value', payment_item_mapping_code); //객체값
	            form.appendChild(objs2);
	     		
	            form.setAttribute('method', 'post'); //get,post 가능
	            form.setAttribute('action', "myReviewWriteModify.do"); //보내는 url
	            document.body.appendChild(form);
	            form.submit();
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
							<a data-v-7aa1f9b4="" href="#" class="header__top-left"></a>
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
					<!---->
					<!---->
					<!---->
					<!---->
				</header>
				<div class="container" data-v-0f5971ec="">
					<div data-v-421abad8="" data-v-d06869c8="" data-v-0f5971ec=""
						class="mypage-layout">
						<div data-v-3e2784be="" data-v-421abad8=""
							class="mypage-header mypage-layout__header">
							<div data-v-3e2784be="" class="mypage-header-info">
								<div data-v-3e2784be=""
									class="col row row--v-center mypage-header-info__profile">
									<figure data-v-3e2784be="">
										<img data-v-3e2784be="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_ico-leaf.svg" alt="">
									</figure>
									<div data-v-3e2784be="">
										<strong data-v-3e2784be="">${member.name }</strong> <span
											data-v-3e2784be="">${member.email }</span>
									</div>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">배송예정</span> <a data-v-3e2784be=""
											href="myDelivery.do" class=""><em data-v-3e2784be="">${deliveryNum }</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">포인트</span> <a data-v-3e2784be=""
											href="myPointSearch.do" class=""><em data-v-3e2784be=""><fmt:formatNumber value="${point }" pattern="#,###" /></em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">보유 쿠폰</span> <a data-v-3e2784be=""
											href="myCouponSearch.do" class=""><em data-v-3e2784be="">${couponNum }</em></a>
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
									<article data-v-d06869c8="" data-v-421abad8=""
										class="review-index">
										<header data-v-2c0651a8="" data-v-d06869c8=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">나의 후기</h2>
											<!---->
										</header>
										<p data-v-d06869c8="" data-v-421abad8="" id="page-description"
											class="page-description">
											텍스트후기: 100 포인트 / 이미지후기: 300 포인트
										</p>
										<nav data-v-610ea6d8="" data-v-d06869c8=""
											class="nav-tab review-index__tab" data-v-421abad8="">
											<div data-v-610ea6d8="" class="nav-tab__wrap">
												<div data-v-610ea6d8="" class="on">
													<button data-v-610ea6d8="" type="button">
														<span data-v-610ea6d8="">후기작성 <em
															style="font-size: 14px; font-family: Roboto"></em></span>
													</button>
												</div>
												<div data-v-610ea6d8="" class="">
													<button data-v-610ea6d8="" type="button">
														<span data-v-610ea6d8="">작성한 후기 <em></em></span>
													</button>
												</div>
											</div>
										</nav>
										
										<c:if test="${check == 0}">
											<div data-v-6b53621a="" data-v-d06869c8="" class="error-list"
												data-v-421abad8="">
												<p data-v-6b53621a="">작성가능한 후기가 없습니다.</p>
											</div>
										</c:if>
										
										<c:if test="${check > 0}">
											<div data-v-d06869c8="" data-v-421abad8=""
												class="review-index__index">
												<ul data-v-d06869c8="" data-v-421abad8="">
												
													<c:forEach var="list1" items="${list1 }" varStatus="i">
														<c:forEach var="list2" items="${list2[i.index] }" varStatus="j">
															<c:if test="${list2.payment_item_mapping_review == 0 }">
																<li data-v-d06869c8="" data-v-421abad8=""><div
																		data-v-290d27aa="" data-v-d06869c8="" class="review-item"
																		data-v-421abad8="">
																		<p data-v-290d27aa="" class="review-item__date">
																			<c:if test="${list1.payment_delivery_condition eq null}">
																				배송준비중
																			</c:if>
																			<c:if test="${list1.payment_delivery_condition ne null }">
																				${list1.payment_delivery_condition}
																			</c:if>
																			<em data-v-290d27aa="">${list1.payment_date}</em>
																		</p>
																		<div data-v-290d27aa="" class="row--v-center">
																			<div data-v-290d27aa="" href="#" target="_blank"
																				class="col-12 col--lg review-item__body">
																				<dl data-v-290d27aa="" class="row">
																					<dt data-v-290d27aa="">
																						<figure data-v-290d27aa=""
																							style="background-image: url(&quot;${list3[i.index][j.index].item_image}&quot;);"></figure>
																					</dt>
																					<dd data-v-290d27aa="" class="col">
																						<strong data-v-290d27aa="">
																							${list2.payment_item_mapping_item_name_size } ${list2.payment_item_mapping_item_quantity }개
																						</strong>
																					</dd>
																				</dl>
																			</div>
																			<nav data-v-290d27aa="" class="col-12 col--lg-auto">
																				<div data-v-290d27aa="" class="review-write-wrap">
																					<div data-v-290d27aa="">
																						<button data-v-a1c889e0="" data-v-290d27aa=""
																							type="button" title=""
																							class="button button--outline2">
																							<span data-v-a1c889e0="" class="button__wrap">후기
																								남기기</span>
																						</button>
																						<input type="hidden" value="${list3[i.index][j.index].item_tag_main }">
																						<input type="hidden" value="${list3[i.index][j.index].item_code }">
																						<input type="hidden" value="${list2.payment_item_mapping_code }">
																						<input type="hidden" value="${list1.payment_code }">
																					</div>
																					<div data-v-290d27aa="">
																						<span data-v-290d27aa="" class="review-write-due"></span>
																					</div>
																				</div>
																				<div data-v-290d27aa="" class="review-write-wrap-mobile">
																					<div data-v-290d27aa="">
																						<span data-v-290d27aa="" class="review-write-due"></span>
																					</div>
																					<div data-v-290d27aa="">
																						<button data-v-a1c889e0="" data-v-290d27aa=""
																							type="button" title=""
																							class="button button--side-padding button--outline2">
																							<span data-v-a1c889e0="" class="button__wrap">후기
																								남기기</span>
																						</button>
																						<input type="hidden" value="${list3[i.index][j.index].item_tag_main }">
																						<input type="hidden" value="${list3[i.index][j.index].item_code }">
																						<input type="hidden" value="${list2.payment_item_mapping_code }">
																						<input type="hidden" value="${list1.payment_code }">
																					</div>
																				</div>
																			</nav>
																		</div>
																	</div>
																</li>
															</c:if>
														</c:forEach>
													</c:forEach>
													
													<!---->
												</ul>
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