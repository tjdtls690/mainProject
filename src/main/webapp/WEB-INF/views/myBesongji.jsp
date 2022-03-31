<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myBesongji"/>
<!DOCTYPE html>
<html class="">
<head>
<style>
.gm-style-moc {
	background-color: rgba(0, 0, 0, 0.45);
	pointer-events: none;
	text-align: center;
	transition: opacity ease-in-out
}

.gm-style-mot {
	color: white;
	font-family: Roboto, Arial, sans-serif;
	font-size: 22px;
	margin: 0;
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%)
}
</style>
<style>
.gm-style img {
	max-width: none;
}

.gm-style {
	font: 400 11px Roboto, Arial, sans-serif;
	text-decoration: none;
}
</style>

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
<link rel="stylesheet" href="${path }/style.css">
<link rel="stylesheet" href="${path }/style2.css?ver=2">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
	
	function kakaoAddressStart(){
		// 우편번호 찾기 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('vue-daum-postcode-container');

//	     function foldDaumPostcode() {
//	         // iframe을 넣은 element를 안보이게 한다.
//	         element_wrap.style.display = 'none';
//	     }

//	     function sample3_execDaumPostcode() {
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                // 도로명 주소 받기, 지번주소 받기
	                addr = data.roadAddress;
	                zonecode = data.zonecode;

	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';

	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	                
	                var deliveryType = $('#deliveryType').val();
	                $.ajax({
	                	url : 'orderDeliveryTypeCheck.do',
	                	type : 'post',
	                	data : {
	                		'addr' : addr,
	                		'deliveryType' : deliveryType
	                	},
	                	success : function(data){
	                		if(data == 0){
	                			$.ajax({
	                				url : 'orderMorningDeliveryExcept.do',
	                				dataType : 'html',
	                				success : function(htmlOut){
	                					$('.modal-wrap__body').html(htmlOut);
	                				}
	                			})
	                		}else{
	                			$.ajax({
	                            	url : 'orderKakaoAddressSelectFinal.do',
	                            	dataType : 'html',
	                            	type : 'post',
	                            	data : {
	                            		'addr' : addr,
	                            		'zonecode' : zonecode
	                            	},
	                            	success : function(htmlOut){
	                            		$('.modal-wrap__body').html(htmlOut);
	                            	}
	                            })
	                		}
	                	}
	                })
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);

	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
	        $('.placeholder.show').text('예) 판교역로 235, 분당 주공');
			$('#region_name').attr('placeholder', '예) 판교역로 235, 분당 주공');
//	     }
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
					&& !$(e.target).hasClass("swal2-icon") && !$(e.target).hasClass("swal2-icon-content") && !$(e.target).hasClass("swal2-html-container") && !$(e.target).hasClass("swal2-confirm swal2-styled")) {
				$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
				$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
				$('#defaultDeliverydeleteCheck').detach();
				
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
	    	
	    $('#logout').click(function(){
	    	$.ajax({
	    		url : 'logout.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('body').append(htmlOut);
	    		}
	    	})
	    })
	    
	    $(document).on('click', '.modal-wrap', function(e){
	    	if(!$(e.target).hasClass("content-name") && !$(e.target).hasClass("content-price-wrap") && !$(e.target).hasClass("content-right") && 
	    			!$(e.target).hasClass("dropdown") && !$(e.target).hasClass("add-items-group-body-contents") && !$(e.target).hasClass("content-wrap") && 
	    			!$(e.target).hasClass("add-items-group") && !$(e.target).hasClass("content-discounted-price") && !$(e.target).hasClass("detail-wrap")
	    			&& !$(e.target).hasClass("modal-list-img") && !$(e.target).hasClass("order_modal_btn") && !$(e.target).hasClass("menu-tab")
	    			&& !$(e.target).hasClass("order-modal-tab-name") && !$(e.target).hasClass("dropdown-icon") && !$(e.target).hasClass("modal-header-slot-title")
	    			&& !$(e.target).hasClass("modal-header-slot") && !$(e.target).hasClass("add-items") && !$(e.target).hasClass("except1") && !$(e.target).hasClass("except2")
	    			&& !$(e.target).hasClass("add-items-selected") && !$(e.target).hasClass("add-items-selected-text") && !$(e.target).hasClass("count-and-price")
	    			&& !$(e.target).hasClass("button__wrap") && !$(e.target).hasClass("confirm-icon") && !$(e.target).hasClass("add-items-content-wrap")
	    			&& !$(e.target).hasClass("content-left") && !$(e.target).hasClass("dropdown-btn") && !$(e.target).hasClass("dropdown-content") && !$(e.target).hasClass("except3")
	    			&& !$(e.target).hasClass("confirm-list") && !$(e.target).hasClass("confirm-list-delete") && !$(e.target).hasClass("except4") && !$(e.target).hasClass("order-menu-temp-name")
	    			&& !$(e.target).hasClass("except5") && !$(e.target).hasClass("except6") && !$(e.target).hasClass("button button--size-large") && !$(e.target).hasClass("hidden-save-close")
	    			&& !$(e.target).hasClass("toggle-drop-down") && !$(e.target).hasClass("order-modal-select") && !$(e.target).hasClass("content-price") && !$(e.target).hasClass("order-menu-temp-discount")
	    			&& !$(e.target).hasClass("discount-price") && !$(e.target).hasClass("order-menu-temp-price") && !$(e.target).hasClass("page-header--modal") && !$(e.target).hasClass("col")
	    			&& !$(e.target).hasClass("address-index") && !$(e.target).hasClass("address-index__body") && !$(e.target).hasClass("error-list") && !$(e.target).hasClass("button--size-large-mobile")
	    			&& !$(e.target).hasClass("add-search__back") && !$(e.target).hasClass("modal-wrap__body") && !$(e.target).hasClass("add-confirm__back") && !$(e.target).hasClass("add-confirm__body")
	    			&& !$(e.target).hasClass("add-confirm__address") && !$(e.target).hasClass("form-text") && !$(e.target).hasClass("form-fieldset") && !$(e.target).hasClass("form-field")
	    			&& !$(e.target).hasClass("form-label") && !$(e.target).hasClass("row--v-center") && !$(e.target).hasClass("add-confirm-form") && !$(e.target).hasClass("add-confirm__empty")
	    			&& !$(e.target).hasClass("result-text") && !$(e.target).hasClass("result-text-sub") && !$(e.target).hasClass("result-text-sub-morning") && !$(e.target).hasClass("disable-place-title")
	    			&& !$(e.target).hasClass("disable-place-text") && !$(e.target).hasClass("name-wrap") && !$(e.target).hasClass("item__head") && !$(e.target).hasClass("round-text")
	    			&& !$(e.target).hasClass("item__address") && !$(e.target).hasClass("item__nav") && !$(e.target).hasClass("button--size-small") && !$(e.target).hasClass("item")
	    			&& !$(e.target).hasClass("vue-daum-postcode")){
	    		const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
	        	for (let i = 0; i < TimeoutId; i++) {
	        	  clearTimeout(i);
	        	}
	    		
	        	$('html').attr('class', '');
	        	$('body').attr('class', '');
	        	$('noscript').removeAttr('aria-hidden');
	        	$('#__nuxt').removeAttr('aria-hidden');
	        	$(window).scrollTop(200);
	        	$('.modal').attr('class', 'modal modal-leave-active modal-leave-to');
	        	setTimeout(function() {
	        		$('.modal').detach();
				}, 500);
	    	}
	    })
	    	
	    $(document).on('click', '#closeModal', function(){
	    	$('.swal2-container').detach();
	    })
	    
	    
	    // 페이지에서의 배송지 추가 버튼
	    $(document).on('click', '.address-index__nav .button__wrap.button1', function(){
	    	var member_delivery_type = $('#deliveryType').val();
	    	$.ajax({
	    		url : 'myBesongjiModal.do',
	    		dataType : 'html',
	    		type : 'post',
	    		data : {
	    			'member_delivery_type' : member_delivery_type
	    		},
	    		success : function(htmlOut){
	    			$('html').attr('class', 'mode-popup');
	    			$('.mypage-header-info').append(htmlOut);
	    		}
	    	})
	    });
	    
	    
	    // 기본 배송지로 설정 버튼
	    $(document).on('click', '.default-besongji', function(){
	    	$.ajax({
	    		url : 'orderDefaultDeliveryCheckModal.do',
	    		dataType : 'html',
	    		context : this,
	    		success : function(htmlOut){
	    			$(this).after('<input type="hidden" id="defaultDeliverydeleteCheck">');
	    			$('html').attr('class', 'mode-popup swal2-shown swal2-height-auto');
	    			$('body').attr('class', 'swal2-shown swal2-height-auto');
	    			$('noscript').attr('aria-hidden', 'true');
	    			$('#__nuxt').attr('aria-hidden', 'true');
	    			$('body').append(htmlOut);
	    		}
	    	})
	    });
	    
	 	// 기본 배송지 설정 변경 체크 모달창 취소 버튼
	    $(document).on('click', '.swal2-cancel.swal2-styled', function(){
	    	$('#defaultDeliverydeleteCheck').detach();
	    	$('#checkDefaultDelivery').val(0);
	    });
	 	
	 	// 기본 배송지 설정 변경 체크 모달창 확인 버튼
	    $(document).on('click', '.swal2-confirm.swal2-styled', function(){
	    	var member_zipcode_code = $('#defaultDeliverydeleteCheck').closest('li').find('input:odd').val();
	    	var member_delivery_type = $('#deliveryType').val();
	    	
	    	$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
			$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
			$('#defaultDeliverydeleteCheck').detach();
			
			setTimeout(function() {
				$('.swal2-container').detach();
			}, 100);
			
	    	$.ajax({
	    		url : 'myBesongjiDefaultZipCheck.do',
	    		type : 'post',
	    		data : {
	    			'member_zipcode_code' : member_zipcode_code,
	    			'member_delivery_type' : member_delivery_type
	    		},
	    		success : function(data){
	    			$.ajax({
	    				url : 'myBesongjiModalDetail.do',
	    				dataType : 'html',
	    				type : 'post',
	    				data : {
	    					'member_zipcode_code' : member_zipcode_code,
	    	    			'member_delivery_type' : member_delivery_type
	    				},
	    				success : function(htmlOut){
	    					$('.address-index__index').html(htmlOut);
	    				}
	    			})
	    		}
	    	})
	    });
	 	
	 	
	 	// 배송지 추가 버튼
	 	$(document).on('click', '.button__wrap.button2', function(){
	 		$.ajax({
	    		url : 'myBesongjiKakaoAddressContainer.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('.modal-wrap__body').html(htmlOut);
	    			
	    			kakaoAddressStart();
	    			
	    			$('.placeholder').css('display', 'none');
	    			$('#region_name').attr('placeholder', '예) 판교역로 235, 분당 주공');
	    		}
	    	})
	 	});
	
		
	 	// 카카오톡 주소 api 화면에서 백 화살표 버튼
	 	$(document).on('click', '.add-search__back', function(){
	 		var member_delivery_type = $('#deliveryType').val();
	    	
	    	$.ajax({
	    		url : 'myBesongjiModalDetail2.do',
	    		dataType : 'html',
	    		type : 'post',
	    		data : {
	    			'member_delivery_type' : member_delivery_type
	    		},
	    		success : function(htmlOut){
	    			$('.modal-wrap__body').html(htmlOut);
	    		}
	    	})
	    });
	 	
	 	// 새벽배송에서 너무 먼 지역 클릭해서 불가능 모달 떴을 때 뒤로 가는 화살표 버튼
	    $(document).on('click', '.add-confirm__back', function(){
	    	$.ajax({
	    		url : 'myBesongjiKakaoAddressContainer.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('.modal-wrap__body').html(htmlOut);
	    			
	    			kakaoAddressStart();
	    			
	    			$('.placeholder').css('display', 'none');
	    			$('#region_name').attr('placeholder', '예) 판교역로 235, 분당 주공');
	    		}
	    	})
	    });
	    
	 	// 새벽배송 불가능 지역 창 확인 버튼
	    $(document).on('click', '.button.add-confirm__empty__button .button__wrap', function(){
	    	$.ajax({
	    		url : 'myBesongjiKakaoAddressContainer.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('.modal-wrap__body').html(htmlOut);
	    			
	    			kakaoAddressStart();
	    			
	    			$('.placeholder').css('display', 'none');
	    			$('#region_name').attr('placeholder', '예) 판교역로 235, 분당 주공');
	    		}
	    	})
	    });
	    
	 	// 기본 배송지 설정 체크 박스
	    $(document).on('click', '#f_dest_is_main', function(){
	    	if($('#defaultBesongjiCheck').val() == 'n'){
	    		$('#defaultBesongjiCheck').val('y');
	    	}else{
	    		$('#defaultBesongjiCheck').val('n');
	    	}
	    });
	 	
	 	
	 	// 배송지 등록 버튼
	    $(document).on('click', '.kakaoFinalRegistration', function(){
	    	if($('.form-text').eq(0).val().length == 0){
	    		alert('상세주소를 입력해주세요.');
	    		return false;
	    	}else if($('.form-text').eq(1).val().length == 0){
	    		alert('배송지명을 입력해주세요.');
	    		return false;
	    	}
	    	
	    	var zonecode = $('.add-confirm__address').children('em').text();
	    	var address = $('.add-confirm__address').children('span').text();
	    	var detailAddress = $('.form-text').eq(0).val();
	    	var shippingAddress = $('.form-text').eq(1).val();
	    	var defaultAddressCheck = $('#defaultBesongjiCheck').val();
	    	var deliveryType = $('#deliveryType').val();
	    	
	    	$(window).scrollTop(200);
	    	$('.modal').detach();
	    	
	    	$.ajax({
	    		url : 'memberZipcodeRegistration.do',
	    		type : 'post',
	    		data : {
	    			'member_zipcode' : zonecode,
	    			'member_address' : address,
	    			'member_detail_address' : detailAddress,
	    			'member_shipping_address' : shippingAddress,
	    			'member_default_address' : defaultAddressCheck,
	    			'member_delivery_type' : deliveryType
	    		},
	    		success : function(data){
	    			$.ajax({
	    	    		url : 'orderBesongjiRegistrationCompleteCheckModal.do',
	    	    		dataType : 'html',
	    	    		success : function(htmlOut){
	    	    			$('html').attr('class', 'swal2-toast-shown swal2-shown');
	    	    	    	$('body').attr('class', 'swal2-toast-shown swal2-shown');
	    	    			$('body').append(htmlOut);
	    	    			
	    	    			setTimeout(function() {
	    	    				$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').css('overflow-y', 'auto');
	    	    				
	    	    				setTimeout(function() {
	    	    					$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
	    	    					$('html').attr('class', '');
	    	    					$('body').attr('class', '');
	    	    				}, 3000);
	    	    			}, 500);
	    	    			
	    	    			$.ajax({
	    	    				url : 'myBesongjiCommonDetail.do',
	    	    				dataType : 'html',
	    	    				type : 'post',
	    	    				data : {
	    	    					'member_delivery_type' : deliveryType
	    	    				},
	    	    				success : function(htmlOut){
	    	    					$('.mypage-destination__body').html(htmlOut);
	    	    					$('#defaultBesongjiCheck').val('n');
	    	    				}
	    	    			})
	    	    		}
	    	    	});
	    		}
	    	})
	    });
	 	
	 	
	 	// 새벽배송 탭 버튼
	 	$(document).on('click', '.nav-tab__wrap div:even', function(){
	 		$('#deliveryType').val(0);
	 		var deliveryType = $('#deliveryType').val();
	 		$(this).attr('class', 'on');
	 		$(this).siblings('div').attr('class', '');
	 		$.ajax({
				url : 'myBesongjiCommonDetail.do',
				dataType : 'html',
				type : 'post',
				data : {
					'member_delivery_type' : deliveryType
				},
				success : function(htmlOut){
					$('.mypage-destination__body').html(htmlOut);
					$('#defaultBesongjiCheck').val('n');
				}
			})
	 	})
	 	
	 	// 택배배송 탭 버튼
	 	$(document).on('click', '.nav-tab__wrap div:odd', function(){
	 		$('#deliveryType').val(1);
	 		var deliveryType = $('#deliveryType').val();
	 		$(this).attr('class', 'on');
	 		$(this).siblings('div').attr('class', '');
	 		$.ajax({
				url : 'myBesongjiCommonDetail.do',
				dataType : 'html',
				type : 'post',
				data : {
					'member_delivery_type' : deliveryType
				},
				success : function(htmlOut){
					$('.mypage-destination__body').html(htmlOut);
					$('#defaultBesongjiCheck').val('n');
				}
			})
	 	});
	 	
	 	
	 	// 배송지 삭제 버튼
	 	$(document).on('click', '.zip-delete-button', function(){
	 		var member_zipcode_code = $(this).closest('li').find('input').val();
	 		var member_delivery_type = $('#deliveryType').val();
	 		if(confirm("선택하신 배송지를 삭제하시겠습니까?") == true){
	 			$.ajax({
	 				url : 'myBesongjiDeleteZipcode.do',
	 				type : 'post',
	 				data : {
	 					'member_zipcode_code' : member_zipcode_code
	 				},
	 				success : function(data1){
	 					$.ajax({
	 						url : 'myBesongjiUpdateZipcode.do',
	 						type : 'post',
	 						data : {
	 							'member_delivery_type' : member_delivery_type
	 						},
	 						success : function(data2){
	 							$.ajax({
	 								url : 'myBesongjiCommonDetail.do',
	 								dataType : 'html',
	 								type : 'post',
	 								data : {
	 									'member_delivery_type' : member_delivery_type
	 								},
	 								success : function(htmlOut){
	 									$('.mypage-destination__body').html(htmlOut);
	 								}
	 							})
	 						}
	 					})
	 				}
	 			})
	 	    }else{
	 	        return ;
	 	    }
	 	});
	 	
	 	// 배송지 기본 배송지 설정 버튼
	 	$(document).on('click', '.zip-default-check-button', function(){
	 		var member_zipcode_code = $(this).closest('li').find('input').val();
	 		var member_delivery_type = $('#deliveryType').val();
	 		
	 		if(confirm("선택하신 배송지를 기본 배송지로 설정하시겠습니까?") == true){
	 			$.ajax({
		    		url : 'myBesongjiDefaultZipCheck.do',
		    		type : 'post',
		    		data : {
		    			'member_zipcode_code' : member_zipcode_code,
		    			'member_delivery_type' : member_delivery_type
		    		},
		    		success : function(data){
		    			$.ajax({
							url : 'myBesongjiCommonDetail.do',
							dataType : 'html',
							type : 'post',
							data : {
								'member_delivery_type' : member_delivery_type
							},
							success : function(htmlOut){
								$('.mypage-destination__body').html(htmlOut);
							}
						})
		    		}
		    	})
	 		}else{
	 	        return ;
	 	    }
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
						<input type="hidden" name="itemCode01" value="">
						<input type="hidden" name="tagSub01" value="">
					</form>
					<input type="hidden" value="0" id="deliveryType">
					<input type="hidden" value="n" id="defaultBesongjiCheck">
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
					<div data-v-421abad8="" data-v-bb8d8f74="" data-v-0f5971ec=""
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
											href="/mypage/delivery" class=""><em data-v-3e2784be="">${deliveryNum }</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">포인트</span> <a data-v-3e2784be=""
											href="/mypage/points" class=""><em data-v-3e2784be="">${point }</em></a>
									</p>
								</div>
								<div data-v-3e2784be="" class="mypage-header-info__meta">
									<p data-v-3e2784be="">
										<span data-v-3e2784be="">보유 쿠폰</span> <a data-v-3e2784be=""
											href="/mypage/coupons" class=""><em data-v-3e2784be="">${couponNum }</em></a>
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
												href="myBesongji.do" aria-current="page"
												class="nuxt-link-exact-active nuxt-link-active">배송지 관리</a></li>
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
									<article data-v-bb8d8f74="" data-v-421abad8=""
										class="mypage-destination">
										<header data-v-2c0651a8="" data-v-bb8d8f74=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">배송지 관리</h2>
											<!---->
										</header>
										<nav data-v-610ea6d8="" data-v-bb8d8f74=""
											class="nav-tab mypage-destination__tab" data-v-421abad8="">
											<div data-v-610ea6d8="" class="nav-tab__wrap">
												<div data-v-610ea6d8="" class="on">
													<button data-v-610ea6d8="" type="button">
														<span data-v-610ea6d8="">새벽배송</span>
													</button>
												</div>
												<div data-v-610ea6d8="" class="">
													<button data-v-610ea6d8="" type="button">
														<span data-v-610ea6d8="">택배배송</span>
													</button>
												</div>
											</div>
										</nav>
										<div data-v-bb8d8f74="" data-v-421abad8=""
											class="mypage-destination__body">
											<div data-v-bb8d8f74="" data-v-421abad8=""
												class="row--v-center row--h-between mypage-destination__body-head">
												<c:if test="${list[0].member_delivery_type == 0 }">
													<strong data-v-bb8d8f74="" data-v-421abad8="">내 새벽배송지 ${fn:length(list)}개</strong>
												</c:if>
												<c:if test="${list[0].member_delivery_type == 1 }">
													<strong data-v-bb8d8f74="" data-v-421abad8="">내 택배배송지 ${fn:length(list)}개</strong>
												</c:if>
												<div data-v-bb8d8f74="" data-v-421abad8=""
													class="address-index__nav">
													<button data-v-a1c889e0="" data-v-bb8d8f74="" type="button"
														title=""
														class="button button--size-small button--outline2"
														data-v-421abad8="">
														<span data-v-a1c889e0="" class="button__wrap button1">+ 배송지
															추가</span>
													</button>
												</div>
											</div>
											<div data-v-bb8d8f74="" data-v-421abad8=""
												class="mypage-destination__index">
												<c:if test="${fn:length(list) > 0}">
													<ul data-v-bb8d8f74="" data-v-421abad8="">
													
														<c:forEach var="list" items="${list }">
															<c:if test="${list.member_default_address == 'y' }">
																<li data-v-bb8d8f74="" data-v-421abad8=""><div
																		data-v-bb8d8f74="" data-v-421abad8=""
																		class="mypage-destination-item">
																		<div data-v-bb8d8f74="" data-v-421abad8=""
																			class="mypage-destination-item__body">
																			<div data-v-bb8d8f74="" data-v-421abad8=""
																				class="row--v-center mypage-destination-item__header">
																				<div data-v-bb8d8f74="" data-v-421abad8="" class="col">
																					<strong data-v-bb8d8f74="" data-v-421abad8="">${list.member_shipping_address }</strong>
																				</div>
																				<div data-v-bb8d8f74="" data-v-421abad8="">
																					<span data-v-7f86e76e="" data-v-bb8d8f74=""
																						class="round-text" data-v-421abad8="">기본 배송지</span>
																				</div>
																			</div>
																			<p data-v-bb8d8f74="" data-v-421abad8=""
																				class="mypage-destination-item__description">${list.member_address } ${list.member_detail_address }</p>
																		</div>
																		<nav data-v-bb8d8f74="" data-v-421abad8=""
																			class="row--h-start mypage-destination-item__nav">
																			<!---->
																			<div data-v-bb8d8f74="" data-v-421abad8="">
																				<button data-v-a1c889e0="" data-v-bb8d8f74=""
																					type="button" title=""
																					class="button button button--side-padding button--size-small button--color-gray button--outline"
																					data-v-421abad8="">
																					<span data-v-a1c889e0="" class="button__wrap zip-delete-button">
																						삭제 </span>
																				</button>
																			</div>
																		</nav>
																	</div>
																	<input type="hidden" value="${list.member_zipcode_code }">
																</li>
															</c:if>
														</c:forEach>
														
														<c:forEach var="list" items="${list }">
															<c:if test="${list.member_default_address == 'n' }">
																<li data-v-bb8d8f74="" data-v-421abad8=""><div
																		data-v-bb8d8f74="" data-v-421abad8=""
																		class="mypage-destination-item">
																		<div data-v-bb8d8f74="" data-v-421abad8=""
																			class="mypage-destination-item__body">
																			<div data-v-bb8d8f74="" data-v-421abad8=""
																				class="row--v-center mypage-destination-item__header">
																				<div data-v-bb8d8f74="" data-v-421abad8="" class="col">
																					<strong data-v-bb8d8f74="" data-v-421abad8="">${list.member_shipping_address }</strong>
																				</div>
																				<!---->
																			</div>
																			<p data-v-bb8d8f74="" data-v-421abad8=""
																				class="mypage-destination-item__description">${list.member_address } ${list.member_detail_address }</p>
																		</div>
																		<nav data-v-bb8d8f74="" data-v-421abad8=""
																			class="row--h-start mypage-destination-item__nav">
																			<div data-v-bb8d8f74="" data-v-421abad8="">
																				<button data-v-a1c889e0="" data-v-bb8d8f74=""
																					type="button" title=""
																					class="button button button--side-padding button--size-small button--color-gray button--outline"
																					data-v-421abad8="">
																					<span data-v-a1c889e0="" class="button__wrap zip-default-check-button">
																						기본 배송지 설정 </span>
																				</button>
																			</div>
																			<div data-v-bb8d8f74="" data-v-421abad8="">
																				<button data-v-a1c889e0="" data-v-bb8d8f74=""
																					type="button" title=""
																					class="button button button--side-padding button--size-small button--color-gray button--outline"
																					data-v-421abad8="">
																					<span data-v-a1c889e0="" class="button__wrap zip-delete-button">
																						삭제 </span>
																				</button>
																			</div>
																		</nav>
																	</div>
																	<input type="hidden" value="${list.member_zipcode_code }">
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</c:if>
												<c:if test="${fn:length(list) == 0}">
													<div data-v-6b53621a="" data-v-bb8d8f74=""
														class="error-list" data-v-421abad8="">
														<p data-v-6b53621a="">등록된 배송지가 없습니다.</p>
													</div>
												</c:if>
											</div>
											
										</div>
										
										<!---->
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