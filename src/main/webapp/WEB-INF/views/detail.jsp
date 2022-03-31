<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/detail"/>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- for slide -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>   
   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <link rel="stylesheet" href="${path }/style.css">
   <link rel="stylesheet" href="${path }/hmm2.css">
   <link rel="stylesheet" href="${path }/style2.css?ver=6">
   
   
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
    	  
// 헤더 패딩
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
         
// 이미지 슬라이드 아이템 클릭시 상세페이지로 이동         
         $(document).on('click', '.swiper-slide', function(){ 
        	//alert("클릭");
     		var f = document.paging;
     		var code = $(this).children('#itemCode').attr('value');
     		var tag = $(this).children('#tagMain').attr('value');
     		var tagSub =$(this).children('#tagSub').attr('value');
     		f.tagSub01.value = tagSub
     		f.tagMain01.value = tag;
     		f.itemCode01.value = code;
     		f.action="detail.do"; 
     		f.method="post";
     		f.submit();
     	})
         
// 영양 정보 고시 숨기기       
		$('.menu-info-content-wrap').hide();  
     	$(document).on('click','.menu__tab-info-title.menu-info:odd',function(){  
    		//alert("영양 정보 숨기기");
    	    if($("#item_nut_show").css("display") == "none"){   
    	        $('#item_nut_show').show(); 
    	    } else {  
    	        $('#item_nut_show').hide();  
    	    }  
    	}); 
// 상품 정보 고시 숨기기
     	$(document).on('click','.menu__tab-info-title.menu-info:even',function(){  
    		//alert("상품 정보 숨기기");
    	    if($("#item_info_show").css("display") == "none"){   
    	        $('#item_info_show').show(); 
    	    } else {  
    	        $('#item_info_show').hide();  
    	    }  
    	});
// -------------------------------------------------------------------------------------------------------------------   	
// -------------------------------------------------------------------------------------------------------------------   	
// 장바구니 담기
		$(document).on('click','#mobCart',function(){
			//alert("장바구니 클릭");
		// 장바구니 담길것이 있을때와 없을때를 구분.
			if($('.selected-detail-list').children().hasClass('selected-detail-wrap')){
				//alert("있다");
				var itemCode = [], data = {};
				var tagMain = [];
				var price = [];
				var priceSub = [];
				var itemName = [];
				var itemSize = [];
				var itemImage = [];
				var tagSub = [];
				var itemQuantity = [];   
				var htmlOut="";
			// 길이 조절
				var Length = $('.selected-detail-list').children().length;
				if(Length == 2){
					Length = 1;
				}else if(Length == 4){
					Length = 2;
				}

				for(var i = 0; i < Length; i++){
					itemCode[i] = $('.selected-detail-wrap').eq(i).children().eq(0).attr('value')
					tagMain[i] = $('.selected-detail-wrap').eq(i).children().eq(1).attr('value')
					price[i] = $('.selected-detail-wrap'). eq(i).children().eq(2).attr('value')
					priceSub[i] = $('.selected-detail-wrap').eq(i).children().eq(3).attr('value')
					itemName[i] = $('.selected-detail-wrap').eq(i).children().eq(4).attr('value')
					itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
					itemImage[i] = $('.selected-detail-wrap').eq(i).children().eq(6).attr('value')
					tagSub[i] = $('.selected-detail-wrap').eq(i).children().eq(7).attr('value')
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
			    
			    $.ajax({
		 			url : 'detaillLginCheck.do',
		 			success : function(data){
		 				if(data == 1){
		 					$.ajax({ // 장바구니 넣기 확인 모달
		 				    	url : "test.do",
		 				    	type : 'post',
		 				    	dataType : 'html',
		 				    	data : data,
		 				    	success : function(html){
		 				    		$('body').append(html);
		 				    		setTimeout(function() {
		 								$('.swal2-container').detach();
		 							}, 2000);
		 				   
		 				    		
		 				    	}
		 				    }) //ajax 끝
		 				    
		 				    var thisItemImage =  $('.selected-detail-wrap').eq(0).children().eq(6).attr('value');
		 				    var thisItemName = $('.selected-detail-wrap').eq(0).children().eq(4).attr('value')
		 				 	var thisItemSize =  $('.selected-detail-wrap').eq(0).children().eq(5).attr('value')

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
		 							}, 2000);
		 				    		
		 				    	}
		 				    }) // ajax 끝
		 				}else{
		 					$(location).attr("href", "login.do");
		 				}
		 			}
		 		})
		 		
			    
			}else{	// 아무것도 선택안할시 주문할 상품 선택하라고 모달
				$.ajax({
					url : "plzSelect.do",
					success : function(html){
						$('body').append(html);
						
					}
				})// ajax 끝

			}
		})
		
// 장바구니 없을시 나오는 모달 없애기
	$(document).on('click','.swal2-confirm.swal2-styled',function(){
		$('.swal2-container.swal2-center.swal2-backdrop-show').detach();
	})
	
// --------------------------------------------------------------------------------	
// --------------------------------------------------------------------------------	
// 주문하기버튼
	$(document).on('click','#goOrder',function(){
		//alert("주문하기 클릭");
		if($('.selected-detail-list').children().hasClass('selected-detail-wrap')){
			var itemCode = [];
			var tagMain = [];
			var price = [];
			var priceSub = [];
			var itemName = [];
			var itemSize = [];
			var itemImage = [];
			var tagSub = [];
			var itemQuantity = [];   
			var htmlOut="";
			
			// 길이 조절
			var Length = $('.selected-detail-list').children().length;
			if(Length == 2){
				Length = 1;
			}else if(Length == 4){
				Length = 2;
			}
			

			var o = document.order;	
			for(var i = 0; i < Length; i++){
//				alert(i+" 번째 차");			
				itemCode[i] = $('.selected-detail-wrap').eq(i).children().eq(0).attr('value')
				o.orderItemCode[i].value = itemCode[i];		
				tagMain[i] = $('.selected-detail-wrap').eq(i).children().eq(1).attr('value')
				o.orderTagMain[i].value = tagMain[i];				
				price[i] = $('.selected-detail-wrap'). eq(i).children().eq(2).attr('value')
				o.orderItemPrice[i].value = price[i];
				priceSub[i] = $('.selected-detail-wrap').eq(i).children().eq(3).attr('value')
				o.orderItemPriceSub[i].value = priceSub[i];
				itemName[i] = $('.selected-detail-wrap').eq(i).children().eq(4).attr('value')
				o.orderItemName[i].value = itemName[i];
//				itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
				if($('.selected-detail-wrap').eq(i).children().eq(5).attr('value')=="미디움"){
					$('.selected-detail-wrap').eq(i).children().eq(5).val('m');
					itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
				}
				if($('.selected-detail-wrap').eq(i).children().eq(5).attr('value')=="라지"){
					$('.selected-detail-wrap').eq(i).children().eq(5).val('l');
					itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
				}
				o.orderItemSizeSummary[i].value = itemSize[i];
				itemImage[i] = $('.selected-detail-wrap').eq(i).children().eq(6).attr('value')
				o.orderItemImage[i].value = itemImage[i];
				tagSub[i] = $('.selected-detail-wrap').eq(i).children().eq(7).attr('value')
				o.orderItemTagSub[i].value = tagSub[i];
				itemQuantity[i] = Number($('.form-number__input').eq(i).children().val())
				o.orderQuantity [i].value = itemQuantity[i];

			}

			o.action="order.do";
			o.method="post";
			o.submit();			
			
		}else{
			$.ajax({	// 아무것도 선택안할시 주문할 상품 선택하라고 모달
				url : "plzSelect.do",
				success : function(html){
					$('body').append(html);
				}
			})// ajax 끝
		}
		
		
	})
	
	
	

// 리뷰, faq 클릭 이벤트
      $(function(){
          $(document).on('click', '.review-item__head', function(){
	            $(this).toggleClass("border-bottom-desktop-show");
	            $(this).siblings('.review-desktop-toggle').toggleClass("review-hide");
          });
          
          $(document).on('click', '.menu-info-table-opener', function(){
              $(this).toggleClass("border-bottom-desktop-show");
              $(this).siblings('.menu-info-table-content-wrap').toggleClass("review-hide");
           });
       });
// 페이징 처리
		$(document).on('click','.fa.pageNum',function(){
			var pageNum = $(this).children('#PageNumValue').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'paging.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				}
			});
		});
		// 페이징 처리 모바일
		$(document).on('click','.fa.pageNum.Mobile',function(){
			var pageNum = $(this).children('#PageNumValueMobile').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'paging.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				}
			});
		});
		// 왼쪽 클릭
		$(document).on('click','.fa.fa-chevron-left',function(){
			var pageNum = $(this).children('#PageNumValuePrev').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
		
			$.ajax({
				url : 'pagingPrev.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-left').children('#PageNumValuePrev').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
			
					
					$.ajax({
						url : 'bottomPrev.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
		// 왼쪽 클릭 모바일
		$(document).on('click','.fa.fa-chevron-left.Mobile',function(){
			var pageNum = $(this).children('#PageNumValuePrevMobile').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
		
			$.ajax({
				url : 'pagingPrev.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-left.Mobile').children('#PageNumValuePrevMobile').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
			
					
					$.ajax({
						url : 'bottomPrev.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
		// 오른쪽 클릭
		$(document).on('click','.fa.fa-chevron-right',function(){
			var pageNum = $(this).children('#PageNumValueNext').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'pagingNext.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-right').children('#PageNumValueNext').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
										
					$.ajax({
						url : 'bottomNext.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
		// 오른쪽 클릭 모바일
		$(document).on('click','.fa.fa-chevron-right.Mobile',function(){
			var pageNum = $(this).children('#PageNumValueNextMobile').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'pagingNext.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-right.Mobile').children('#PageNumValueNextMobile').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
										
					$.ajax({
						url : 'bottomNext.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
// 드롭 다운
		$(document).on('click','.button.dropdown',function(event){	
			// 해당 페이지의 아이템 코드를 가져옴 ( 전에썻던거 그냥 써봄 )
			var code =$('#mobCart').children('#itemCode').attr('value');			
			var tag = $('#mobCart').children('#tagMain').attr('value');
			var str ="";
			if($('.dropdown-btn').hasClass('dropdown-open')){
				$('ul').remove('.toggle-drop-down');
			}else{
				$.ajax({
					url : 'dropDown.do',
					type : 'post',
					datatype : 'html',
					data : {
						"codeNum" : code ,
						"tagNum"  : tag
					},
					success : function(htmlOut){
						str += "<ul data-v-5b7f52e9='' class='toggle-drop-down'>";
						str += htmlOut;
						str += "</ul>";
						$('.dropdown-btn').append(str);
						
					}
				}); // ajax 끝								
			} //else 끝
			$('.dropdown-btn').toggleClass('dropdown-open');
		}); // 드롭 다운 끝

// 드롭 다운 아이템 클릭
		$(document).on('click','.detail-wrap',function(){
			// 미디움(M) / 라지(L) / 세트일경우 이름을 가져옴
			var size = $(this).children().first().children().first().attr('id');
			// 가격을 가져옴
			var priceM = $(this).children().last().children().last().text();
			// 가격 에서 '원',','을 빼고 가져옴
			priceM = Number(priceM.replace('원', '').replace(',', ''));
			// 판매중인 아이템의 이름을 가져옴.
			var name = $('.menu__name').text();
			var code =$('#mobCart').children('#itemCode').attr('value');			
			var tag = $('#mobCart').children('#tagMain').attr('value');
			var priceM_Sub ="0";
			// 할인 전 가격
			if($(this).children().last().children().length==2){
				priceM_Sub = $(this).children().last().children().first().text();
				priceM_Sub = Number(priceM_Sub.replace('원', '').replace(',', ''));
// 				alert("원 가격 : "+priceM_Sub);
			}
			var image = $('.menu__body').children().first().val();
			var tagSub = $('#tagSub').val();
			

			// 리스트 아이템을 누를시 클래를 가져옴	
			var test = $(this).children().last().children().last().attr('id');
			var testM = $('.1001').val();
 			var testL = $('.1002').val();
			// ajax를 통해 보여줄예정.
			$.ajax({
				url : 'test3.do',
				type : 'post',
				datatype : 'html',
				data :{
					"test" : test,
					"size" : size,
					"price" : priceM,
					"price_sub" : priceM_Sub,
					"name" : name,
					"code" : code,
					"tag" : tag,
					"image" : image,
					"tagSub" : tagSub
				},
				success : function(htmlOut){  // 531행 827행 에 넣어줘야함
//				test = 리스트의 id .. testM/testL = 목록 M/L 의 class
					if(testM ==null && testL ==null){
// 						alert("M / L 둘다 없다");
	 					$('.selected-detail-list').append(htmlOut);					
	 					var price = $('.menu__price-current-price__wrapper').children().first().text();
	 					price = Number(price.slice(0, -1));
//	 					price = price.replace( , , ''); //--> 가격표에 콤마를 ''로 대체하는거 추가해야됨.
	 					price += priceM; 
//	 					price= price.toLocaleString('ko-KR');   --> , 찍기
	 					$('.menu__price-current-price__wrapper').children().text(price+"원");
	 					
					}
					else if(testM != null && testL == null){
					    if( test == '1001'){
					    // 클릭시 미디움이 이미 있을때
// 					    alert("M은 있고 L은 없는데 M을 클릭했다.");
							$('.1001:eq(0)').parent().next().trigger('click');
					    }else{
// 						alert("M은 있고 L은 없는데 L을 클릭했다.");
		 					$('.selected-detail-list').append(htmlOut);				
		 					var price = $('.menu__price-current-price__wrapper').children().first().text();
		 					price = Number(price.slice(0, -1));
//		 					price = price.replace( , , ''); //--> 가격표에 콤마를 ''로 대체하는거 추가해야됨.
		 					price += priceM;  
//		 					price= price.toLocaleString('ko-KR');   --> , 찍기
		 					$('.menu__price-current-price__wrapper').children().text(price+"원");
					    }
					}
					else if(testM == null && testL !=null){
					    if( test == '1001'){
// 							alert("L는 있고 M은없는데 M을 클릭했다.");
		 					$('.selected-detail-list').append(htmlOut);
		 					var price = $('.menu__price-current-price__wrapper').children().first().text();
		 					price = Number(price.slice(0, -1));
//		 					price = price.replace( , , ''); //--> 가격표에 콤마를 ''로 대체하는거 추가해야됨.
		 					price += priceM;  
//		 					price= price.toLocaleString('ko-KR');   --> , 찍기
		 					$('.menu__price-current-price__wrapper').children().text(price+"원");
		 					
					    }else{
// 							alert("L는 있고 L를 클릭했다");
							$('.1002:eq(0)').parent().next().trigger('click');

					    }
					}
					else if(testM != null && testL !=null){
					    if( test == '1001'){
// 					    	alert("둘다있는데 M을 클릭");
					    	$('.1001:eq(0)').parent().next().trigger('click');
					    	 
					    }else{
// 					    	alert("둘다있는데 L을 클릭")
					    	$('.1002:eq(0)').parent().next().trigger('click');
					    	
					    }
					} 				
					
				} // success 끝	
			}); // ajax 끝

			
			// 클릭시 드롭 다운 아이템 사라짐
			$('ul').detach('.toggle-drop-down');						
			$('.dropdown-btn').toggleClass('dropdown-open');
			
		}); // 드롭 다운 아이템 끝
// 이페이지의 이름값을 얻어서 현재 단품은 미디움/라지 로 +.-를 관리하지만
// 셋트,구독은 이름값으로 ( 위치가 단품에서 미디움 고정적으로 찍혀있는 자리에 이름값이 들어갈것임 ) 구분을하자
// ex if(val2 =='미디움 ' or val3 == '이름값')
		//  - 버튼 처리
			$(document).on('click','#minus-button',function(){
				// val값을 가져와서 val값 -후 val값 저장
				var val = Number($(this).next().children().val());
				var val2 = $(this).next().children().attr('class');
				var price = Number($(this).next().children().attr('id'));
				var strPrice = $('.menu__price-current-price__wrapper:eq(0)').children().text();
				var realPrice = Number(strPrice.replace('원', '').replace(',', ''));

				if(val >1){
					if(val2== 1001){
						val -=1;
						$('.1001:eq(0)').val(val);
						$('.1001:eq(1)').val(val);
						// 합산 가격 넣기.
//						price = Number(price.slice(0, -1));
//						price = price.replace( , , ''); //--> 가격표에 콤마를 ''로 대체하는거 추가해야됨.
						realPrice -= price;  
						$('.menu__price-current-price__wrapper').children().text(realPrice+"원");
						
					}else{
						val -=1;
						$('.1002:eq(0)').val(val);
						$('.1002:eq(1)').val(val);
						// 합산 가격 넣기.
//						price = Number(price.slice(0, -1));
//						price = price.replace( , , ''); //--> 가격표에 콤마를 ''로 대체하는거 추가해야됨.
						realPrice -= price;  
						$('.menu__price-current-price__wrapper').children().text(realPrice+"원");
					}
					
				}else{
					val = 1;
				}

 			});	 // - 버튼 처리 끝	

		//  + 버튼 처리		
			$(document).on('click','#plus-button',function(){
				// val값을 가져와서 val값 +후 val값 저장  
				var val = Number($(this).prev().children().val());
				var val2 = $(this).prev().children().attr('class');
				var price = Number($(this).prev().children().attr('id'));
				var strPrice = $('.menu__price-current-price__wrapper:eq(0)').children().text();
				var realPrice = Number(strPrice.replace('원', '').replace(',', ''));

				if(val2== 1001){
					val +=1;
					$('.1001:eq(0)').val(val);
					$('.1001:eq(1)').val(val);
	
				}else{
					val +=1;
					$('.1002:eq(0)').val(val);
					$('.1002:eq(1)').val(val);
				}

				// 합산 가격 넣기.
				// .menu__price-current-price__wrapper 가 2개가있어 둘중 처음꺼 하나를 받고  first()지우고 모두에 저장하겠다..
//				var price = $('.menu__price-current-price__wrapper').children().first().text();
//				price = Number(price.slice(0, -1));
//				price = price.replace( , , ''); //--> 가격표에 콤마를 ''로 대체하는거 추가해야됨.
				realPrice += price;  
				$('.menu__price-current-price__wrapper').children().text(realPrice+"원");
				
			});	// + 버튼 처리 끝
			
// 상품 이미지 더보기
		$(document).on('click','.more-btn',function(){
			$(this).prev().children().toggleClass('img-wrapper');
					
		});
			
// 상세 명세서 이미지 클릭시 삭제
		$(document).on('click','.selected-detail__close',function(){
			//alert("삭제");
			var val = Number($(this).next().next().children().children().eq(1).children().val());
				// 현재개수
 			var val2 = $(this).next().next().children().children().eq(1).children().attr('class'); 
				// 삭제버튼의 구분값( M or L )
			var strPrice = $('.menu__price-current-price__wrapper:eq(0)').children().text();
				// 현재 가격
			var numPrice = Number(strPrice.replace('원', '').replace(',', ''));
				// 현재 가격 숫자형


			if(val2==1001){ //미디움 삭제
				var price = Number($('.1001:eq(0)').attr('id'));
				// 개당 가격
				numPrice -= price*val;
				//alert("numPrice : " + numPrice);

				// 아이템 가격
				$('.1001:eq(0)').parent().parent().parent().parent().parent().detach();
				$('.1001:eq(0)').parent().parent().parent().parent().parent().detach();
				
				$('.menu__price-current-price__wrapper').children().text(numPrice+"원");
				
			}else{ // 라지 삭제
				var price = Number($('.1002:eq(0)').attr('id'));
				// 개당 가격
				numPrice -= price*val;
				//alert("numPrice : " + numPrice);
				
				$('.1002:eq(0)').parent().parent().parent().parent().parent().detach();
				$('.1002:eq(0)').parent().parent().parent().parent().parent().detach();
				
				$('.menu__price-current-price__wrapper').children().text(numPrice+"원");
				
			}					
		});
		
// nav바 클릭시 스크롤이동
		$(document).on('click','.menu-tab-btn-wrap',function(){
			var text = $(this).children().children().text();
			if(text =="상품정보"){
				var location = document.querySelector(".menu-description-container").offsetTop;
				window.scrollTo({top:location-150, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text =="상세정보"){  
				var location = document.querySelector("#product-info").offsetTop;
				window.scrollTo({top:location-180, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text == "FAQ"){
				var location = document.querySelector("#faq").offsetTop;
				window.scrollTo({top:location-220, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text == "고객후기"){
				var location = document.querySelector("#ClientReview").offsetTop;
				window.scrollTo({top:location-220, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}
		})
		
// 스크롤 이동시 nav 바 변경
	   $(document).ready(function(){
			var menu =$('.menu-tab-btn-wrap');
			var contents = $('.navBar');
			$(window).scroll(function(){
				var scltop = $(window).scrollTop();
				$.each(contents, function(idx,item){
					var target = contents.eq(idx);
					var i = target.index();
					var targetTop = target.offset().top;
					if (targetTop-265 <= scltop) {
			  			menu.removeClass('on');
			  			menu.eq(idx).addClass('on');
			  		}
			  		if (!(600 <= scltop)) {
			  			menu.removeClass('on');
			  		}
				})		
			})
		});

// 별점 찍기
		$(document).ready(function(){
			var starCount = $('.review-count').attr('id');
			//var star = $("<img src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png'>");
			var halfStart = starCount.substring(2);
			
			for(var i=1; i<starCount; i++){
				$("<img data-v-32a18372 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png'>").insertAfter('#front');
				$("<img data-v-f8b893b0 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png' class='review-stars-star'>").insertAfter('#front2');
		
			} // 별 찍기
			if(halfStart ==0){
				$("<img data-v-32a18372 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png'>").insertAfter('#front');
				$("<img data-v-f8b893b0 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png' class='review-stars-star'>").insertAfter('#front2');
			}
			if(halfStart > 2){
				$("<img data-v-32a18372 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(half).png'>").insertBefore('#rear');
				$("<img data-v-f8b893b0 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(half).png' class='review-stars-star'>").insertBefore('#rear2');
			}
		
		})
		
		// 이미지 버튼 (이미지 크게 보이기)
		$(document).on('click', '.review-item__photo', function(){
			var image = $(this).siblings('input').val();
			
			$.ajax({
				url : 'detailReviewImageModal.do',
				dataType : 'html',
				type : 'post',
				data : {
					'image' : image
				},
				success : function(htmlOut){
					$('html').attr('class', 'mode-popup');
					$('.menu-review').append(htmlOut);
				}
			})
		})
		
		// 커진 이미지 클릭시 닫기
		$(document).on('click', '.menu-review .modal', function(){
			$(this).detach();
			$('html').attr('class', '');
		})
		
		
     }); //function 끝
  

    </script>

<!--     for slide   -->
    <style type="text/css">

	.swiper-container {
		height:420px;
	
	}
	.swiper-slide {
		text-align:center;
		display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
		align-items:center; /* 위아래 기준 중앙정렬 */
		justify-content:center; /* 좌우 기준 중앙정렬 */
	}
	.swiper-slide img {
		box-shadow:0 0 5px #555;
		max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
		/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
	}

	</style>
	
    <title>Saladit!</title>
</head>
<body>
	<div id="__nuxt">
	<div id="__layout">
	<main class="viewport" data-v-67c7ff33="">
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
<!--                form태그 -->
<!--                form태그 -->
<!--                form태그 -->
			 	<form name="paging">
					<input type="hidden" name="tagMain01" value="">
					<input type="hidden" name="itemCode01" value="">
					<input type="hidden" name="tagSub01" value="">
				</form>
				<form name="order">
<!-- 					이렇게 두개씩주고 만약 M/L 둘다가면 그냥쓰고 한개만쓰면 컨트롤러에서 if문을 돌려 ""이면 1개만 받게끔하자... -->		
					<input type="hidden" name="orderItemCode" value="" id="a">
					<input type="hidden" name="orderItemCode" value="0" >
					<input type="hidden" name="orderTagMain" value=""  >
					<input type="hidden" name="orderTagMain" value="0"  >								
					<input type="hidden" name="orderItemPrice"  value="" >
					<input type="hidden" name="orderItemPrice"  value="0" >				
					<input type="hidden" name="orderItemPriceSub" value="">
					<input type="hidden" name="orderItemPriceSub" value="0">
					<input type="hidden" name="orderItemName" value="" >
					<input type="hidden" name="orderItemName" value="0" >
					<input type="hidden" name="orderItemSizeSummary" value=""  id="a">
					<input type="hidden" name="orderItemSizeSummary" value="0" id="b">
					<input type="hidden" name="orderItemImage" value="" >
					<input type="hidden" name="orderItemImage" value="0" >
					<input type="hidden" name="orderItemTagSub" value="" >
					<input type="hidden" name="orderItemTagSub" value="0" >
					<input type="hidden" name="orderQuantity"  value="">
					<input type="hidden" name="orderQuantity"  value="0">

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
					<!---->
					<!---->
					<!---->
					<!---->
				</header>
    <div id="container">
        <div id="home">
            <!--위에 container에 padding-top:182px 주는 이유:
            헤더가 스크롤에 따라 바뀌면서 그 아래 container가 스크롤을 올리면 잘 안보임-->
            <div class="menu__container">
                <article class="menu">
                    <div id="menu__head" class="menu__head">
                        <figure class="menu__image">
                            <div class="menu-badge">
                            </div>
                                <img src="${detail.item_image }" alt="상품 이미지" >
                        </figure>
                        <div data-v-32a18372 class="menu__body" >
                        	<input type="hidden" value=${detail.item_image }>
                            <header data-v-32a18372 class="menu__header">
                                <h2 data-v-32a18372 class="menu__name">${detail.item_name }</h2>
                                <div data-v-32a18372 class="menu__summary">${detail.item_summary }</div>
                                <div data-v-32a18372 class="review">
                                    <div data-v-32a18372 class="row--v-center review-wrap">
                                    
                                    
                                        <div data-v-32a18372 class="review-stars">
											<input type="hidden" id="front"></input>
											<input type="hidden" id="rear"></input>
                                        </div>
                                        
                                        
                                        <div>
                                            <span class="review-count" id ="${avgCount.starAvg }">
                                                ${avgCount.starAvg }(후기 ${avgCount.reviewCount})
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
	 <!--  여기가 버튼 -->                                 <div data-v-2706028c class="dropdown-btn-wrap">
	                                                    <div data-v-5b7f52e9 data-v-2706028c>
	                                                        <div data-v-5b7f52e9 class="dropdown-btn">
	                                                            <div data-v-5b7f52e9 class="button dropdown">
	                                                                <div data-v-5b7f52e9 class="dropdown-content">
	                                                                    <span data-v-5b7f52e9>선택</span>
	                                                                </div>
	                                                                <div data-v-5b7f52e9 class="dropdown-icon">
	                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="dropdown-icon">
	                                                                </div>
	                                                            </div>
	<!--  클릭시 나올 선택 드롭다운은 selectitem.jsp 로 옮김 -->
	 
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </li>
	                                            <!--li class="menu-option" 없애봄 -->
	                                        </ul>
											 <ul class="selected-detail-list" data-v-2706028c="" id="aaa">
	<!--  선택된 아이템 보여주는 곳 -->
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
											<input type="hidden" value="${tagSub}" id="tagSub">
                                            <span data-v-a1c889e0 class="button__wrap">장바구니 담기</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button" id="goOrder">
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
                                <img data-v-3ebe8eb0 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_like.png"  class="reco-title-img">
                                <h2 data-v-3ebe8eb0>다른 고객들이 함께 본 상품</h2>
                            </div>
                            <nav data-v-3ebe8eb0>
                                <!--이 nav 태그 뭐에 쓰이는건 모르겠어서 생략..-->
                            </nav>
                        </header>
                   <!--  -->
                   <!--  -->
                   <!--  -->
                   <!--다른 고객들이 함께 본 상품-->
						<div class="swiper-container">
							<div class="swiper-wrapper">
	
								<c:forEach var="item" items="${random }">
									<div class="swiper-slide">
										<input type="hidden" value="${item.itemCode }" id="itemCode">
										<input type="hidden" value="${item.tagMain }" id="tagMain">
										<input type="hidden" value="${tagSub}" id="tagSub">
										<ul>
											<li data-v-4c9a9e82="" class="col-6 col--lg-3">
												<article
													data-v-15082832="" data-v-4c9a9e82=""
													class="item for-loop-cloned-item-244">

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
									</ul>
								</div>
							</c:forEach>

						</div>
					
						<!-- 네비게이션 -->
						<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
						<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
					
						<!-- 페이징 -->
						<div class="swiper-pagination"></div>
					</div>   
					<!--  -->             
					<!--  -->             
					<!--  -->                        
                    </article>
                    <div data-v-32a18372 class="menu__tab">
                        <nav data-v-61e19c34 data-v-32a18372 class="menu-tab unit">
                            <div data-v-61e19c34 class="menu-tab-btn-wrap">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>상품정보</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap on">
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
                    <div data-v-32a18372 class="menu-description-container navBar">
                        <div data-v-32a18372 class="menu-description">
                            <div data-v-32a18372 class="menu-description-left">
                                <div data-v-32a18372 id="menu-detail" class="menu__tab-info">
                                    <div data-v-79f00ef9 data-v-32a18372 class="menu-info">
                                        <div data-v-79f00ef9 class="detail-wrapper">
                                            <div data-v-79f00ef9 id="bundle-detail" class="detail">
                                                <div data-v-79f00ef9 class="img-wrapper">
                                                <c:forEach var="showImage" items="${showImage }">
                                                    <div data-v-79f00ef9 id>
                                                        <img data-v-79f00ef9 src="${showImage }" class="img-fade">
                                                    </div>
                                                </c:forEach>
                                        
                                                    
                                                    <div data-v-79f00ef9 class="shadow"></div>
                                                </div>
                                            </div>
                                            <div data-v-79f00ef9 class="more-btn">
                                                <span data-v-79f00ef9 class="more-btn-text">상품 정보 더보기</span>
                                                <img data-v-79f00ef9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down(green).png"  class="more-btn-arrow">
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
                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="dropdown-icon">
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
                                        <ul data-v-2706028c class="selected-detail-list isDesktop" id='abcd'>
  <!--  여기에 추가되어야함  -->                                      
                                        
                                        
                                        
                                        </ul>
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
												<input type="hidden" value="${tagSub}" id="tagSub">
                                            <span data-v-a1c889e0 class="button__wrap">장바구니 담기</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button" style="height: 52px;" id="goOrder">
                                            <span data-v-a1c889e0 class="button__wrap">주문하기</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-v-32a18372 id="product-info" class="navBar">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372 id="info">상품 정보 고시</span>
<!--                            <div data-v-32a18372 class="info-title-img" > -->
                                	<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" style="width:25px; height:25px;">
<!--                            </div> -->
                            </h3>
						<!-- <div>~~~ 생겨야됨. -->
							<div data-v-32a18372="" class="menu-info-content-wrap" id="item_info_show">
								<section data-v-32a18372="" class="menu-info-content-header">
									<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png"
										alt="상품정보 고시 닫기 버튼" class="content-header-close">
									<h3 data-v-32a18372="" class="content-header-title">상품 정보 고시</h3>
								</section>
								<section data-v-32a18372="" class="menu-info-content-body">

									<c:if test="${detail.item_tag_main ne 100 && detail.item_tag_main ne 600 }">
										<c:forEach var="detailInfo" items="${detailInfo }">
			                      			${detailInfo }
			                      		</c:forEach>
		                      		</c:if>
		                      		<c:if test="${detail.item_tag_main eq 100 || detail.item_tag_main eq 600 }">
		                      			<c:forEach var="detailInfo2" items="${detailInfo2}">
		                      				${detailInfo2}
		                      			</c:forEach>
		                      		</c:if>
	                      		</section>
							</div>
						<!-- </div> -->
                        </div>
                        <div data-v-32a18372 id="nutrition-info">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372 id="nut">영양 정보 고시</span>
<!--                                 <div data-v-32a18372 class="info-title-img"></div> -->
								<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" style="width:25px; height:25px;">
                            </h3>
                            
                         <!--<div>~~~ 생겨야됨.  --> 
	                        <div data-v-32a18372="" class="menu-info-content-wrap" id="item_nut_show">
								<section data-v-32a18372="" class="menu-info-content-header">
									<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png"
										alt="영양 정보 고시 닫기 버튼" class="content-header-close">
									<h3 data-v-32a18372="" class="content-header-title">영양 정보
										고시</h3>
								</section>
								
								<section data-v-32a18372="" class="menu-info-content-body">
									<c:if test="${detail.item_tag_main ne 100 && detail.item_tag_main ne 600 }">
										<c:forEach var="itemNut" items="${itemNut}">
		                      				${itemNut}
		                      			</c:forEach>
		                      		</c:if>
		                      		<c:if test="${detail.item_tag_main eq 100 || detail.item_tag_main eq 600 }">
		                      			<c:forEach var="detailNut" items="${detailNut}">
		                      				${detailNut}
		                      			</c:forEach>
		                      		</c:if>
	                      		</section>
	                        </div>
                        <!-- <div>-->  
                        
                        </div>
                        <div data-v-32a18372 id="faq" class="menu__tab-info tab_menu_detail navBar">
                            <p data-v-32a18372 class="menu__tab-info-title faq">FAQ</p>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[결제 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
								<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[주문단계 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[취소 및 환불 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc class="menu-info-table-content-wrap review-hide">
                                    <div data-v-e3f957fc class="answer-wrapper">
                                       <div data-v-e3f957fc class="answer-column left">
                                          <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"  class="menu-info-table-img answer">
                                       </div>
                                       <div data-v-e3f957fc class="answer-column right">
                                          <div data-v-e3f957fc class="menu-info-table-content-description">▶ 일반상품 취소 가능 시점<br>
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[배송 안내]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description"> ▶ 새벽배송 <br>
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[기타 사항(자주 묻는 질문)]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
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
                        <div data-v-f8b893b0="" data-v-32a18372="" class="menu-review">
<!--                             <section data-v-f8b893b0="" class="menu-review__album"> -->
<!--                                 <h3 data-v-f8b893b0="" class="menu-review__album-title"> -->
<!--                                   고객 후기 사진 (13) -->
<!--                                 </h3> -->
<!--                                 <div data-v-f8b893b0="" class="images"> -->
<!--                                   <div data-v-f8b893b0=""> -->
<!--                                      <span id="carousel_prev_nj8u0ztnu9d" style=""></span> -->
<!--                                      <div id="carousel_ola7225lcr9" -->
<!--                                         class="owl-carousel owl-theme owl-loaded"> -->
<!--                                         <div class="owl-stage-outer"> -->
<!--                                            <div class="owl-stage" -->
<!--                                               style="transform: translate3d(-1224px, 0px, 0px); transition: all 0s ease 0s; width: 5100px;"> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="7" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="8" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="9" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="10" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="11" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="12" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="0" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="1" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="2" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="3" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="4" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="5" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="6" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44194_20220120145825&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="7" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="8" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="9" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="10" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="11" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="12" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="0" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="1" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="2" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="3" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="4" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="5" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                            </div> -->
<!--                                         </div> -->
<!--                                         <div class="owl-nav"> -->
<!--                                            <div class="owl-prev">next</div> -->
<!--                                            <div class="owl-next">prev</div> -->
<!--                                         </div> -->
<!--                                         <div class="owl-dots disabled"></div> -->
<!--                                      </div> -->
<!--                                      <span id="carousel_next_tc5wlekmakl"></span> -->
<!--                                   </div> -->
<!--                                </div> -->
<!--                             </section> -->
                            <section data-v-f8b893b0="" class="menu-review__rating">
                               <div data-v-f8b893b0="" class="wrap">
                                  <h3 data-v-f8b893b0="" id="ClientReview" class="navBar">고객 후기</h3>
                                  <div data-v-f8b893b0=""
                                     class="row--v-center review-box-wrapper">
                                     <div data-v-f8b893b0="" class="review-stars">
                                        <input type="hidden" id="front2"></input>
										<input type="hidden" id="rear2"></input>
                                     </div>
                                     <div data-v-f8b893b0="" class="review-rating-counts">
                                        ${avgCount.starAvg }(후기 ${avgCount.reviewCount})</div>
                                  </div>
                               </div>
                            </section>
                            <section data-v-f8b893b0="" class="menu-review__index">
                            	<input type="hidden" value="${detail.item_code}" id="ItemCodeValueTest" >
                            	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueTest" >
                               <ul data-v-f8b893b0="" class="johntest">
                               
                               
	                               	  <c:forEach var="board" items="${boardList }" varStatus="i">
		                               	  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
		                                     <div data-v-22105fb8="" class="review-item__head">
		                                        <div data-v-22105fb8="" class="head-rating">
		                                           <img data-v-22105fb8=""
		                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png" 
		                                              class="rating-img">
		                                           <div data-v-22105fb8="" class="rating-count">${board.star }</div>
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-summary">
		                                           <div data-v-22105fb8="" class="head-summary-left">
		                                           <c:if test="${!empty board.image }">
		                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_pics.png"
		                                                  class="summary-photo">
													</c:if>
		                                              <div data-v-22105fb8="" class="summary-text">${board.content }</div>
		                                           </div>
		                                           <c:forEach var="reviewReply" items="${reviewReply }">
			                                           <c:if test="${reviewReply.seq == board.seq}">
			                                           		<img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_reply%402x.png" alt="관리자 댓글" class="summary-answer">
		                                           		</c:if>
		                                           </c:forEach>
		                                           <!---->
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-text">
		                                           <div data-v-22105fb8="" class="text-name">${board.user_name }</div>
		                                           <div data-v-22105fb8="" class="text-date">${fn:substring(board.write_date, 0, 10)}</div>
		                                        </div>
		                                     </div>
		                                     <div data-v-22105fb8=""
		                                        class="review-desktop-toggle review-hide">
		                                        <div data-v-22105fb8="" class="review-item__body">
		                                           <div data-v-22105fb8="" class="review-item__comment">${board.content }</div>
		                                           <div data-v-22105fb8="" class="review-item__photos">
		                                           
			                                           <c:forEach var="reviewImage" items="${reviewImage[i.index] }" varStatus="j">
				                                           <c:if test="${reviewImage != '0' }">
				                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
				                                                 <div data-v-22105fb8="" class="review-item__photo"
				                                                    style="background-image: url(&quot;${reviewImage}&quot;);"></div>
				                                                 <input type="hidden" value="${reviewImage }">
				                                              </div>
				                                           </c:if>
		                                              </c:forEach>
													</div>
		                                        </div>
		                                        <c:forEach var="reviewReply" items="${reviewReply }">
				                                           <c:if test="${reviewReply.seq == board.seq}">
																<div data-v-22105fb8="" class="review-item__reply">
																	<p data-v-22105fb8="" class="review-item__admin-name">
																		샐러딧_운영자</p>
																	<p data-v-22105fb8=""
																		class="review-item__admin-comment">안녕하세요.
																		샐러딧입니다 (୨୧ ❛ᴗ❛)✧ 소중한 시간에 이렇게 후기까지 남겨 주셔서 정말 감사합니다.
		
																		${reviewReply.replycontents }</p>
																	<p data-v-22105fb8="" class="review-item__date">
																		${reviewReply.replydate }</p>
																</div>
															</c:if>
														</c:forEach>
		                                        <!---->
		                                     </div>
		                                  </li>
	                                  </c:forEach>
                                     <!-- 댓글 내용 열 시 추가 되어야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
                                     <!-- 댓글 내용 열 시 사라져야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->
                                     <!-- 댓글 내용 닫을 시 사라져야 할 클래스 이름 :  review-item__head 부분에 border-bottom-desktop-show -->
                                     <!-- 댓글 내용 닫을 시 추가 되어야 할 클래스 이름 : review-desktop-toggle 부분에 review-hide -->
                                   
                               </ul>
                               <div data-v-20ad18c6="" data-v-f8b893b0=""
                                  class="nav-paginate-wrap">
                                  <div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
                                     <nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
                                        <ul class="btn-group pagination">
										     <c:if test="${pageMaker.prev }">
											    <li>
											    	<button>
											        	<i class="fa fa-chevron-left Mobile">
											        		<input type="hidden" value="${pageMaker.startPage-1}" id="PageNumValuePrevMobile" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValuePrevMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValuePrevMobile" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left_s.png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
													<button >
											        	<i class="fa pageNum Mobile">
												        	<input type="hidden" value="${pageNum}" id="PageNumValueMobile" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValueMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueMobile" >
												        	${pageNum }
											        	 </i> 
											   		</button>
											    </li>
											    &nbsp;&nbsp;&nbsp;
										    </c:forEach>
										     <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
													<button>
											        	<i class="fa fa-chevron-right Mobile">
											        		<input type="hidden" value="${pageMaker.endPage + 1}" id="PageNumValueNextMobile" >
											        		<input type="hidden" value="${detail.item_code}" id="ItemCodeValueNextMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueNextMobile" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										</ul>
                                     </nav>
                                  </div>
                                  <div data-v-20ad18c6 class="nav-paginate-wrap__desktop">
                                     <nav data-v-43f58a9c data-v-20ad18c6 class="nav-paginate">
<!--                                         <a data-v-43f58a9c href="#" class="nav-paginate__dir nav-paginate-dir-prev" style="opacity: 0.2;"> -->
<!--                                             <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-left%402x.png"  class="nav-arrow arrow-left"> -->
<!--                                         </a> -->
										<ul class="btn-group pagination">
										    <c:if test="${pageMaker.prev }">
											    <li>
											    	<button style="cursor: pointer">
											        	<i class="fa fa-chevron-left">
											        		<input type="hidden" value="${pageMaker.startPage-1}" id="PageNumValuePrev" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValuePrev" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValuePrev" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left_s.png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
													<button style="cursor: pointer" >
											        	<i class="fa pageNum">
												        	<input type="hidden" value="${pageNum}" id="PageNumValue" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValue" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValue" >
												        	${pageNum }
											        	 </i> 
											   		</button>
											    </li>
											    &nbsp;&nbsp;&nbsp;
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
													<button style="cursor: pointer">
											        	<i class="fa fa-chevron-right">
											        		<input type="hidden" value="${pageMaker.endPage + 1}" id="PageNumValueNext" >
											        		<input type="hidden" value="${detail.item_code}" id="ItemCodeValueNext" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueNext" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										</ul>
<!--                                         <a data-v-43f58a9c="" href="#" class="nav-paginate__dir nav-paginate-dir-next" style="opacity: 1;"> -->
<!--                                            <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-right%402x.png"  class="nav-arrow arrow-right"> -->
<!--                                         </a> -->
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
         
    </div>
    </main>
    </div>
    </div>
    	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
// 슬라이드 이미지 용
	new Swiper('.swiper-container', {
	
		slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	
		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,
	
		loop : true, // 무한 반복
	
		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
	</script>
    
</body>
</html>