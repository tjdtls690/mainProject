<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/myMemberModify"/>
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
	
		$(function(){
			// 값을 넘길 변수들
			var realGender = '';
			
			
			
			// 생년월일 초기값
			var arrTmp = $('#birthdayTmp').val().split('-');
			
			if(arrTmp != ''){
				for(var i = 0; i < $('#f_birth1').children('option').length; i++){
					if($('#f_birth1').children('option').eq(i).val() == arrTmp[0]){
						$('#f_birth1').children('option').eq(0).removeAttr('selected');
						$('#f_birth1').children('option').eq(i).attr('selected', 'selected');
					}
				}
			}
			
			for(var i = 0; i < $('#f_birth2').children('option').length; i++){
				if($('#f_birth2').children('option').eq(i).val() == arrTmp[1]){
					$('#f_birth2').children('option').eq(0).removeAttr('selected');
					$('#f_birth2').children('option').eq(i).attr('selected', 'selected');
				}
			}
			
			for(var i = 0; i < $('#f_birth3').children('option').length; i++){
				if($('#f_birth3').children('option').eq(i).val() == arrTmp[2]){
					$('#f_birth3').children('option').eq(0).removeAttr('selected');
					$('#f_birth3').children('option').eq(i).attr('selected', 'selected');
				}
			}
			
			// 성별 초기값
			var gender = $('#genderTmp').val();
			if(gender == '여자'){
				$('.form-radio').eq(0).children('span').trigger('click');
				realGender = $('.form-radio').eq(0).next().text();
			}else if(gender == '남자'){
				$('.form-radio').eq(1).children('span').trigger('click');
				realGender = $('.form-radio').eq(1).next().text();
			}else{
				$('.form-radio').eq(2).children('span').trigger('click');
				realGender = $('.form-radio').eq(2).next().text();
			}
			$('html').scrollTop(0);
			
			
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
		    
		    
		    
		    
		    // 성별 선택 시 (전역변수 : realGender)
		    $(document).on('click', '.form-radio input', function(){
		    	$(this).closest('.row--v-center').children('input').val(1);
	    		realGender = $(this).parent().siblings('span').text();
		    	for(var i = 0; i < $(this).closest('.row--v-center').siblings('.row--v-center').length; i++){
		    		$(this).closest('.row--v-center').siblings('.row--v-center').eq(i).find('input').eq(1).val(0);	
		    	}
		    });
		    
		    
	    	// 비밀번호 변경 버튼 누를 시
	    	$(document).on('click', '.password button', function(){
	    		$.ajax({
	    			url : 'myMemberModifyPasswordModal.do',
	    			dataType : 'html',
	    			success : function(htmlOut){
	    				$('.mypage-layout__body').append(htmlOut);
	    				$('html').attr('class', 'mode-popup');
	    			}
	    		})
	    	})
	    	
	    	
	    	// 비밀번호 변경 모달창 안의 비밀번호 변경 완료 버튼
	    	$(document).on('click', '.change-password__nav button', function(){
	    		var currentPassword = $('#pw1').val();
	    		var changePassword1 = $('#pw2').val();
	    		var changePassword2 = $('#pw3').val();
	    		
	    		if(currentPassword.length == 0){
	    			alert('기존 비밀번호를 입력해 주세요.');
	    			return false;
	    		}else if(currentPassword.length < 8){
	    			alert('기존 비밀번호를 8자이상 입력해주세요.');
	    			return false;
	    		}else if(changePassword1.length < 8){
	    			alert('새 비밀번호를 8자이상 입력해주세요.');
	    			return false;
	    		}else if(changePassword2.length < 8){
	    			alert('새 비밀번호를 다시한번 8자이상 입력해주세요.');
	    			return false;
	    		}
	    		
	    		$.ajax({
	    			url : 'myMemberModifyCurrentPasswordCheckModal.do',
	    			type : 'post',
	    			data : {
	    				'currentPassword' : currentPassword
	    			},
	    			success : function(data){
	    				if(data == 0){
	    					alert('인증정보를 다시 확인해주세요.');
	    				}else{
	    					if(changePassword1 != changePassword2){
	    						alert('비밀번호 확인이 맞지 않습니다.');
	    					}else{
	    						$.ajax({
	    							url : 'myMemberModifyUpdatePasswordModal.do',
	    							type : 'post',
	    							data : {
	    								'changePassword1' : changePassword1
	    							},
	    							success : function(data){
	    								alert('비밀번호가 수정되었습니다.');
	    								$('html').attr('class', '');
	    								$(window).scrollTop(200);
	    								$('.modal').attr('class', 'modal modal-leave-active modal-leave-to');
	    								setTimeout(function() {
	    									$('.modal').detach();
	    								}, 400);
	    							}
	    						})
	    					}
	    				}
	    			}
	    		})
	    	})
	    	
	    	
	    	// 패스워드 변경 모달창 엑스 버튼
	    	$(document).on('click', '.change-password__header button', function(){
	    		$('html').attr('class', '');
	    		$(window).scrollTop(200);
				$('.modal').attr('class', 'modal modal-leave-active modal-leave-to');
				setTimeout(function() {
					$('.modal').detach();
				}, 400);
	    	})
	    	
	    	
	    	// 이름 영문, 한글만 가능
	    	$('#f_name').keyup(function(){
				var check_num = /[0-9]/; // 숫자 
				var check_eng = /[a-zA-Z]/; // 문자 
				var check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자 
				var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
				var nameCheck = $('#f_name').val();
				
				if( check_num.test(nameCheck) || check_spc.test(nameCheck) ) {
					$('.form-field.name').eq(0).children('.validation.error').detach();
					$('.form-field.name').eq(0).append('<p data-v-5781a129="" class="validation error">이름은 한글/영문만 입력 가능합니다.</p>')
					$('#nameCheck').val(-1);
					return false; 
				}
		
				var name = $('#f_name').val().length;
				$('.form-field.name').eq(0).children('.validation').detach();
				if(name > 0){
					$('#nameCheck').val(1);
				}else{
					$('#nameCheck').val(0);
				}
			});
	    	
	    	
	    	// 다른 번호 인증 버튼 클릭 시
	    	$(document).on('click', '.form-field.mobile-number .button__wrap', function(){
	    		var buttonStr = $('.form-field.mobile-number .button__wrap').text();
	    		if(buttonStr == '다른 번호 인증'){
	    			$('.form-field.mobile-number .button__wrap').text('인증번호 받기');
	    			$('#f_tel').removeAttr('readonly');
	    			$('#f_tel').val('');
	    			$('#phoneCheck').val(0);
	    		}else if(buttonStr == '인증번호 받기'){
	    			var tel = $('#f_tel').val();
	    			var check;
	    			$.ajax({
	    				url : 'phoneBeforeCheck.do',
	    				type : 'post',
	    				data : {
	    					'phone' : tel
	    				},
	    				success : function(data){
	    					if(data == "1"){
	    						
	    						$.ajax({
	    							url : 'myMemberModifyPhoneCheck.do',
	    							type : 'post',
	    							dataType : 'html',
	    							data : {
	    								'phone' : tel
	    							},
	    							success : function(htmlOut){
	    								$('.form-field.mobile-number').children('.form-field-group').detach();
	    								$('.form-field.mobile-number').append(htmlOut);
	    								
	    								$.ajax({
	    									url : 'checkBox.do',
	    									type : 'post',
	    									dataType : 'html',
	    									success : function(htmlOut01){
	    										$('body').append(htmlOut01);
	    										
	    										$.ajax({
	    											url : 'smsCheck.do',
	    											type : 'post',
	    											data : {
	    												'phone' : tel
	    											},
	    											success : function(){
	    											}
	    										});
	    									}
	    								});
	    							}
	    						});
	    					}else{
	    						$.ajax({
	    							url : 'phoneCheckFail.do',
	    							type : 'post',
	    							dataType : 'html',
	    							data : {
	    								'phone' : tel
	    							},
	    							success : function(htmlOut){
	    								$('body').append(htmlOut);
	    							}
	    						});
	    					}
	    				}
	    			});
	    		}
	    	})
	    	
	    	
	    	// 재요청 버튼
	    	$(document).on('click', '#phoneCheckRe', function(){
	    		$('#phoneCheck').val(0);
	    		var tel = $('#f_tel').val();
    			var check;
    			$.ajax({
    				url : 'phoneBeforeCheck.do',
    				type : 'post',
    				data : {
    					'phone' : tel
    				},
    				success : function(data){
    					if(data == "1"){
    						
    						$.ajax({
    							url : 'myMemberModifyPhoneCheck.do',
    							type : 'post',
    							dataType : 'html',
    							data : {
    								'phone' : tel
    							},
    							success : function(htmlOut){
    								$('.form-field.mobile-number').children('.form-field-group').detach();
    								$('.form-field.mobile-number').append(htmlOut);
    								
    								$.ajax({
    									url : 'checkBox.do',
    									type : 'post',
    									dataType : 'html',
    									success : function(htmlOut01){
    										$('body').append(htmlOut01);
    										
    										$.ajax({
    											url : 'smsCheck.do',
    											type : 'post',
    											data : {
    												'phone' : tel
    											},
    											success : function(){
    											}
    										});
    									}
    								});
    							}
    						});
    					}else{
    						$.ajax({
    							url : 'phoneCheckFail.do',
    							type : 'post',
    							dataType : 'html',
    							data : {
    								'phone' : tel
    							},
    							success : function(htmlOut){
    								$('body').append(htmlOut);
    							}
    						});
    					}
    				}
    			});
	    	})
	    	
	    	
	    	// 인증번호 확인 버튼
	    	$(document).on('click', '#certificationBtn', function(){
				var certification = $('#certification').val();
				if(certification.length == 0){
					alert("인증번호를 입력해주세요.");
					return false;
				}
				$.ajax({
					url : 'certificationCheck.do',
					type : 'post',
					data : {
						'certification' : certification
					},
					success : function(data){
						if(data == 1){
							$('.form-field.mobile-number').children('.form-field-group').children('p.validation').detach();
							$('.form-field.mobile-number').children('.form-field-group').append('<p data-v-3e2784be="" class="validation">인증번호가 확인 되었습니다.</p>');
							$('#phoneCheck').val(1);
							$('#certificationBtn').attr('disabled', 'disabled');
							$('#certificationBtn').attr('class', 'button button--disabled');
							$('#certification').attr('disabled', 'disabled');
						}else{
							$('.form-field.mobile-number').children('.form-field-group').children('p.validation').detach();
							$('.form-field.mobile-number').children('.form-field-group').append('<p data-v-3e2784be="" class="validation error">유효한 인증번호가 아닙니다. 다시 한 번 확인해주세요</p>');
							$('#phoneCheck').val(0);
						}
					}
				})
			})
	    	
	    	
	    	// 이메일 검증
	    	$('#f_email').keyup(function(){
	    		var email = $('#f_email').val();
	    		if(email.length == 0) {
	    			$('#emailCheck').val(0);
	    			return "";
	    		}else if(email == $('#oldEmail').val()){
	    			$('.form-field.email').children('p').eq(1).detach();
	    			$('#emailCheck').val(1);
	    			return false;
	    		}
	    		$.ajax({
	    			url : 'emailCheck.do',
	    			type : 'post',
	    			dataType : 'html',
	    			data : {
	    				'email' : email
	    			},
	    			success : function(htmlOut){
	    				$('.form-field.email').children('.validation').detach();
	    				$('.form-field.email').append(htmlOut);
	    			}
	    		})
	    	})
	    	
	    	
	    	// 저장하기 버튼 클릭 시
	    	$(document).on('click', '.update__nav button', function(){
	    		// 성별 전역변수 : realGender
	    		var email = $('#f_email').val();
	    		var tel = $('#f_tel').val();
	    		var nickname = $('#f_nickname').val();
	    		var name = $('#f_name').val();
	    		var birth1 = $('#f_birth1').val();
	    		var birth2 = $('#f_birth2').val();
	    		var birth3 = $('#f_birth3').val();
	    		var birthday = '';
	    		
	    		var emailCheck = $('#emailCheck').val();
	    		var nameCheck = $('#nameCheck').val();
	    		var phoneCheck = $('#phoneCheck').val();
	    		
	    		if(emailCheck != 1){
	    			$.ajax({
	    				url : 'myMemberModifyFinalEmailCheckModal.do',
	    				dataType : 'html',
	    				success : function(htmlOut){
	    					$('body').append(htmlOut);
	    				}
	    			})
	    			return false;
	    		}else if(name.length == 0){
	    			$.ajax({
	    				url : 'myMemberModifyFinalNameEmptyCheckModal.do',
	    				dataType : 'html',
	    				success : function(htmlOut){
	    					$('body').append(htmlOut);
	    				}
	    			})
	    			return false;
	    		}else if(nameCheck != 1){
	    			$.ajax({
	    				url : 'myMemberModifyFinalNameCheckModal.do',
	    				dataType : 'html',
	    				success : function(htmlOut){
	    					$('body').append(htmlOut);
	    				}
	    			})
	    			return false;
	    		}else if(tel.length == 0){
	    			$.ajax({
	    				url : 'myMemberModifyFinalPhoneEmptyCheckModal.do',
	    				dataType : 'html',
	    				success : function(htmlOut){
	    					$('body').append(htmlOut);
	    				}
	    			})
	    			return false;
	    		}else if(phoneCheck != 1){
	    			$.ajax({
	    				url : 'myMemberModifyFinalPhoneCheckModal.do',
	    				dataType : 'html',
	    				success : function(htmlOut){
	    					$('body').append(htmlOut);
	    				}
	    			})
	    			return false;
	    		}else{
	    			if(birth1 == null || birth2 == null || birth3 == null ||
	    					birth1 == '' || birth2 == '' || birth3 == ''){
	    		    	birthday = null;
	    		    }else{
	    		    	birthday = String(birth1) + '-' + String(birth2) + '-' + String(birth3)
	    		    }
	    			
	    			$.ajax({
	    				url : 'myMemberModifySuccessCheckModal.do',
	    				dataType : 'html',
	    				type : 'post',
	    				data : {
	    					'email' : email,
	    					'name' : name,
	    					'nickname' : nickname,
	    					'phone' : tel,
	    					'birthdayTmp' : birthday,
	    					'gender' : realGender
	    				},
	    				success : function(htmlOut){
	    					$('body').append(htmlOut);
	    				}
	    			})
	    		} //todo 생년월일, 성별 두 가지만 정리해서 넘기면 됨
	    	})
	    	
	    	// 회원 탈퇴 버튼
	    	$(document).on('click', '#memberSecession', function(){
	    		$(location).attr("href", "myMemberSecessionCheckPage.do");
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
					<input type="hidden" id="oldEmail" value="${member.email }">
					<input type="hidden" id="birthdayTmp" value="${birthday }">
					<input type="hidden" id="genderTmp" value="${member.gender }">
					<input type="hidden" id="nameCheck" value="1">
					<input type="hidden" id="phoneCheck" value="1">
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
				<div class="container" style="padding-top: 182px;"
					data-v-0f5971ec="">
					<div data-v-421abad8="" data-v-0b634006="" data-v-0f5971ec=""
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
												href="myReviewSearch.do" class="">나의 후기</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992=""
												href="myMemberModify.do" class="nuxt-link-exact-active nuxt-link-active">회원정보 수정</a></li>
											<li data-v-e99f4992=""><a data-v-e99f4992="" href="#" id="logout">로그아웃</a></li>
										</ul>
									</aside>
								</aside>
								<div data-v-421abad8="" class="mypage-layout__body">
									<article data-v-0b634006="" data-v-421abad8="" class="update">
										<header data-v-2c0651a8="" data-v-0b634006=""
											class="row--v-center page-header" data-v-421abad8="">
											<!---->
											<!---->
											<h2 data-v-2c0651a8="" class="col">회원정보 수정</h2>
											<nav data-v-2c0651a8="" class="page-header__nav-after">
												<button data-v-a1c889e0="" data-v-0b634006="" type="button"
													title=""
													class="button button--side-padding button--size-small button--color-gray button--outline"
													data-v-2c0651a8="">
													<span data-v-a1c889e0="" class="button__wrap" id="memberSecession"> 회원탈퇴
													</span>
												</button>
											</nav>
										</header>
										<div data-v-0b634006="" data-v-421abad8="">
											<fieldset data-v-0b634006="" data-v-421abad8=""
												class="form-fieldset">
												<legend data-v-0b634006="" data-v-421abad8="">기본정보
													입력 폼</legend>
												<h3 data-v-0b634006="" data-v-421abad8="">계정 정보</h3>
												<div data-v-0b634006="" data-v-421abad8=""
													class="form-field email">
													<p data-v-0b634006="" data-v-421abad8="" class="form-label">
														<label data-v-0b634006="" data-v-421abad8="" for="f_email">이메일
															(아이디)</label>
													</p>
													<div data-v-0b634006="" data-v-421abad8=""
														class="form-field-group">
														<div data-v-0b634006="" data-v-421abad8="" class="columns">
														<c:if test="${member.memberType != 'e' }">
															<input data-v-8bb17226="" data-v-0b634006="" id="f_email"
																type="email" name="f_email"
																placeholder="비밀번호 분실 시에 필요합니다. 정확하게 입력해주세요."
																autocorrect="off" autocapitalize="off" value="${member.email }"
																class="input form-text" readonly="readonly" data-v-421abad8="">
														</c:if>
														<c:if test="${member.memberType == 'e' }">
															<input data-v-8bb17226="" data-v-0b634006="" id="f_email"
																type="email" name="f_email"
																placeholder="비밀번호 분실 시에 필요합니다. 정확하게 입력해주세요."
																autocorrect="off" autocapitalize="off" value="${member.email }"
																class="input form-text" data-v-421abad8="">
														</c:if>
														</div>
													</div>
													<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="1">
												</div>
												
												<c:if test="${member.memberType == 'e' }">
													<div data-v-0b634006="" data-v-421abad8=""
														class="form-field update-section__field">
														<p data-v-0b634006="" data-v-421abad8="" class="form-label">
															<label data-v-0b634006="" data-v-421abad8=""
																for="f_password" class="required">비밀번호</label>
														</p>
														<nav data-v-0b634006="" data-v-421abad8="" class="password">
															<button data-v-a1c889e0="" data-v-0b634006=""
																type="button" title="" class="button button--outline"
																data-v-421abad8="">
																<span data-v-a1c889e0="" class="button__wrap">비밀번호
																	변경</span>
															</button>
														</nav>
													</div>
												</c:if>
												
												<!---->
												<h3 data-v-0b634006="" data-v-421abad8="">개인 정보</h3>
												<div data-v-0b634006="" data-v-421abad8=""
													class="form-field name">
													<p data-v-0b634006="" data-v-421abad8="" class="form-label">
														<label data-v-0b634006="" data-v-421abad8="" for="f_name">이름</label>
													</p>
													<div data-v-0b634006="" data-v-421abad8=""
														class="form-field-group">
														<input data-v-8bb17226="" data-v-0b634006="" id="f_name"
															type="text" name="f_name" placeholder="이름 입력" value="${member.name }"
															autocorrect="off" autocapitalize="off" class="form-text"
															data-v-421abad8="">
													</div>
													<!---->
												</div>
												<div data-v-0b634006="" data-v-421abad8=""
													class="form-field name">
													<p data-v-0b634006="" data-v-421abad8="" class="form-label">
														<label data-v-0b634006="" data-v-421abad8=""
															for="f_nickname">닉네임</label>
													</p>
													<input data-v-8bb17226="" data-v-0b634006=""
														id="f_nickname" type="text" name="f_nickname" value="${member.nickname }"
														placeholder="닉네임을 작성해주세요!" autocorrect="off"
														autocapitalize="off" class="form-text" data-v-421abad8="">
												</div>
												<div data-v-0b634006="" data-v-421abad8=""
													class="form-field mobile-number">
													<p data-v-0b634006="" data-v-421abad8="" class="form-label">
														<label data-v-0b634006="" data-v-421abad8="" for="f_tel">휴대폰
															번호</label>
													</p>
													<div data-v-0b634006="" data-v-421abad8=""
														class="form-field-group">
														<div data-v-0b634006="" data-v-421abad8="" class="row">
															<div data-v-0b634006="" data-v-421abad8="" class="col">
																<input data-v-8bb17226="" data-v-0b634006="" id="f_tel"
																	type="tel" name="f_tel" placeholder="01012345678" value="${member.phone }"
																	readonly="readonly" autocorrect="off"
																	autocapitalize="off" class="form-text"
																	data-v-421abad8="">
															</div>
															<div data-v-0b634006="" data-v-421abad8="" class="col-4">
																<button data-v-a1c889e0="" data-v-0b634006=""
																	type="button" title="" class="button"
																	data-v-421abad8="">
																	<span data-v-a1c889e0="" class="button__wrap">다른 번호 인증</span>
																</button>
															</div>
														</div>
													</div>
												</div>
												<div data-v-0b634006="" data-v-421abad8=""
													class="form-field update-section__field">
													<p data-v-0b634006="" data-v-421abad8="" class="form-label">
														<label data-v-0b634006="" data-v-421abad8="" for="f_birth">생년월일</label>
													</p>
													<div data-v-0b634006="" data-v-421abad8="" class="row">
														<span data-v-615e9308="" data-v-0b634006=""
															class="form-select row--v-center" data-v-421abad8=""><select
															data-v-615e9308="" id="f_birth1"><option
																	data-v-615e9308="" value="" disabled="disabled"
																	selected="selected">YYYY</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2009">2009</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2008">2008</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2007">2007</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2006">2006</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2005">2005</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2004">2004</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2003">2003</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2002">2002</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2001">2001</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="2000">2000</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1999">1999</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1998">1998</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1997">1997</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1996">1996</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1995">1995</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1994">1994</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1993">1993</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1992">1992</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1991">1991</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1990">1990</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1989">1989</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1988">1988</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1987">1987</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1986">1986</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1985">1985</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1984">1984</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1983">1983</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1982">1982</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1981">1981</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1980">1980</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1979">1979</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1978">1978</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1977">1977</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1976">1976</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1975">1975</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1974">1974</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1973">1973</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1972">1972</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1971">1971</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1970">1970</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1969">1969</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1968">1968</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1967">1967</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1966">1966</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1965">1965</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1964">1964</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1963">1963</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1962">1962</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1961">1961</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1960">1960</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1959">1959</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1958">1958</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1957">1957</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1956">1956</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1955">1955</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1954">1954</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1953">1953</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1952">1952</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1951">1951</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1950">1950</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1949">1949</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1948">1948</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1947">1947</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1946">1946</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1945">1945</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1944">1944</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1943">1943</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1942">1942</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1941">1941</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1940">1940</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1939">1939</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1938">1938</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1937">1937</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1936">1936</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1935">1935</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1934">1934</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1933">1933</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1932">1932</option>
																<option data-v-0b634006="" data-v-615e9308=""
																	value="1931">1931</option>
																<option data-v-0b634006="" data-v-615e9308="" value="">선택
																	안 함</option></select> <svg data-v-615e9308="" viewBox="0 0 12 7"
																xmlns="http://www.w3.org/2000/svg">
																<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
																	points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span> <span
															data-v-615e9308="" data-v-0b634006=""
															class="form-select row--v-center birth"
															data-v-421abad8=""><select data-v-615e9308=""
															id="f_birth2"><option data-v-615e9308=""
																	value="" disabled="disabled" selected="selected">MM</option>
																<option data-v-0b634006="" data-v-615e9308="" value="01">1</option>
																<option data-v-0b634006="" data-v-615e9308="" value="02">2</option>
																<option data-v-0b634006="" data-v-615e9308="" value="03">3</option>
																<option data-v-0b634006="" data-v-615e9308="" value="04">4</option>
																<option data-v-0b634006="" data-v-615e9308="" value="05">5</option>
																<option data-v-0b634006="" data-v-615e9308="" value="06">6</option>
																<option data-v-0b634006="" data-v-615e9308="" value="07">7</option>
																<option data-v-0b634006="" data-v-615e9308="" value="08">8</option>
																<option data-v-0b634006="" data-v-615e9308="" value="09">9</option>
																<option data-v-0b634006="" data-v-615e9308="" value="10">10</option>
																<option data-v-0b634006="" data-v-615e9308="" value="11">11</option>
																<option data-v-0b634006="" data-v-615e9308="" value="12">12</option>
																<option data-v-0b634006="" data-v-615e9308="" value="">선택
																	안 함</option></select> <svg data-v-615e9308="" viewBox="0 0 12 7"
																xmlns="http://www.w3.org/2000/svg">
																<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
																	points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span> <span
															data-v-615e9308="" data-v-0b634006=""
															class="form-select row--v-center birth"
															data-v-421abad8=""><select data-v-615e9308=""
															id="f_birth3"><option data-v-615e9308=""
																	value="" disabled="disabled" selected="selected">DD</option>
																<option data-v-0b634006="" data-v-615e9308="" value="01">1</option>
																<option data-v-0b634006="" data-v-615e9308="" value="02">2</option>
																<option data-v-0b634006="" data-v-615e9308="" value="03">3</option>
																<option data-v-0b634006="" data-v-615e9308="" value="04">4</option>
																<option data-v-0b634006="" data-v-615e9308="" value="05">5</option>
																<option data-v-0b634006="" data-v-615e9308="" value="06">6</option>
																<option data-v-0b634006="" data-v-615e9308="" value="07">7</option>
																<option data-v-0b634006="" data-v-615e9308="" value="08">8</option>
																<option data-v-0b634006="" data-v-615e9308="" value="09">9</option>
																<option data-v-0b634006="" data-v-615e9308="" value="10">10</option>
																<option data-v-0b634006="" data-v-615e9308="" value="11">11</option>
																<option data-v-0b634006="" data-v-615e9308="" value="12">12</option>
																<option data-v-0b634006="" data-v-615e9308="" value="13">13</option>
																<option data-v-0b634006="" data-v-615e9308="" value="14">14</option>
																<option data-v-0b634006="" data-v-615e9308="" value="15">15</option>
																<option data-v-0b634006="" data-v-615e9308="" value="16">16</option>
																<option data-v-0b634006="" data-v-615e9308="" value="17">17</option>
																<option data-v-0b634006="" data-v-615e9308="" value="18">18</option>
																<option data-v-0b634006="" data-v-615e9308="" value="19">19</option>
																<option data-v-0b634006="" data-v-615e9308="" value="20">20</option>
																<option data-v-0b634006="" data-v-615e9308="" value="21">21</option>
																<option data-v-0b634006="" data-v-615e9308="" value="22">22</option>
																<option data-v-0b634006="" data-v-615e9308="" value="23">23</option>
																<option data-v-0b634006="" data-v-615e9308="" value="24">24</option>
																<option data-v-0b634006="" data-v-615e9308="" value="25">25</option>
																<option data-v-0b634006="" data-v-615e9308="" value="26">26</option>
																<option data-v-0b634006="" data-v-615e9308="" value="27">27</option>
																<option data-v-0b634006="" data-v-615e9308="" value="28">28</option>
																<option data-v-0b634006="" data-v-615e9308="" value="29">29</option>
																<option data-v-0b634006="" data-v-615e9308="" value="30">30</option>
																<option data-v-0b634006="" data-v-615e9308="" value="31">31</option>
																<option data-v-0b634006="" data-v-615e9308="" value="">선택
																	안 함</option></select> <svg data-v-615e9308="" viewBox="0 0 12 7"
																xmlns="http://www.w3.org/2000/svg">
																<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
																	points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span>
													</div>
												</div>
												<div data-v-0b634006="" data-v-421abad8=""
													class="form-field update-section__field">
													<p data-v-0b634006="" data-v-421abad8="" class="form-label">
														<label data-v-0b634006="" data-v-421abad8=""
															for="f_gender">성별</label>
													</p>
													<div data-v-0b634006="" data-v-421abad8="" class="row">
														<label data-v-0b634006="" data-v-421abad8="" class="row--v-center">
															<label data-v-12d1ffd0="" data-v-0b634006="" class="form-radio" data-v-421abad8="">
																<input data-v-12d1ffd0="" type="radio" name="spot-search-radio" value="female"> 
																<span data-v-12d1ffd0="">
																	<i data-v-12d1ffd0=""></i>
																</span>
															</label> 
															<span data-v-0b634006="" data-v-421abad8="">여자</span>
														</label> 
														<label data-v-0b634006="" data-v-421abad8="" class="row--v-center">
															<label data-v-12d1ffd0="" data-v-0b634006="" class="form-radio" data-v-421abad8="">
																<input data-v-12d1ffd0="" type="radio" name="spot-search-radio" value="male">
																<span data-v-12d1ffd0="">
																	<i data-v-12d1ffd0=""></i>
																</span>
															</label>
															<span data-v-0b634006="" data-v-421abad8="">남자</span>
														</label> 
														<label data-v-0b634006="" data-v-421abad8="" class="row--v-center">
															<label data-v-12d1ffd0="" data-v-0b634006="" class="form-radio" data-v-421abad8="">
																<input data-v-12d1ffd0="" type="radio" name="spot-search-radio" value="-"> 
																<span data-v-12d1ffd0="">
																	<i data-v-12d1ffd0=""></i>
																</span>
															</label> 
															<span data-v-0b634006="" data-v-421abad8="">선택 안 함</span>
														</label>
													</div>
												</div>
											</fieldset>
											<nav data-v-0b634006="" data-v-421abad8=""
												class="update__nav">
												<button data-v-a1c889e0="" data-v-0b634006="" type="button"
													title="" class="button" data-v-421abad8="">
													<span data-v-a1c889e0="" class="button__wrap">저장하기</span>
												</button>
											</nav>
										</div>
									</article>
									<!---->
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