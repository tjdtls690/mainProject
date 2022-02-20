<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/signup"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type=text/javascript>
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
});
</script>

<title>salad:it-signup</title>

<link rel="stylesheet" href="${path }/style.css">
<link rel="stylesheet" href="${path }/style2.css?ver=2">

<header id="header-area" class="header" data-v-30697495 data-v-0f5971ec>
                  <div class="header-banner-wrap" data-v-30697495><!----></div> 
                  <div id="header__body" class="header__body" data-v-30697495>
                     <div class="header__top" data-v-30697495>
                        <a href="/info" class="header__top-left" data-v-30697495></a> 
                        <div class="header__top-right" data-v-30697495>
                           <a href="/mypage/orders" data-v-30697495>조망고 <span data-v-30697495>님</span></a> 
                           <span data-v-30697495>1:1문의</span> 
                           <a href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank" data-v-30697495>B2B 신청</a>
                        </div>
                     </div> <!----> 
                     <div class="header__logo" data-v-30697495>
                        <a href="#">
                           <img id="logoim" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/logo.png" width="200px">
                        </a> <!---->
                     </div> 
                     <nav class="header__menus" data-v-30697495>
                        <div data-v-30697495>
                           <div class="dropdown" data-v-30697495>
                              <span class="item" data-v-30697495>
                                 <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EB%AA%A9%EB%A1%9D%EB%B0%94.png" alt="메뉴 검색" class="search-logo-img" style="width:24px;height:24px;" data-v-30697495>
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
                              <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EB%8F%8B%EB%B3%B4%EA%B8%B0.png" alt="메뉴 검색" class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495> 
                              <div data-v-30697495>검색</div>
                           </a> 
                           <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                              <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88.png" alt="프레시코드 장바구니" class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                               장바구니
                             </a> 
                             <a href="/order" class="item" data-v-30697495>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EB%B0%94%EB%A1%9C%EC%A3%BC%EB%AC%B8.png" class="icon-order" style="width: 24px; height: 24px;" data-v-30697495>
                               바로주문
                             </a>
                         </div>
                        </nav> 
                        <div class="header__side" data-v-30697495>
                              <a href="/search" class="search-logo" data-v-30697495>
                                 <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/search.PNG" alt="메뉴 검색" class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495></a>
                              </a> 
                              <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                                 <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/baguni.png" alt="프레시코드 장바구니" class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                              </a> 
                              <nav class="header__toggle-button" data-v-30697495>
                                 <button type="button" data-v-30697495>
                                    <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/main/menu.PNG" alt="user-menu" style="width: 24px; height: 24px;" data-v-30697495>
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
                               <img src="/images/icon-arrow-down@2x.png" alt class="all-menus-arrow" data-v-30697495>
                              </div>
                        </div>
                     </div>
                  </div> 
                  <!----> 
                  <!----> 
                  <!---->
               </header>
               
</head>

<body>
<div data-v-1739428d class="container">
	<article data-v-932ef6fa data-v-1739428d class="signup">
		<header data-v-932ef6fa class="signup__header">
			<h2 data-v-932ef6fa>
				<img data-v-932ef6fa src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/logo.png" alt="salad:it">
			</h2>
			<p data-v-932ef6fa>프리미엄 샐러드 배송</p>
		</header>
			<nav data-v-932ef6fa>
				<button data-v-932ef6fa type="button" class="signup__kakao-login-btn">
					<div data-v-932ef6fa class="kakao-logo"></div>
					<span data-v-932ef6fa>카카오로 3초만에 시작하기</span>
				</button>
				<img data-v-932ef6fa src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/banner.jpg" alt="첫 주문 혜택 페이지로 가기" class="first-order-banner">
				<div data-v-932ef6fa class="divider">
					<span data-v-932ef6fa>OR</span>
				</div>
				<button data-v-a1c889e0 data-v-932ef6fa type="button" title class="button signup__register-btn" onclick="location.href='signupWrite.do' ">
					<span data-v-a1c889e0 class="button__wrap">이메일로 가입하기</span>
				</button>
				<button data-v-932ef6fa id="login-apple" type="button" class="signup__apple-login-btn">
					<div data-v-932ef6fa class="apple-logo"></div>
					Apple로 계속하기
				</button>
			</nav>
	</article>
</div>

<footer class="footer" data-v-438b4fe4 data-v-0f5971ec>
               <div class="footer__wrap" data-v-438b4fe4 >
                  <h2 class="footer---logo" data-v-438b4fe4>
                     <img class="footer--logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/logo.png" alt="SALAD:IT" data-v-438b4fe4> 
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
                        <h3 data-v-438b4fe4>샐러딧고객센터</h3> 
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
                              <p data-v-438b4fe4><b data-v-438b4fe4>대표</b>정주환</p> 
                              <p data-v-438b4fe4><b data-v-438b4fe4>주소</b> <span data-v-438b4fe4>서울특별시 성동구 왕십리로 115, 헤이그라운드 서울숲점 7층</span></p> 
                              <p data-v-438b4fe4><b data-v-438b4fe4>사업자등록번호</b>883-81-00307</p> 
                              <p data-v-438b4fe4><b data-v-438b4fe4>통신판매업신고</b>제 2016-서울용산-00657</p>
                           </address> 
                           <address class="footer__address help hide" data-v-438b4fe4>
                              <p data-v-438b4fe4><b data-v-438b4fe4>제휴문의</b><a href="mailto:biz@saladit.me" data-v-438b4fe4>biz@saladit.me</a></p> 
                              <p data-v-438b4fe4><b data-v-438b4fe4>카카오ID</b><a href="#" data-v-438b4fe4>@샐러딧-saladit</a></p> 
                              <p data-v-438b4fe4><b data-v-438b4fe4>단체주문문의</b><a href="mailto:order@saladit.me" data-v-438b4fe4>order@saladit.me</a></p>
                           </address> 
                           <aside class="footer__side" data-v-438b4fe4>
                              <p class="footer__copyright hide" data-v-438b4fe4>
                            ⓒ 2020. Saladit, Inc. All Rights Reserved<br data-v-438b4fe4>샐러딧이
                            제공하는 UI/UX, 프로그램, 콘텐츠, 디자인 등은 특허법, 저작권법,
                            부정경쟁방지법 등에 의해 보호 받고 있습니다.<br data-v-438b4fe4>무단 복제, 유사한
                            변형, 사용 등에 대하여는 법적 책임이 있음을 알려드립니다.
                          </p> 
                          <div class="footer__sns-wrap" data-v-438b4fe4>
                             <nav class="footer__sns" data-v-438b4fe4>
                                <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EC%9D%B8%EC%8A%A4%ED%83%80.png" title="instagram" data-v-438b4fe4>
                                <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%ED%8E%98%EC%9D%B4%EC%8A%A4%EB%B6%81.png" title="facebook" data-v-438b4fe4>
                                <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EC%9C%A0%ED%8A%9C%EB%B8%8C.png" title="youtube" data-v-438b4fe4>
                                <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EB%84%A4%EC%9D%B4%EB%B2%84.png" title="blog" data-v-438b4fe4>
                                <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EB%84%A4%EC%9D%B4%EB%B2%84%EB%B8%94%EB%A1%9C%EA%B7%B8.png" title="Naver post" data-v-438b4fe4>
                                <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/search/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1.png" title="kakao channel" data-v-438b4fe4>
                             </nav>
                          </div>
                      </aside>
                  </div>
               </div>
            </footer>
</body>
</html>