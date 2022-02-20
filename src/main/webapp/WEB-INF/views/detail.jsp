<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/detail"/>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="${path }/style.css">
   <link rel="stylesheet" href="${path }/hmm2.css">
   <link rel="stylesheet" href="${path }/style2.css?ver=2">
   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   <script type="text/javascript">
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
    	 
    	 
         
// 영양 정보 고시 숨기기       
		$('.menu-info-content-wrap').hide();  
     	$(document).on('click','#nutrition-info',function(){  
    		alert("영양 정보 숨기기");
    	    if($("#item_nut_show").css("display") == "none"){   
    	        $('#item_nut_show').show(); 
    	    } else {  
    	        $('#item_nut_show').hide();  
    	    }  
    	}); 
// 상품 정보 고시 숨기기
     	$(document).on('click','#product-info',function(){  
    		alert("상품 정보 숨기기");
    	    if($("#item_info_show").css("display") == "none"){   
    	        $('#item_info_show').show(); 
    	    } else {  
    	        $('#item_info_show').hide();  
    	    }  
    	});
// 장바구니 담기
		$(document).on('click','#mobCart',function(){
			var p = document.passNum;
			var code = $(this).children('#itemCode').attr('value');
			var tag = $(this).children('#tagMain').attr('value');
			alert("code의 값 :" +code);
			p.itemCode.value = code;
			p.tagMain.value = tag;
			p.action="test.do";
			p.method="post";
			p.submit();
		})
		
		
		
		
		
      });
    </script>
    <script>
         $(function(){
            $('.review-item').on('click', function(){
	            $(this).children('.review-item__head').toggleClass("border-bottom-desktop-show");
	            $(this).children('.review-desktop-toggle').toggleClass("review-hide");
            });
            
            $('.menu-info-table-wrap').on('click',function(){
                $(this).children('.menu-info-table-opener').toggleClass("border-bottom-desktop-show");
                $(this).children('.menu-info-table-content-wrap').toggleClass("review-hide");
             });
         });
    </script>
    <title>Saladit!</title>
</head>
<body>
    <div id="container">
        <header id="header-area" class="header" data-v-30697495 data-v-0f5971ec>
            <div class="header-banner-wrap" data-v-30697495><!----></div> 
            <div id="header__body" class="header__body" data-v-30697495>
               <div class="header__top" data-v-30697495>
                  <a href="/info" class="header__top-left" data-v-30697495></a> 
                  <div class="header__top-right" data-v-30697495>
                     <a href="/mypage/orders" data-v-30697495>이예지 <span data-v-30697495>님</span></a> 
                     <span data-v-30697495>1:1문의</span>
                     <a href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank" data-v-30697495>B2B 신청</a>
                  </div>
               </div> <!---->
               <div class="header__logo" data-v-30697495>
                  <a href="#">
                     <!--<img id="logoim" src="images/logo.PNG" width="200px">-->
                  </a> <!---->
               </div>
<!--                form태그 -->
<!--                form태그 -->
<!--                form태그 -->
               	<form name="passNum">
					<input type="hidden" name="tagMain" value="">
					<input type="hidden" name="itemCode" value="">
			 	</form>
               <nav class="header__menus" data-v-30697495>
                  <div data-v-30697495>
                     <div class="dropdown" data-v-30697495>
                        <span class="item" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/Icon_Hamberger_Gray%403x.png"  class="search-logo-img" style="width:24px;height:24px;" data-v-30697495>
                           전체 카테고리
                        </span> 
                        <div class="dropdown" data-v-30697495>
                           <ul data-v-30697495>
                              <li data-v-30697495>
                                 <a href="/menu" data-v-30697495>전체보기</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/subscription" data-v-30697495>정기배송</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/salad" data-v-30697495>샐러드</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/salad-wrap" data-v-30697495>랩·샌드위치</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/meal" data-v-30697495>도시락·간편식</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/set" data-v-30697495>세트상품</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/snack" data-v-30697495>간식</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/drink" data-v-30697495>음료</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/event" data-v-30697495>할인기획전</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/soon" data-v-30697495>오픈예정</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/soup" data-v-30697495>죽·스프</a>
                              </li>
                           </ul>
                        </div>
                     </div> 
                     <a href="/menu/subscription" class="item" data-v-30697495>정기배송</a>
                     <a href="/menu/salad" class="item" data-v-30697495>샐러드</a>
                     <a href="/menu/salad-wrap" class="item" data-v-30697495>랩·샌드위치</a>
                     <a href="/menu/event" class="item" data-v-30697495>할인기획전</a>
                     <a href="/event" class="item" data-v-30697495>이벤트</a>
                     <a href="/fcospot" class="item" data-v-30697495>프코스팟</a>
                  </div> 
                  <div class="header__menus-side" data-v-30697495>
                     <a href="/search" class="search-logo" data-v-30697495>
                        <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png"  class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495> 
                        <div data-v-30697495>검색</div>
                     </a> 
                     <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                        <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/cart-header-icon%403x.png"  class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                         장바구니
                       </a> 
                       <a href="/order" class="item" data-v-30697495>
                       <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_order.png" class="icon-order" style="width: 24px; height: 24px;" data-v-30697495>
                         바로주문
                       </a>
                   </div>
                  </nav> 
                  <div class="header__side" data-v-30697495>
                        <a href="/search" class="search-logo" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png" class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495></a>
                        </a> 
                        <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/cart-header-icon%403x.png"  class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                        </a> 
                        <nav class="header__toggle-button" data-v-30697495>
                           <button type="button" data-v-30697495>
                              <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png"  style="width: 24px; height: 24px;" data-v-30697495>
                           </button>
                        </nav>
                  </div>
            </div> 
            <div class="mobile-nav js-mobile-nav" data-v-30697495>
               <div class="mobile-nav-wrap" data-v-30697495>
                  <div class="mobile-nav-scroll" data-v-30697495>
                     <ul class="mobile-nav-contents" data-v-30697495>
                        <li class="mobile-nav-contents-item" data-v-30697495>
                           <a href="/menu" data-v-30697495>
                                전체 메뉴
                              </a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/menu/subscription" data-v-30697495>
                                정기배송
                              </a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/menu/event" data-v-30697495>
                                할인기획전
                              </a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/info" data-v-30697495>
                                배송안내
                              </a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/fcospot" data-v-30697495>
                                프코스팟
                              </a>
                          </li>
                      </ul>
                  </div> 
                  <div class="all-menus-container" style="display:none;" data-v-30697495>
                     <div class="all-menus-list-wrap" data-v-30697495>
                        <ul class="all-menus-list js-all-menus-list" data-v-30697495>
                           <li class="all-menus-item" data-v-30697495>
                              <a href="/menu" class="js-all-menus-item-link-0 all-menus-item-link" data-v-30697495>
                                    전체보기
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/subscription" class="js-all-menus-item-link-1 all-menus-item-link" data-v-30697495>
                                    정기배송
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/salad" class="js-all-menus-item-link-2 all-menus-item-link" data-v-30697495>
                                    샐러드
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/salad-wrap" class="js-all-menus-item-link-3 all-menus-item-link" data-v-30697495>
                                    랩·샌드위치
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/meal" class="js-all-menus-item-link-4 all-menus-item-link" data-v-30697495>
                                    도시락·간편식
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/set" class="js-all-menus-item-link-5 all-menus-item-link" data-v-30697495>
                                    세트상품
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/snack" class="js-all-menus-item-link-6 all-menus-item-link" data-v-30697495>
                                    간식
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/drink" class="js-all-menus-item-link-7 all-menus-item-link" data-v-30697495>
                                    음료
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/event" class="js-all-menus-item-link-8 all-menus-item-link" data-v-30697495>
                                    할인기획전
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/soon" class="js-all-menus-item-link-9 all-menus-item-link" data-v-30697495>
                                    오픈예정
                                  </a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/soup" class="js-all-menus-item-link-10 all-menus-item-link" data-v-30697495>
                                    죽·스프
                                  </a>
                              </li>
                          </ul>
                      </div> 
                      <div class="all-menus-shadow" data-v-30697495></div> 
                      <div class="all-menus-arrow-wrap" data-v-30697495>
                         <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon-arrow-down%402x.png"  class="all-menus-arrow" data-v-30697495>
                        </div>
                  </div>
               </div>
            </div> 
            <!----> 
            <!----> 
            <!---->
        </header> 
        <div id="home">
            <!--위에 container에 padding-top:182px 주는 이유:
            헤더가 스크롤에 따라 바뀌면서 그 아래 container가 스크롤을 올리면 잘 안보임-->
            <div class="menu__container">
                <article class="menu">
                    <div id="menu__head" class="menu__head">
                        <figure class="menu__image">
                            <div class="menu-badge">
                            </div>
                                <img src="${detail.item_image }" alt="상품 이미지">
                        </figure>
                        <div data-v-32a18372 class="menu__body">
                            <header data-v-32a18372 class="menu__header">
                                <h2 data-v-32a18372 class="menu__name">${detail.item_name }</h2>
                                <div data-v-32a18372 class="menu__summary">${detail.item_summary }</div>
                                <div data-v-32a18372 class="review">
                                    <div data-v-32a18372 class="row--v-center review-wrap">
                                    
                                    
                                        <div class="review-stars">

                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_half%402x.png">
                                        </div>
                                        
                                        
                                        <div>
                                            <span class="review-count">
                                                ★★★★${avgCount.starAvg }(후기 ${avgCount.reviewCount})
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="price-wrap">
                                    <b>${detail.item_price_m }원 </b>
                                    <c:if test= "${detail.item_price_m_sub !='' }">
                                    <b>~</b>
                                    <del>${detail.item_price_m_sub }원</del>
                                    </c:if> 
                                </div>
                                <ul data-v-32a18372 class="menu-detail">
                                    ${detail.item_explain }
                                </ul>
                                <div data-v-2706028c class="menu-select-panel">
                                    <div data-v-2706028c class="menu__select-size">
                                        <ul data-v-2706028c class="menu__select-size-list">
                                            <li data-v-2706028c>
                                                <label data-v-2706028c class="menu__label only-desktop">상품선택</label>
                                                <div data-v-2706028c class="dropdown-btn-wrap">
                                                    <div data-v-5b7f52e9 data-v-2706028c>
                                                        <div data-v-5b7f52e9 class="dropdown-btn">
                                                            <div data-v-5b7f52e9 class="button dropdown">
                                                                <div data-v-5b7f52e9 class="dropdown-content">
                                                                    <span data-v-5b7f52e9>선택</span>
                                                                </div>
                                                                <div data-v-5b7f52e9 class="dropdown-icon">
                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="dropdown-icon">
                                                                </div>
                                                            </div>
                                                            <!-- 상품선택 옵션 토글다운 주석처리 나중에 부트스트랩 드롭다운으로 구현-->
                                                            <!--
                                                            <ul data-v-5b7f52e9 class="toggle-drop-down">
                                                                <li data-v-5b7f52e9>
                                                                    <div data-v-5b7f52e9 class="detail-wrap">
                                                                        <div data-v-5b7f52e9 class="detail-name-and-badge">
                                                                            <span data-v-5b7f52e9>미디움 (M)</span>
                                                                            <span data-v-5b7f52e9 class="detail-badge">(런칭기념 10% 할인!)</span>
                                                                        </div>
                                                                        <div data-v-5b7f52e9 class="detail-price">
                                                                            <span data-v-5b7f52e9 class="discount-price">8,900</span>
                                                                            <span data-v-5b7f52e9>8,010원</span>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                            -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <!--li class="menu-option" 없애봄 -->
                                        </ul>
                                    </div>
                                    <div data-v-2706028c class="menu__price">
                                        <label data-v-2706028c class="menu__label menu__price-label"> 상품 금액 </label>
                                        <div data-v-2706028c class="menu__price-right">
                                            <div data-v-2706028c class="menu__price-current-price__wrapper">
                                                <div data-v-2706028c class="menu__price-current-price">0원</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </header>
                            <nav data-v-32a18372 class="menu__button-order-body">
                                <div data-v-32a18372 class="row--v-center" style="width: 100%; flex-wrap: nowrap;">
                                    <div data-v-32a18372 class="cart-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button button--outline2" id="mobCart" style="margin-right: 5px;">
                                        	<input type="hidden" value="${detail.item_code }" id="itemCode">
											<input type="hidden" value="${detail.item_tag_main }" id="tagMain">
                                            <span data-v-a1c889e0 class="button__wrap">장바구니 담기</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button">
                                            <span data-v-a1c889e0 class="button__wrap">주문하기</span>
                                        </button>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <article data-v-3ebe8eb0 data-v-32a18372 class="reco-index">
                        <header data-v-3ebe8eb0 class="row--v-center reco-index__header">
                            <div data-v-3ebe8eb0 class="col reco-title-wrap">
                                <img data-v-3ebe8eb0 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon-like%402x.png"  class="reco-title-img">
                                <h2 data-v-3ebe8eb0>다른 고객들이 함께 본 상품</h2>
                            </div>
                            <nav data-v-3ebe8eb0>
                                <!--이 nav 태그 뭐에 쓰이는건 모르겠어서 생략..-->
                            </nav>
                        </header>
                        <!--다른 고객들이 함께 본 상품-->
                        <!--메인의 md추천에서 자동 넘기기 효과만 없애면 될듯..-->
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="1000">
								<img src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/490_20211221111518" class="d-block w-100" alt="..." width="50">
							</div>
							<div class="carousel-item" data-bs-interval="1000">
								<img src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/490_20211221111518" class="d-block w-100" alt="..." width="50">
							</div>
							<div class="carousel-item" data-bs-interval="1000">
								<img src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/origin/490_20211221111518" class="d-block w-100" alt="..." width="50">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="visually-hidden">Next</span>
						</button>
					</div>                   
                    </article>
                    <div data-v-32a18372 class="menu__tab">
                        <nav data-v-61e19c34 data-v-32a18372 class="menu-tab unit">
                            <div data-v-61e19c34 class="menu-tab-btn-wrap on">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>상품정보</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>상세정보</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>FAQ</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>고객후기</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="desktop-tab-blank">
                            </div>
                        </nav>
                    </div>
                    <div data-v-32a18372 class="menu-description-container">
                        <div data-v-32a18372 class="menu-description">
                            <div data-v-32a18372 class="menu-description-left">
                                <div data-v-32a18372 id="menu-detail" class="menu__tab-info">
                                    <div data-v-79f00ef9 data-v-32a18372 class="menu-info">
                                        <div data-v-79f00ef9 class="detail-wrapper">
                                            <div data-v-79f00ef9 id="bundle-detail" class="detail">
                                                <div data-v-79f00ef9 class="img-wrapper">
                                                    <div data-v-79f00ef9 id>
                                                        <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11633_20220105113601" class="img-fade">
                                                    </div>
                                                    <div data-v-79f00ef9 id>
                                                        <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11634_20220105113601" class="img-fade">
                                                    </div>
                                                    <div data-v-79f00ef9 id>
                                                        <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11635_20220105113602" class="img-fade">
                                                    </div>
                                                    <div data-v-79f00ef9>
                                                        <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/11636_20220105113611" class="img-fade">
                                                    </div>
                                                    <div data-v-79f00ef9>
                                                        <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/4766_20210111105602" class="img-fade">
                                                    </div>
                                                    <div data-v-79f00ef9 class="shadow"></div>
                                                </div>
                                            </div>
                                            <div data-v-79f00ef9 class="more-btn">
                                                <span data-v-79f00ef9 class="more-btn-text">상품 정보 더보기</span>
                                                <img data-v-79f00ef9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down-green%402x.png"  class="more-btn-arrow">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-32a18372 class="menu__tab-info delivery">
                                    <h1 data-v-32a18372 class="menu__tab-info-title delivery">
                                        배송정보
                                    </h1>
                                    <div data-v-79f00ef9 data-v-32a18372 class="menu-info">
                                        <div data-v-79f00ef9>
                                            <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/7946_20210707161730" class="img-fade">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div data-v-32a18372 class="menu-select-panel-desktop">
                                <h4 data-v-32a18372>상품 선택</h4>
                                <div data-v-2706028c data-v-32a18372 class="menu-select-panel floating-panel-default">
                                    <div data-v-2706028c class="menu__select-size" style="border-bottom: 0px;">
                                        <ul data-v-2706028c class="menu__select-size-list">
                                            <li data-v-2706028c>
                                                <div data-v-2706028c class="dropdown-btn-wrap" style="width: 100%;">
                                                    <div data-v-5b7f52e9 data-v-2706028c>
                                                        <div data-v-5b7f52e9 class="dropdown-btn">
                                                            <div data-v-5b7f52e9 class="button dropdown">
                                                                <div data-v-5b7f52e9 class="dropdown-content">
                                                                    <span data-v-5b7f52e9>선택</span>
                                                                </div>
                                                                <div data-v-5b7f52e9 class="dropdown-icon">
                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="dropdown-icon">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li data-v-2706028c class="menu-option">
                                                <div data-v-2706028c class="menu-option-wrap">
                                                    <label data-v-2706028c class="menu__label">함께 드시면 좋을 MD 추천 상품</label>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[맛꾼푸드] 아이스 엿구마 1봉</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="meni-option-right">
                                                            3,000원
                                                        </div>
                                                    </div>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[아임얼라이브] 유기농 콤부차 4종 석류</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="menu-option-right">
                                                            3,600원
                                                        </div>
                                                    </div>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[그릭데이] 그릭요거트 2종 시그니처 1개</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="menu-option-right">
                                                            3,300원
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul data-v-2706028c class="selected-detail-list isDesktop"></ul>
                                    </div>
                                    <div data-v-2706028c class="menu__price isDesktop">
                                        <label data-v-2706028c class="menu__label menu__price-label" style="width: 108px;">상품 금액</label>
                                        <div data-v-2706028c class="menu__price-right">
                                            <div data-v-2706028c class="menu__price-current-price__wrapper">
                                                <div data-v-2706028c class="menu__price-current-price">0원</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-32a18372 class="row--v-center" style="width: 100%; flex-wrap:nowrap;">
                                    <div data-v-32a18372 class="cart-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button button--outline2" id="mobCart" style="margin-right: 5px; height: 52px;">
                                        	<input type="hidden" value="${detail.item_code }" id="itemCode">
											<input type="hidden" value="${detail.item_tag_main }" id="tagMain">
                                            <span data-v-a1c889e0 class="button__wrap">장바구니 담기</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button" style="height: 52px;">
                                            <span data-v-a1c889e0 class="button__wrap">주문하기</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-v-32a18372 id="product-info">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372>상품 정보 고시</span>
                                <div data-v-32a18372 class="info-title-img"></div>
                            </h3>
						<!-- <div>~~~ 생겨야됨. -->
							<div data-v-32a18372="" class="menu-info-content-wrap" id="item_info_show">
								${detailInfo.item_info }
							</div>
						<!-- </div> -->
                        </div>
                        <div data-v-32a18372 id="nutrition-info">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372>영양 정보 고시</span>
                                <div data-v-32a18372 class="info-title-img"></div>
                            </h3>
                         <!--<div>~~~ 생겨야됨.  --> 
	                        <div data-v-32a18372="" class="menu-info-content-wrap" id="item_nut_show">
	                        	${detail.item_nut}
	                        </div>
                        <!-- <div>-->  
                        </div>
                        <div data-v-32a18372 id="faq" class="menu__tab-info tab_menu_detail">
                            <p data-v-32a18372 class="menu__tab-info-title faq">FAQ</p>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[결제 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
								<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">▶ 결제수단안내<br>
												프레시코드에서는 프코페이, PAYCO, 신용카드, kakaopay,toss,계좌이체가 가능합니다. 
												GS25 편의점 스팟으로 주문 시, toss결제수단은 사용할 수 없으니 이용에 참고 부탁 드립니다.</div>
										</div>
									</div>
								</div>
							</div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[주문단계 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">▶ 일반배송 주문 과정 안내<br>
                                             1. 원하는 상품 선택.
                                             2. 희망하는 배송방법 선택.
                                             (프코스팟/퀵/새벽배송/택배배송)
                                             3.구매하고자 하는 상품 및 수량 선택.
                                             4. 유상 구매로 제공되는 일회용품 유/무 선택.
                                             5. 희망 배송 날짜 선택.
                                             6. 나의 배송지 정보 확인
                                             7. 주문자 정보 확인 후 결제.</div>
										</div>
									</div>
								</div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[취소 및 환불 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc class="menu-info-table-content-wrap review-hide">
                                    <div data-v-e3f957fc class="answer-wrapper">
                                       <div data-v-e3f957fc class="answer-column left">
                                          <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"  class="menu-info-table-img answer">
                                       </div>
                                       <div data-v-e3f957fc class="answer-column right">
                                          <div data-v-e3f957fc class="menu-info-table-content-description">▶ 일반상품 취소 가능 시점<br>
                                             ●  점심/저녁 스팟,퀵배송은 배송 예정일 당일 오전 7시까지 홈페이지를 통해 직접 취소 가능
                                             ● 새벽/택배배송은 배송 예정일 D-1일 오후 3시까지 홈페이지를 통해 직접 취소 가능 
                                             ※ 신선식품 특성 상 주문취소시간 외 취소 및 변경 불가합니다.

                                             ▶ 고객님의 단순 변심/개인사유 포함하여 취소 요청 시, 쿠폰 사용금액 제외한 실 결제금액에서 배송 완료된 모든 상품의 정상가 차감 후 나머지만 환불 됩니다.


                                             ▶ 제품 이상이 있거나, 오배송이 된 경우 반드시 사진 촬영을 해주신 후 고객센터로 문의 남겨주세요
                                             ▶ 신선식품의 특성 상 재판매가 불가합니다. 고객님의 단순 변심 혹은 개인사유로 인해 취소 가능한 시점 이후에는 취소가 불가합니다.
                                             ▶ 고객의 부주의 혹은 잘못된 보관방법으로 인한 상품 변질은 취소 및 환불이 불가합니다.</div>
                                       </div>
                                    </div>
                                 </div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[배송 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description"> ▶ 프코스팟 배송 <br>
                                             프코스팟은 배송 장소에 따라 이용이 제한 될 수 있습니다.
                                             사전에 이용이 가능한 스팟인지 꼭 확인하시고 주문해주시길 바랍니다.
                                             
                                             ● 프라이빗 스팟 : 임직원 및 멤버 전용 (예 : 회사 및 공유오피스등)
                                             ● 퍼블릭 스팟 : 누구나 이용 가능한 스팟 (예 : gs25 및 헬스장등)
                                             
                                             최소 주문금액 6천원 이상, 배송비는 무료이며 
                                             점심배송은 오전 11시 ~ 오후 12시 30분사이 배송이며
                                             저녁배송은 오후 1시 ~ 오후5시 사이 배송 됩니다. 
                                             
                                             
                                             ▶퀵배송
                                             주변에 이용 가능한 프코스팟이 없다면 서울 전지역 점심/저녁 퀵 배송이 가능합니다.
                                             최소 주문금액 1만원 이상, 배송비는 4천원이며 4만원 이상 구매 시, 무료배송 입니다.
                                             
                                              점심배송은 12시 30분 전/후로 배송 예정되며
                                              저녁배송은 오후 1시~5시 사이 배송 됩니다.
                                             
                                             
                                             ▶새벽배송
                                             새벽배송은 00시 ~ 07시 사이 요청하신 장소로 배송이 되며
                                             새벽시간 특성 상 고객님께 별도 연락 없이, 배송완료가 되면 문자로 사진과 함께 안내 드리고 있습니다.
                                             
                                             안전한 배송을 위해 건물 출입 가능한 방법을 자세히 기재 해주셔야 하며
                                             새벽배송 가능한 지역이라도 학교/기숙사/관공서/병원/쇼핑몰/군부대등 일부 장소는 배송이 불가하며
                                             엘레베이터가 없는 6층 이상의 건물에는 1층에 대응배송을 하고 있습니다.
                                             (주소 및 출입방법을 정확히 작성하지 않아 발생한 문제에 대해서는 교환이나 환불이 불가합니다.)
                                             
                                             최소 주문금액 1만원 이상, 배송비는 3500원이며 35,000원 이상 구매 시, 무료배송 입니다.
                                             
                                             ▶택배배송
                                             제주도, 도서산간을 제외한 모든 지역이 배송이 가능하며 CJ 대한통운을 통해 배송이 됩니다.
                                             최소 주문 금액 1만원 이상 배송비는 3500원이며 35,000원 구매 시 , 무료 배송입니다.
                                             CJ대한통운을 통해 배송이 되고 있으며, 각 지역의 물량이나 동선에 따라 도착시간이 다르기 때문에 배송관련한 문의는 CJ대한통운 고객센터로 문의 부탁 드립니다. (CJ대한통운 고객센터 : 1588-1255)
												</div>
										</div>
									</div>
								</div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[기타 사항(자주 묻는 질문)]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">▶ 배송일 변경이 가능한가요?<br>
                                             ● 프코스팟/퀵배송은 수령일 당일 오전 7시까지 홈페이지에서 직접 변경이 가능합니다.
                                             ● 새벽배송/택배배송의 경우 배송 예정일 D-1일 오후 3시까지  홈페이지에서 직접 변경이 가능합니다.


                                             ▶ 상품변경 혹은 주문내역 변경이 가능한가요?
                                             ● 프코스팟/퀵배송의 경우 수령일 당일 오전 7시까지 고객님께서 직접 홈페이지를 통해 기존 주문건 취소 후 재주문 해주셔야 합니다.
                                             ● 새벽배송/택배배송의 경우 배송 예정일 D-1일 오후 3시까지 고객님께서 직접 홈페이지를 통해 기존 주문건 취소 후 재주문 해주셔야 합니다.

                                             ▶샐러드에 못먹는 재료가 있는데 제외 가능한가요?
                                             ●  대량으로 일괄생산하고 있어, 특정 재료나 드레싱 제외가 불가합니다.

                                             ▶ 정기배송과 일반배송 합배송이 되나요?
                                             ● 정기배송과 일반배송 상품은 합배송이 불가하며, 같은 주소지로 동시에 배송 받으시더라도 개별로 배송비가 부과 됩니다.
												</div>
										</div>
									</div>
								</div>
                            </div>
                        </div>
                    </div>
                    <div data-v-32a18372 class="menu__tab-review" id="review"
                    data-gtm-vis-first-on-screen-7693391_542="15381"
                    data-gtm-vis-total-visible-time-7693391_542="3000"
                    data-gtm-vis-has-fired-7693391_542="1">
                        <a data-v-32a18372 href="#" class>
                            <div data-v-32a18372 class="menu__tab-review-banner"></div>
                        </a>
                        <div data-v-f8b893b0="" data-v-32a18372="" class="menu-review">
                            <section data-v-f8b893b0="" class="menu-review__album">
                                <h3 data-v-f8b893b0="" class="menu-review__album-title">
                                  고객 후기 사진 (13)
                                </h3>
                                <div data-v-f8b893b0="" class="images">
                                  <div data-v-f8b893b0="">
                                     <span id="carousel_prev_nj8u0ztnu9d" style=""></span>
                                     <div id="carousel_ola7225lcr9"
                                        class="owl-carousel owl-theme owl-loaded">
                                        <div class="owl-stage-outer">
                                           <div class="owl-stage"
                                              style="transform: translate3d(-1224px, 0px, 0px); transition: all 0s ease 0s; width: 5100px;">
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="7"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="8"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="9"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="10"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="11"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="12"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="0"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="1"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="2"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="3"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="4"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item active"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="5"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="6"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44194_20220120145825&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="7"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="8"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="9"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="10"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="11"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="12"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="0"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="1"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="2"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="3"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="4"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a>
                                                 </div>
                                              </div>
                                              <div class="owl-item cloned"
                                                 style="width: 180px; margin-right: 24px;">
                                                 <div data-v-f8b893b0="" class="images__image">
                                                    <a data-v-f8b893b0="" href="#"><i
                                                       data-v-f8b893b0="" id="5"
                                                       style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a>
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
                                     <span id="carousel_next_tc5wlekmakl"></span>
                                  </div>
                               </div>
                            </section>
                            <section data-v-f8b893b0="" class="menu-review__rating">
                               <div data-v-f8b893b0="" class="wrap">
                                  <h3 data-v-f8b893b0="">고객 후기</h3>
                                  <div data-v-f8b893b0=""
                                     class="row--v-center review-box-wrapper">
                                     <div data-v-f8b893b0="" class="review-stars">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_half%402x.png" class="review-stars-star">
                                     </div>
                                     <div data-v-f8b893b0="" class="review-rating-counts">
                                        4.8 후기 (2,847)</div>
                                  </div>
                               </div>
                            </section>
                            <section data-v-f8b893b0="" class="menu-review__index">
                               <ul data-v-f8b893b0="">
                               
                               
                               
                               	  <c:forEach var="board" items="${boardList }">
	                               	  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
	                                     <div data-v-22105fb8="" class="review-item__head">
	                                        <div data-v-22105fb8="" class="head-rating">
	                                           <img data-v-22105fb8=""
	                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
	                                              class="rating-img">
	                                           <div data-v-22105fb8="" class="rating-count">${board.star }</div>
	                                        </div>
	                                        <div data-v-22105fb8="" class="head-summary">
	                                           <div data-v-22105fb8="" class="head-summary-left">
	                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
	                                                  class="summary-photo">
	                                              <div data-v-22105fb8="" class="summary-text">${board.content }</div>
	                                           </div>
	                                           <!---->
	                                        </div>
	                                        <div data-v-22105fb8="" class="head-text">
	                                           <div data-v-22105fb8="" class="text-name">${board.userName }</div>
	                                           <div data-v-22105fb8="" class="text-date">${board.writeDate }</div>
	                                        </div>
	                                     </div>
	                                     <div data-v-22105fb8=""
	                                        class="review-desktop-toggle review-hide">
	                                        <div data-v-22105fb8="" class="review-item__body">
	                                           <div data-v-22105fb8="" class="review-item__comment">${board.content }</div>
	                                           <div data-v-22105fb8="" class="review-item__photos">
	                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
	                                                 <div data-v-22105fb8="" class="review-item__photo"
	                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></div>
	                                              </div>
	                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
	                                                 <div data-v-22105fb8="" class="review-item__photo"
	                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></div>
	                                              </div>
	                                           </div>
	                                        </div>
	                                        <!---->
	                                     </div>
	                                  </li>
                                  </c:forEach>
													
														
													
                                  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
                                     <div data-v-22105fb8="" class="review-item__head">
                                        <div data-v-22105fb8="" class="head-rating">
                                           <img data-v-22105fb8=""
                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
                                              class="rating-img">
                                           <div data-v-22105fb8="" class="rating-count">5</div>
                                        </div>
                                        <div data-v-22105fb8="" class="head-summary">
                                           <div data-v-22105fb8="" class="head-summary-left">
                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
                                                  class="summary-photo">
                                              <div data-v-22105fb8="" class="summary-text">점심에
                                                 간단히 먹으려고 샌드위치 하나랑 샐러드 두개 오는 정기배송 시켜서 먹어봤는데 너무 맛있어요. 배송도
                                                 꼼꼼히 안전하게 잘 오고 잘 시킨것 같아요</div>
                                           </div>
                                           <!---->
                                        </div>
                                        <div data-v-22105fb8="" class="head-text">
                                           <div data-v-22105fb8="" class="text-name">안*율</div>
                                           <div data-v-22105fb8="" class="text-date">2022. 01.
                                              24.</div>
                                        </div>
                                     </div>
                                     <div data-v-22105fb8=""
                                        class="review-desktop-toggle review-hide">
                                        <div data-v-22105fb8="" class="review-item__body">
                                           <div data-v-22105fb8="" class="review-item__comment">점심에
                                              간단히 먹으려고 샌드위치 하나랑 샐러드 두개 오는 정기배송 시켜서 먹어봤는데 너무 맛있어요. 배송도
                                              꼼꼼히 안전하게 잘 오고 잘 시킨것 같아요</div>
                                           <div data-v-22105fb8="" class="review-item__photos">
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></div>
                                              </div>
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></div>
                                              </div>
                                           </div>
                                        </div>
                                        <!---->
                                     </div>
                                  </li>
                                  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
                                        data-v-22105fb8="" class="review-item__head">
                                        <div data-v-22105fb8="" class="head-rating">
                                           <img data-v-22105fb8=""
                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
                                              class="rating-img">
                                           <div data-v-22105fb8="" class="rating-count">5</div>
                                        </div>
                                        <div data-v-22105fb8="" class="head-summary">
                                           <div data-v-22105fb8="" class="head-summary-left">
                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
                                                  class="summary-photo">
                                              <div data-v-22105fb8="" class="summary-text">정말
                                                 맛있어요 자주시켜먹어요 ㅎ 정기배송이라 신경쓸게없엉ᆢㄷ</div>
                                           </div>
                                           <!---->
                                        </div>
                                        <div data-v-22105fb8="" class="head-text">
                                           <div data-v-22105fb8="" class="text-name">허*수</div>
                                           <div data-v-22105fb8="" class="text-date">2022. 01.
                                              22.</div>
                                        </div>
                                     </div>
                                     <div data-v-22105fb8=""
                                        class="review-desktop-toggle review-hide">
                                        <div data-v-22105fb8="" class="review-item__body">
                                           <div data-v-22105fb8="" class="review-item__comment">
                                              정말 맛있어요<br>자주시켜먹어요 ㅎ<br>정기배송이라 신경쓸게없엉ᆢㄷ
                                           </div>
                                           <div data-v-22105fb8="" class="review-item__photos">
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></div>
                                              </div>
                                           </div>
                                        </div>
                                        <!---->
                                     </div></li>
                                     <!-- 댓글 내용 열 시 추가 되어야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
                                     <!-- 댓글 내용 열 시 사라져야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->
                                     <!-- 댓글 내용 닫을 시 사라져야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
                                     <!-- 댓글 내용 닫을 시 추가 되어야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->
                                   
                               </ul>
                               <div data-v-20ad18c6="" data-v-f8b893b0=""
                                  class="nav-paginate-wrap">
                                  <div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
                                     <nav data-v-43f58a9c="" data-v-20ad18c6=""
                                        class="nav-paginate">
                                        <a data-v-43f58a9c="" href="#"
                                           class="nav-paginate__dir nav-paginate-dir-prev"
                                           style="opacity: 0.2;">
                                           <img data-v-43f58a9c=""
                                           src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-left%402x.png" 
                                           class="nav-arrow arrow-left">
                                        </a>
                                        <strong data-v-43f58a9c="">1</strong>
                                        <a data-v-43f58a9c=""
                                           href="#">2</a><a data-v-43f58a9c="" href="#">3</a>
                                        <a
                                           data-v-43f58a9c="" href="#">4</a>
                                        <a data-v-43f58a9c=""
                                           href="#">5</a>
                                        <a data-v-43f58a9c="" href="#"
                                           class="nav-paginate__dir nav-paginate-dir-next"
                                           style="opacity: 1;">
                                           <img data-v-43f58a9c=""
                                           src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-right%402x.png" 
                                           class="nav-arrow arrow-right">
                                        </a>
                                     </nav>
                                  </div>
                                  <div data-v-20ad18c6 class="nav-paginate-wrap__desktop">
                                     <nav data-v-43f58a9c data-v-20ad18c6 class="nav-paginate">
                                        <a data-v-43f58a9c href="#" class="nav-paginate__dir nav-paginate-dir-prev" style="opacity: 0.2;">
                                            <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-left%402x.png"  class="nav-arrow arrow-left">
                                        </a>
                                        <strong data-v-43f58a9c>1</strong>
                                        <a data-v-43f58a9c href="#">2</a>
                                        <a data-v-43f58a9c="" href="#">3</a>
                                        <a data-v-43f58a9c="" href="#">4</a>
                                        <a data-v-43f58a9c=""href="#">5</a>
                                        <a data-v-43f58a9c="" href="#" class="nav-paginate__dir nav-paginate-dir-next" style="opacity: 1;">
                                           <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-right%402x.png"  class="nav-arrow arrow-right">
                                        </a>
                                     </nav>
                                  </div>
                               </div>
                            </section>
                            <!---->
                         </div>
                    </div>
                </article>
            </div>
        </div>
        <footer class="footer" data-v-438b4fe4 data-v-0f5971ec>
            <div class="footer__wrap" data-v-438b4fe4 >
               <h2 class="footer--logo" data-v-438b4fe4>
                  <img class="footer-logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/02.png" alt="SALAD:IT" data-v-438b4fe4> 
                  <div data-v-438b4fe4></div>
               </h2> 
               <div class="footer__body" data-v-438b4fe4>
                  <nav class="footer__menus" data-v-438b4fe4>
                     <div class="footer__menus-item" data-v-438b4fe4>
                        <a href="#" data-v-438b4fe4>FAQ</a> 
                        <a href="/terms" data-v-438b4fe4>이용약관</a> 
                        <a href="/privacy" data-v-438b4fe4>개인정보처리방침</a>
                     </div> 
                     <div class="footer__menus-item" data-v-438b4fe4>
                        <a href="#" data-v-438b4fe4>제휴문의</a> 
                        <a href="#" data-v-438b4fe4>채용문의</a> 
                        <a href="#" data-v-438b4fe4>케이터링 문의</a>
                     </div>
                  </nav> 
                  <address class="footer__cs" data-v-438b4fe4>
                     <h3 data-v-438b4fe4>프코고객센터</h3> 
                     <div class="cs-time" data-v-438b4fe4>
                        <div class="btn-channel-talk" data-v-438b4fe4>1:1 문의하기</div> 
                        <div class="cs-time__inner" data-v-438b4fe4>
                           <div data-v-438b4fe4>
                              <div id="sa04" class="cs-time-text" data-v-438b4fe4>
                                 <b data-v-438b4fe4>평일</b> 
                                 <p data-v-438b4fe4>9:00 - 18:00 (점심시간 13:00 - 14:00)</p>
                              </div> 
                              <div id="sa03" class="cs-time-text" data-v-438b4fe4>
                                 <b data-v-438b4fe4>토요일</b> 
                                 <p data-v-438b4fe4>9:00 - 13:00
                                          <span data-v-438b4fe4> (홈페이지 채팅문의만 운영)</span>
                                       </p>
                                    </div>
                                 </div> 
                                 <div data-v-438b4fe4>
                                    <div class="cs-time-text" data-v-438b4fe4>
                                       <b data-v-438b4fe4>공휴일</b> 
                                       <p data-v-438b4fe4>휴무</p>
                                    </div> 
                                    <div class="cs-time-text" data-v-438b4fe4>
                                       <b data-v-438b4fe4>고객센터</b> 
                                       <p data-v-438b4fe4>1644-4559</p>
                                    </div>
                                 </div>
                              </div>
                              
                           </div>
                        </address> 
                        <address class="footer__address hide" data-v-438b4fe4>
                           <p data-v-438b4fe4><b data-v-438b4fe4>대표</b>정유석</p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>주소</b> <span data-v-438b4fe4>서울특별시 성동구 왕십리로 115, 헤이그라운드 서울숲점 7층</span></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>사업자등록번호</b>883-81-00307</p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>통신판매업신고</b>제 2016-서울용산-00657</p>
                        </address> 
                        <address class="footer__address help hide" data-v-438b4fe4>
                           <p data-v-438b4fe4><b data-v-438b4fe4>제휴문의</b><a href="mailto:biz@freshcode.me" data-v-438b4fe4>biz@freshcode.me</a></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>카카오ID</b><a href="#" data-v-438b4fe4>@프레시코드-freshcode</a></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>단체주문문의</b><a href="mailto:order@freshcode.me" data-v-438b4fe4>order@freshcode.me</a></p>
                        </address> 
                        <aside class="footer__side" data-v-438b4fe4>
                           <p class="footer__copyright hide" data-v-438b4fe4>
                         ⓒ 2020. FreshCode, Inc. All Rights Reserved<br data-v-438b4fe4>프레시코드가
                         제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은 특허법, 저작권법,
                         부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4>무단 복제, 유사한
                         변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
                       </p> 
                       <div class="footer__sns-wrap" data-v-438b4fe4>
                          <nav class="footer__sns" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/instagram%402x.png" title="instagram" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/facebook%402x.png" title="facebook" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/youtube%403x.png" title="youtube" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/group-21%402x.png" title="blog" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/blog-post%402x.png" title="Naver post" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/kakao-channel%402x.png" title="kakao channel" data-v-438b4fe4>
                          </nav>
                       </div>
                       
                   </aside>
               </div>
               
            </div>
            
         </footer>
         
    </div>
    	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
    
</body>
</html>