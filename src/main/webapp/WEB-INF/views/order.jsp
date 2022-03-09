<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/order"/>
<!DOCTYPE html>
<html>
<head>
<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta charset="UTF-8">
<meta data-n-head="ssr" data-hid="title" name="title" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description" content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords" content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="og:title" property="og:title" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description" property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:url" property="og:url" content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image" content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
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
<link rel="stylesheet" href="${path }/style2.css?ver=10">
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
    
    $('#delivery-morning').trigger("click");
    
    $(document).on('click', '.delivery-desc-btn', function(){
    	$.ajax({
    		url : 'orderShippingAddressExplainModal.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.order').append(htmlOut);
    		}
    	})
    });
    
    $(document).on('click', '.modal-mask', function(e){
    	if(!$(e.target).hasClass("modal-wrapper") && !$(e.target).hasClass("modal-header") && !$(e.target).hasClass("except") && !$(e.target).hasClass("desc-title")
    			&& !$(e.target).hasClass("desc-wrap") && !$(e.target).hasClass("desc-text") && !$(e.target).hasClass("modal-body")){
    		$('.modal-mask').detach();
    	}
    });
    
    $(document).on('click', '.add', function(){
    	$('html').attr('class', 'mode-popup');
    	$.ajax({
    		url : 'orderModal.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'item_tag_main' : 200
    		},
    		success : function(htmlOut){
    			$('.order').append(htmlOut);
    			
    			var oldPrice = $('#oldPrice').val();
    			$('.count-and-price').text($('#oldQuantity').val() + '개' + ' / ' + Number(oldPrice).toLocaleString('ko-KR') + '원');
    		}
    	})
    });
    
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
    			&& !$(e.target).hasClass("discount-price") && !$(e.target).hasClass("order-menu-temp-price")){
    		const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
        	for (let i = 0; i < TimeoutId; i++) {
        	  clearTimeout(i);
        	}
        	$('.swal2-container').detach();
    		$('html').attr('class', '');
    		$('body').attr('class', '');
    		
    		
    		$('.modal-wrap').detach();
        	$('html').attr('class', '');
        	
        	var oldQuantity = $('#oldQuantity').val();
        	var oldPrice = $('#oldPrice').val();
        	$('#latelyQuantity').val(oldQuantity);
        	$('#latelyPrice').val(oldPrice);
        	
        	var cloneElements = $('.hidden-div').children('div').clone();
        	$('.hidden-div2').empty();
        	cloneElements.appendTo('.hidden-div2');
    	}
    })
    
    $(document).on('click','.order_modal_btn', function(){
    	var tagMain = $(this).prev().val();
    	$(this).parent().attr('class', 'on');
    	$(this).parent().siblings().attr('class', '');
    	$.ajax({
    		url : 'orderModalAjax.do',
    		type : 'post',
    		dataType : 'html',
    		data : {
    			'item_tag_main' : tagMain
    		},
    		success : function(htmlOut){
    			$('.add-items-group-body').html(htmlOut);
    		}
    	});
    	
    	$( '.modal-content.modal-content-height-full' ).animate( {
    		scrollTop : 0
    	}, 400 );
    });
    
    $(document).on('click', '.button.dropdown', function(){
    	var tagMain = $(this).siblings().first().val();
    	var itemCode = $(this).prev().val();
    	var checkCode = $('.dropdown-btn.dropdown-open').children('input').last().val();
    	
    	$('.dropdown-btn.dropdown-open').attr('class', 'dropdown-btn');
    	$('.toggle-drop-down').detach();
    	if(itemCode != checkCode){
	    	$(this).parent().attr('class', 'dropdown-btn dropdown-open');
	    	
	    	
	    	$.ajax({
	    		url : 'orderDropDown.do',
	    		type : 'post',
	    		dataType : 'html',
	    		data : {
	    			'item_tag_main' : tagMain,
	    			'item_code' : itemCode
	    		},
	    		context: this,
	    		success : function(htmlOut){
	    			$(this).after(htmlOut);
	    		}
	    	})
	    }
    });
    
    $(document).on('click', '.order-modal-select', function(){
    	// 먼저 모든 타임아웃 동작 중지
    	const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
    	for (let i = 0; i < TimeoutId; i++) {
    	  clearTimeout(i);
    	}
    	$('.swal2-container').detach();
		$('html').attr('class', 'mode-popup');
		$('body').attr('class', '');
    	
    	var itemName = $(this).children('input').first().val();
    	var itemPrice = $(this).children('input').last().val();
    	var itemSize = $(this).children('div').children('div').first().children('span').first().text();
    	var itemSizeSummary = $(this).children('input').eq(1).val();
    	var itemCode = $(this).children('input').eq(2).val();
    	var itemTagMain = $(this).children('input').eq(3).val();
    	var itemPriceSub = $(this).children('input').eq(4).val();
    	
    	var oldQuantity = $('#oldQuantity').val();
    	var oldPrice = $('#oldPrice').val();
    	var latelyQuantity = $('#latelyQuantity').val();
    	var latelyPrice = $('#latelyPrice').val();
    	
    	$('.toggle-drop-down').detach();
    	$('.dropdown-btn.dropdown-open').attr('class', 'dropdown-btn');
    	
    	$('.swal2-container').remove();
    	// ${itemInfo.item_tag_main}/${itemInfo.item_code }/${itemSizeSummary}
    	if($('.' + itemTagMain + '\\/' + itemCode + '\\/' + itemSizeSummary).length > 0){
    		$.ajax({
    			url : 'orderSaveFail.do',
    			dataType : 'html',
    			success : function(htmlOut){
    				$('body').append(htmlOut);
    				$('html').attr('class', 'mode-popup swal2-toast-shown swal2-shown');
    				$('body').attr('class', 'swal2-toast-shown swal2-shown');
    				var timer1 = setTimeout(function() {
    					$('.swal2-container').css('overflow-y', 'auto');
    				}, 500);
    				var timer2 = setTimeout(function() {
    					$('.swal2-container').attr('class', 'swal2-container swal2-bottom toast-container-class swal2-backdrop-hidden');
    				}, 2450);
    				var timer3 = setTimeout(function() {
    					$('.swal2-container').detach();
    					$('html').attr('class', 'mode-popup');
    					$('body').attr('class', '');
    				}, 2500);
    			}
    		});
    	}else{
        	$('#latelyQuantity').val(Number(latelyQuantity) + 1);
        	$('#latelyPrice').val(Number(latelyPrice) + Number(itemPrice.replace(',', '')));
    		
    		$.ajax({
        		url : 'orderSaveTmp.do',
        		type : 'post',
        		dataType : 'html',
        		data : {
        			'item_code' : itemCode,
        			'item_tag_main' : itemTagMain,
        			'itemPrice' : itemPrice,
        			'item_name' : itemName,
        			'itemSize' : itemSize,
        			'itemSizeSummary' : itemSizeSummary,
        			'itemPriceSub' : itemPriceSub
        		},
        		success : function(htmlOut){
        			$('.hidden-div2').append(htmlOut); 
        			// 모달창 꺼질 땐 hidden-div2 안은 지워야 한다.
        			// 선택 완료 말고 그냥 엑스버튼이나 공백을 눌러서 꺼버릴 시, 
        			// 최근에 선택했던 것들을 비교해서 지워야 하기 때문
        		}
        	});
    		
    		$.ajax({
    			url : 'calculate.do',
    			type : 'post',
    			data : {
    				'price' : itemPrice,
    				'latelyPrice' : latelyPrice
    			},
    			success : function(data){
    				$('.count-and-price').text($('#latelyQuantity').val() + '개' + ' / ' + data + '원');
    			}
    		});
    		
    		$.ajax({
    			url : 'orderSaveSuccess.do',
    			dataType : 'html',
    			success : function(htmlOut){
    				$('body').append(htmlOut);
    				$('html').attr('class', 'mode-popup swal2-toast-shown swal2-shown');
    				$('body').attr('class', 'swal2-toast-shown swal2-shown');
    				var timer1 = setTimeout(function() {
    					$('.swal2-container').css('overflow-y', 'auto');
    				}, 500);
    				var timer2 = setTimeout(function() {
    					$('.swal2-container').attr('class', 'swal2-container swal2-bottom toast-container-class swal2-backdrop-hidden');
    				}, 2450);
    				var timer3 = setTimeout(function() {
    					$('.swal2-container').detach();
    					$('html').attr('class', 'mode-popup');
    					$('body').attr('class', '');
    				}, 2500);
    			}
    		});
    	}
    })
    
    $(document).on('click', '.hidden-save-open', function(){
    	if($('.hidden-div2').children('div').length == 0) return false;
    	
    	$('.modal-content.modal-content-height-full').css('overflow-y', 'hidden');
    	$('.add-items-body').css('opacity', '0.3');
    	$('.add-items-body').css('pointer-events', 'none');
    	$.ajax({
    		url : 'confirmIconChange2.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.confirm-icon').append(htmlOut);
    		}
    	});
    	$('.hidden-save-open').detach();
    	
//     	alert($('.hidden-div').children('div').eq(0).children('.savePrice').val() + " " + $('.hidden-div').children('div').eq(1).children('.savePrice').val());
		var saveItemCode = [], data = {}; // {} 중괄호는 데이터 dictionary 선언, [] 대괄호는 배열 선언
		var saveTagMain = [];
		var savePrice = [];
		var savePriceSub = [];
		var saveItemName = [];
		var saveItemSize = [];
		var saveitemSizeSummary = [];
	    for(var i = 0; i < $('.hidden-div2').children('div').length; i++){
	    	saveItemCode[i] = $('.hidden-div2').children('div').eq(i).children('.saveItemCode').val();
	    	saveTagMain[i] = $('.hidden-div2').children('div').eq(i).children('.saveTagMain').val();
	    	savePrice[i] = $('.hidden-div2').children('div').eq(i).children('.savePrice').val();
	    	savePriceSub[i] = $('.hidden-div2').children('div').eq(i).children('.savePriceSub').val();
	    	saveItemName[i] = $('.hidden-div2').children('div').eq(i).children('.saveItemName').val();
	    	saveItemSize[i] = $('.hidden-div2').children('div').eq(i).children('.saveItemSize').val();
	    	saveitemSizeSummary[i] = $('.hidden-div2').children('div').eq(i).children('.saveitemSizeSummary').val();
	    }
	    
	    data.saveItemCode = saveItemCode;
	    data.saveTagMain = saveTagMain;
	    data.savePrice = savePrice;
	    data.savePriceSub = savePriceSub;
	    data.saveItemName = saveItemName;
	    data.saveItemSize = saveItemSize;
	    data.saveitemSizeSummary = saveitemSizeSummary;
	    jQuery.ajaxSettings.traditional = true;
	    
    	$.ajax({
    		url : 'orderHiddenSavePresentation.do',
    		dataType : 'html',
    		type : 'post',
    		data : data,
    		success : function(htmlOut){
    			$('.add-items-content-wrap').append(htmlOut);
    		}
    	});
    });
    
    $(document).on('click', '.hidden-save-close', function(){
    	$('.modal-content.modal-content-height-full').css('overflow-y', 'auto');
    	$('.add-items-body').css('opacity', '1');
    	$('.add-items-body').css('pointer-events', 'auto');
    	$.ajax({
    		url : 'confirmIconChange1.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.confirm-icon').append(htmlOut);
    		}
    	});
    	$('.hidden-save-close').detach();
    	$('.add-items-confirm-list').detach();
    })
    
    // 삭제버튼 클릭시
    $(document).on('click', '.except4', function(){
    	var tmp = $(this).parent().siblings('input').eq(0).val();
    	for(var i = 0; i < $('.hidden-div2').children('div').length; i++){
    		var x2 = $('.hidden-div2').children('div').eq(i);
    		if(x2.attr('class') == tmp){
    			x2.detach();
    			$(this).parent().parent().detach();
    		}
    	}
    	
    	var latelyQuantity = $('#latelyQuantity').val();
    	var latelyPrice = $('#latelyPrice').val();
    	var selectPrice = $(this).parent().siblings('input').eq(1).val();
    	$('#latelyQuantity').val(Number(latelyQuantity) - 1);
    	$('#latelyPrice').val(Number(latelyPrice) - Number(selectPrice.replace(',','')));
    	var latelyPriceTmp = $('#latelyPrice').val();
		$('.count-and-price').text($('#latelyQuantity').val() + '개' + ' / ' + Number(latelyPriceTmp).toLocaleString('ko-KR') + '원');
    	
    	if($('.hidden-div2').children('div').length == 0){
    		$('.hidden-save-close').trigger('click');
    	}
    });
    
    $(document).on('click', '.button__wrap', function(){
    	const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
    	for (let i = 0; i < TimeoutId; i++) {
    	  clearTimeout(i);
    	}
    	$('.swal2-container').detach();
		$('html').attr('class', '');
		$('body').attr('class', '');
		
    	$('.modal-wrap').detach();
    	
    	var latelyQuantity = $('#latelyQuantity').val();
    	var latelyPrice = $('#latelyPrice').val();
    	$('#oldQuantity').val(latelyQuantity);
    	$('#oldPrice').val(latelyPrice);
    	
    	var cloneElements = $('.hidden-div2').children('div').clone();
    	$('.hidden-div').empty();
    	cloneElements.appendTo('.hidden-div');
    	
    	if($('.hidden-div-real').children('div').length > 0){
		    for(var i = 0; i < $('.hidden-div').children('div').length; i++){
		    	var checkR = 0;
		    	for(var j = 0; j < $('.hidden-div-real').children('div').length; j++){
		    		if($('.hidden-div').children('div').eq(i).attr('class') == $('.hidden-div-real').children('div').eq(j).attr('class')){
		    			checkR++;
		    			break;
		    		}
		    	}
		    	if(checkR == 0){
		    		var cloneElements = $('.hidden-div').children('div').eq(i).clone();
		        	cloneElements.appendTo('.hidden-div-real');
		    	}
		    }
		    
		    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
		    	var checkR = 0;
		    	for(var j = 0; j < $('.hidden-div').children('div').length; j++){
		    		if($('.hidden-div-real').children('div').eq(i).attr('class') == $('.hidden-div').children('div').eq(j).attr('class')){
		    			checkR++;
		    			break;
		    		}
		    	}
		    	if(checkR == 0){
		    		var cloneElements = $('.hidden-div-real').children('div').eq(i).detach();
		    	}
		    }
	    }else{
	    	var cloneElements = $('.hidden-div').children('div').clone();
        	cloneElements.appendTo('.hidden-div-real');
	    }
    	
    	var saveItemCode = [], data = {};
		var saveTagMain = [];
		var savePrice = [];
		var savePriceSub = [];
		var saveItemName = [];
		var saveItemSize = [];
		var saveitemSizeSummary = [];
		var saveitemQuantity = [];
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	saveItemCode[i] = $('.hidden-div-real').children('div').eq(i).children('.saveItemCode').val();
	    	saveTagMain[i] = $('.hidden-div-real').children('div').eq(i).children('.saveTagMain').val();
	    	savePrice[i] = $('.hidden-div-real').children('div').eq(i).children('.savePrice').val();
	    	savePriceSub[i] = $('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val();
	    	saveItemName[i] = $('.hidden-div-real').children('div').eq(i).children('.saveItemName').val();
	    	saveItemSize[i] = $('.hidden-div-real').children('div').eq(i).children('.saveItemSize').val();
	    	saveitemSizeSummary[i] = $('.hidden-div-real').children('div').eq(i).children('.saveitemSizeSummary').val();
	    	saveitemQuantity[i] = $('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val();
	    }
	    
	    data.saveItemCode = saveItemCode;
	    data.saveTagMain = saveTagMain;
	    data.savePrice = savePrice;
	    data.savePriceSub = savePriceSub;
	    data.saveItemName = saveItemName;
	    data.saveItemSize = saveItemSize;
	    data.saveitemSizeSummary = saveitemSizeSummary;
	    data.saveitemQuantity = saveitemQuantity;
	    jQuery.ajaxSettings.traditional = true; // ajax로 리스트 형식을 보내기 위한 셋팅
    	
    	if($('.hidden-div').children('div').length > 0){
    		$.ajax({
    			url : 'orderSaveComplete.do',
    			type : 'post',
    			dataType : 'html',
    			data : data,
    			success : function(htmlOut){
    				$('.order-selected-item-wrap').html(htmlOut);
    			}
    		});
    	}
	    
	    var realPrice = 0;
	    var realPriceSub = 0;
	    var realQuantity = 0;
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    		realPriceSub += (tmp1 - tmp2);
	    	}
	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    }
	    $('#realPrice').val(realPrice);
    	$('#realPriceSub').val(realPriceSub);
    	$('#realQuantity').val(realQuantity);
    	
    	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + realPrice.toLocaleString('ko-KR') + '원');
    	$('.info-content').eq(2).children().eq(1).text('- ' + realPriceSub.toLocaleString('ko-KR') + '원');
    	
    	if(realPrice < 10000){
    		var remainPrice = 10000 - realPrice;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    			}
    		})
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    	}
    	
    	if(realPrice < 35000){
    		var remainPrice = 35000 - realPrice;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    	}
    });
    
    $(document).on('click', '.swal2-title', function(){
    	$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
    	const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
    	for (let i = 0; i < TimeoutId; i++) {
    	  clearTimeout(i);
    	}
    	$('.swal2-container').detach();
		$('html').attr('class', 'mode-popup');
		$('body').attr('class', '');
    });
    
    $(document).on('click', '.form-number__control:even', function(){
    	if($(this).siblings('span').children('input').val() == 1){
    		return false;
    	}
    	// 돔 요소 자체를 가져오고 싶으면 [] 를 써서 인덱스를 지정해야 한다. 
		$(this).siblings('span').children('input')[0].stepDown();
    	var onePrice = $(this).siblings('input').eq(1).val().replace(',', '');
    	var oldPrice;
    	var onePriceSub = $(this).siblings('input').eq(2).val().replace(',', '');
    	var oldPriceSub;
    	var oldQuantity;
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
    		var check = 0;
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == $(this).siblings('input').eq(0).val()){
	    		check++;
	    	}
	    	if(check != 0){
	    		oldPrice = $('.hidden-div-real').children('div').eq(i).children('.savePrice').val();
	    		oldPrice = oldPrice.replace(',', '');
	    		var resultP = Number(oldPrice) - Number(onePrice);
	    		$(this).parent().parent().parent().find('.selected-item-price').children().text(Number(resultP).toLocaleString('ko-KR') + '원');
	    		$('.hidden-div-real').children('div').eq(i).children('.savePrice').val(Number(resultP).toLocaleString('ko-KR'));
	    		
	    		oldPriceSub = $('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val();
	    		oldPriceSub = oldPriceSub.replace(',', '');
	    		var resultPS = Number(oldPriceSub) - Number(onePriceSub);
	    		$(this).parent().parent().parent().find('.selected-item-discount').text(Number(resultPS).toLocaleString('ko-KR'));
	    		$('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val(Number(resultPS).toLocaleString('ko-KR'));
	    		
	    		oldQuantity = $('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val();
	    		var resultQ = Number(oldQuantity) - 1;
	    		$('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val(resultQ);
	    		break;
	    	}
	    }
    	
    	var realPrice = 0;
	    var realPriceSub = 0;
	    var realQuantity = 0;
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    		realPriceSub += (tmp1 - tmp2);
	    	}
	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    }
	    $('#realPrice').val(realPrice);
    	$('#realPriceSub').val(realPriceSub);
    	$('#realQuantity').val(realQuantity);
    	
    	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + realPrice.toLocaleString('ko-KR') + '원');
    	$('.info-content').eq(2).children().eq(1).text('- ' + realPriceSub.toLocaleString('ko-KR') + '원');
    	
    	if(realPrice < 10000){
    		var remainPrice = 10000 - realPrice;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    			}
    		})
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    	}
    	
    	if(realPrice < 35000){
    		var remainPrice = 35000 - realPrice;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    	}
    });
    
    $(document).on('click', '.form-number__control:odd', function(){
		$(this).siblings('span').children('input')[0].stepUp();
		var onePrice = $(this).siblings('input').eq(1).val().replace(',', '');
    	var oldPrice;
    	var onePriceSub = $(this).siblings('input').eq(2).val().replace(',', '');
    	var oldPriceSub;
    	var oldQuantity;
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
    		var check = 0;
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == $(this).siblings('input').eq(0).val()){
	    		check++;
	    	}
	    	if(check != 0){
	    		oldPrice = $('.hidden-div-real').children('div').eq(i).children('.savePrice').val();
	    		oldPrice = oldPrice.replace(',', '');
	    		var resultP = Number(oldPrice) + Number(onePrice);
	    		$(this).parent().parent().parent().find('.selected-item-price').children().text(Number(resultP).toLocaleString('ko-KR') + '원');
	    		$('.hidden-div-real').children('div').eq(i).children('.savePrice').val(Number(resultP).toLocaleString('ko-KR'));
	    		
	    		oldPriceSub = $('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val();
	    		oldPriceSub = oldPriceSub.replace(',', '');
	    		var resultPS = Number(oldPriceSub) + Number(onePriceSub);
	    		$(this).parent().parent().parent().find('.selected-item-discount').text(Number(resultPS).toLocaleString('ko-KR'));
	    		$('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val(Number(resultPS).toLocaleString('ko-KR'));
	    		
	    		oldQuantity = $('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val();
	    		var resultQ = Number(oldQuantity) + 1;
	    		$('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val(resultQ);
	    		break;
	    	}
	    }
    	
    	var realPrice = 0;
	    var realPriceSub = 0;
	    var realQuantity = 0;
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    		realPriceSub += (tmp1 - tmp2);
	    	}
	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    }
	    $('#realPrice').val(realPrice);
    	$('#realPriceSub').val(realPriceSub);
    	$('#realQuantity').val(realQuantity);
    	
    	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + realPrice.toLocaleString('ko-KR') + '원');
    	$('.info-content').eq(2).children().eq(1).text('- ' + realPriceSub.toLocaleString('ko-KR') + '원');
    	
    	if(realPrice < 10000){
    		var remainPrice = 10000 - realPrice;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    			}
    		})
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    	}
    	
    	if(realPrice < 35000){
    		var remainPrice = 35000 - realPrice;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    	}
    });
    
    $(document).on('change', '.form-number__input input', function(){
    	if($(this).val() < 1){
    		$(this).val(1);
    	}
    	var className = $(this).parent().siblings('input').eq(0).val();
    	var Quantity = $(this).val();
    	var price = $(this).parent().siblings('input').eq(1).val() * Quantity;
    	var priceSub = $(this).parent().siblings('input').eq(2).val() * Quantity;
    	
    	// 수량, 가격, 할인 전 가격
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
    		var check = 0;
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == className){
	    		$('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val(Quantity);
	    		$('.hidden-div-real').children('div').eq(i).children('.savePrice').val(price.toLocaleString('ko-KR'));
	    		$('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val(priceSub.toLocaleString('ko-KR'));
	    		
	    		$(this).closest('.selected-item-header__body').find('em').text(price.toLocaleString('ko-KR') + "원");
	    		$(this).closest('.selected-item-header__body').find('.selected-item-discount').text(priceSub.toLocaleString('ko-KR'));
	    		
	    		var realPrice = 0;
	    	    var realPriceSub = 0;
	    	    var realQuantity = 0;
	    	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	    		realPriceSub += (tmp1 - tmp2);
	    	    	}
	    	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    	    }
	    	    $('#realPrice').val(realPrice);
	        	$('#realPriceSub').val(realPriceSub);
	        	$('#realQuantity').val(realQuantity);
	        	
	        	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + realPrice.toLocaleString('ko-KR') + '원');
	        	$('.info-content').eq(2).children().eq(1).text('- ' + realPriceSub.toLocaleString('ko-KR') + '원');
	    		
	        	if(realPrice < 10000){
	        		var remainPrice = 10000 - realPrice;
	        		$.ajax({
	        			url : 'orderMinPrice.do',
	        			type : 'post',
	        			dataType : 'html',
	        			data : {
	        				'remainPrice' : remainPrice
	        			},
	        			success : function(htmlOut){
	        				$('.info-content').eq(0).find('.min').detach();
	        				$('.info-content').eq(0).append(htmlOut);
	        				$('.info-content').eq(0).children().eq(2).val(0);
	        			}
	        		})
	        	}else{
	        		$('.info-content').eq(0).find('.min').detach();
	        		$('.info-content').eq(0).children().eq(2).val(1);
	        	}
	        	
	        	if(realPrice < 35000){
	        		var remainPrice = 35000 - realPrice;
	        		$.ajax({
	        			url : 'orderMinPriceDelivery.do',
	        			type : 'post',
	        			dataType : 'html',
	        			data : {
	        				'remainPrice' : remainPrice
	        			},
	        			success : function(htmlOut){
	        				$('.info-content').eq(1).find('.min').detach();
	        				$('.info-content').eq(1).append(htmlOut);
	        				$('.info-content').eq(1).children().eq(2).val(0);
	        			}
	        		})
	        	}else{
	        		$('.info-content').eq(1).find('.min').detach();
	        		$('.info-content').eq(1).children().eq(2).val(1);
	        	}
	        	
	    		break;
	    	}
    	}
    })

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
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<form name="paging">
						<input type="hidden" name="tagMain01" value="">
						<input type="hidden" name="itemCode01" value="">
						<input type="hidden" name="tagSub01" value="">
					</form>
					<div class="hidden-div-real">
					</div>
					<div class="hidden-div">
					</div>
					<div class="hidden-div2">
					</div>
					<input type="hidden" value="0" id="realQuantity">
					<input type="hidden" value="0" id="realPrice">
					<input type="hidden" value="0" id="realPriceSub">
					<input type="hidden" value="0" id="oldQuantity">
					<input type="hidden" value="0" id="oldPrice">
					<input type="hidden" value="0" id="latelyQuantity">
					<input type="hidden" value="0" id="latelyPrice">
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
					<div class="order-container" style="flew-wrap: wrap;"
						data-v-064d23aa="" data-v-1739428d="">
						<div class="order" data-v-064d23aa="">
							<div class="order-wrap" data-v-064d23aa="">
								<div class="order-type-wrap" data-v-064d23aa="">
									<nav class="nav-tab" data-v-4b8c16c4="" data-v-064d23aa="">
										<div class="nav-tab__wrap" data-v-4b8c16c4="">
											<div class="on" data-v-4b8c16c4="">
												<button type="button" class="general" data-v-4b8c16c4="">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">일반배송 주문</span>
												</button>
											</div>
											<div data-v-4b8c16c4="" class="">
												<button type="button" class="sub" data-v-4b8c16c4="">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">정기배송 주문</span>
												</button>
											</div>
										</div>
									</nav>
								</div>
								<div class="order-delivery-wrap" data-v-064d23aa="">
									<div class="order-delivery-header" data-v-064d23aa="">
										<p class="header-title" data-v-064d23aa="">배송지 선택</p>
										<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_information-green%403x.png"
											alt="배송 설명 버튼" class="delivery-desc-btn" data-v-064d23aa="">
									</div>
									<div class="order-delivery-radio-wrap" data-v-064d23aa="">
										<div class="order-delivery-wrap" data-v-064d23aa=""> <input
												id="delivery-morning" type="radio" name="delivery"
												value="morning" data-v-064d23aa=""><label
												for="delivery-morning" data-v-064d23aa=""> 새벽배송 </label> <input
												id="delivery-parcel" type="radio" name="delivery"
												value="parcel" data-v-064d23aa=""><label
												for="delivery-parcel" data-v-064d23aa=""> 택배배송 </label>
										</div>
									</div>
									<div class="order-address-wrap" data-v-064d23aa="">
										<button type="button" data-v-064d23aa="">
											<span class="row--v-center row--h-between" data-v-064d23aa=""><span
												class="col ta-left" data-v-064d23aa="">서울, 경기, 인천 일부
													새벽배송지 선택</span> <i class="ico" data-v-064d23aa=""><svg
														xmlns="http://www.w3.org/2000/svg" width="24" height="24"
														viewBox="0 0 24 24" aria-labelledby="arrow-right-1"
														role="presentation" class="icon" data-v-064d23aa="">
														<g fill="none" fill-rule="evenodd"> <path
															stroke="currentColor" stroke-linecap="round"
															stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path></g></svg></i></span>
										</button>
									</div>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<div data-v-064d23aa="" class="morning-parcel-desc-text">
										오후 5시 전까지 주문하면 다음 날 새벽에 도착합니다.</div>
								</div>
								<div class="order-selected-item-wrap" data-v-064d23aa="">
									<div data-v-064d23aa="" class="order-selected-item-header">
										<p data-v-064d23aa="" class="header-title">상품 선택</p>
									</div>
									<div data-v-064d23aa="" class="header-description">주문하실
										상품을 선택해 주세요.</div>
									<div class="order-selected-item" data-v-064d23aa="">
										<button data-v-064d23aa="" type="button" class="add">
											<div data-v-064d23aa="">
												<span data-v-064d23aa="">전체 메뉴 보기</span>
												<div data-v-064d23aa="" class="v-spinner"
													style="display: none; left: 50%; position: absolute;">
													<div class="v-clip"
														style="height: 18px; width: 18px; border-width: 2px; border-style: solid; border-color: rgb(201, 238, 222) rgb(201, 238, 222) transparent; border-radius: 100%; background: transparent;"></div>
												</div>
											</div>
										</button>
									</div>
								</div>
								<!---->
								<div class="order-delivery-date-wrap" data-v-064d23aa="">
									<div data-v-064d23aa="" class="order-delivery-date-header">
										<p data-v-064d23aa="" class="header-title">배송일 선택</p>
									</div>
									<div data-v-064d23aa="" class="header-description">상품
										수령날짜를 선택해 주세요.</div>
									<!---->
									<div class="order-delivery-date-body" data-v-064d23aa="">
										<div data-v-7322b8a8="" data-v-064d23aa=""
											class="date-picker-with-icon">
											<span data-v-56ae83be="" data-v-7322b8a8=""
												class="v-date-custom"><input data-v-7322b8a8=""
												data-v-56ae83be="" id="date" placeholder="배송일 선택"
												readonly="readonly" class="date-picker-input">
											<div data-v-7605e1b2="" data-v-56ae83be=""
													class="vc-popover-content-wrapper" style="">
													<!---->
												</div></span>
										</div>
										<!---->
										<!---->
									</div>
									<!---->
								</div>
								<div class="order-result-info-wrap" data-v-064d23aa="">
									<div class="order-result-info-header" data-v-064d23aa="">
										<p class="header-title" data-v-064d23aa="">결제예상금액</p>
									</div>
									<div class="order-result-info-body" data-v-064d23aa="">
										<div class="row--v-center row--h-center order-result-content"
											data-v-064d23aa="">
											<div data-v-064d23aa="">
												<div class="info-content" data-v-064d23aa="">
													<div class="info-content-title" data-v-064d23aa="">상품
														수 / 금액</div>
													<div data-v-064d23aa="">0개 / 0원</div>
													<input type="hidden" value="0">
													<!---->
												</div>
											</div>
											<div data-v-064d23aa="">
												<div class="info-content" data-v-064d23aa="">
													<div class="info-content-title" data-v-064d23aa="">배송횟수
														/ 배송비</div>
													<div data-v-064d23aa="">0회 / 3,500원</div>
													<input type="hidden" value="0">
													<!---->
												</div>
											</div>
											<div data-v-064d23aa="">
												<div class="info-content" data-v-064d23aa="">
													<div class="info-content-title" data-v-064d23aa="" style="">
														할인금액</div>
													<div style="color: rgb(31, 95, 64); font-weight: bold;"
														data-v-064d23aa="">- 0원</div>
														<input type="hidden" value="0">
												</div>
											</div>
											<div class="order-result-info-total" data-v-064d23aa="">
												<div data-v-064d23aa="">
													<b data-v-064d23aa="">총 금액</b>
												</div>
												<div data-v-064d23aa="">
													<em data-v-064d23aa="">0원</em>
												</div>
												<input type="hidden" value="0">
											</div>
										</div>
									</div>
								</div>
								<div class="order-result-payment " data-v-064d23aa="">
									<div class="row--v-center " style="flex-basis: 100%;"
										data-v-064d23aa="">
										<div class="col" data-v-064d23aa="">
											<button type="button" title="" disabled="disabled"
												class="button button--size-large button--disabled"
												style="width: 100%; height: 50px; margin: 0 auto; border-radius: 2px; font-size: 16px; font-weight: 400; background-color: #b8d4c6;"
												data-v-a1c889e0="" data-v-064d23aa="">
												<span class="button__wrap" data-v-a1c889e0=""> 구매하기 </span>
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
<a class="custom-ch-btn" style="display:none">문의하기</a>
</body>
</html>