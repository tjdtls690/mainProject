<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul data-v-2706028c=""
	class="menu__select-size-list normal bundle-modal-style">
	<li data-v-2706028c="" class="menu__options"><label
		data-v-2706028c="" class="menu__label" style="width: 120px;">사이즈
			선택</label>
		<div data-v-2706028c="" class="row--v-center">
			<div data-v-2706028c="" class="row--v-center radio-label">
				<label data-v-3f971378="" data-v-2706028c="" class="form-radio"><input
					data-v-3f971378="" id="Medium" type="radio"
					name="menu-sizebundleSelect" class="form-radio-input"
					value="Medium"> <span data-v-3f971378=""
					class="form-radio-circle"><i data-v-3f971378=""
						class="form-radio-circle-interior"></i></span> Medium </label> <label
					data-v-2706028c="" for="Medium" class="radio-side-text">Medium</label>
			</div>
			<c:if test="${!empty vo.item_price_l }">
				<div data-v-2706028c="" class="row--v-center radio-label">
					<label data-v-3f971378="" data-v-2706028c="" class="form-radio"><input
						data-v-3f971378="" id="Large" type="radio"
						name="menu-sizebundleSelect" class="form-radio-input"
						value="Large"> <span data-v-3f971378=""
						class="form-radio-circle"><i data-v-3f971378=""
							class="form-radio-circle-interior"></i></span> Large </label> <label
						data-v-2706028c="" for="Large" class="radio-side-text">Large</label>
				</div>
			</c:if>
			<!---->
		</div></li>
	<li data-v-2706028c="" class="menu__period-select">
		<!---->
		<div data-v-4837bb91="" data-v-2706028c=""
			class="dropdown-btn-flex-wrap">
			<div data-v-4837bb91="" class="dropdown-btn">
				<div data-v-4837bb91="" class="button dropdown">
					<div data-v-4837bb91="" class="except1">기간 선택</div>
				</div>
				<!---->
			</div>
		</div>
	</li>
	<li data-v-2706028c=""
		class="menu__date-select bundle-modal-style">
		<!---->
		<div data-v-2706028c="" class="date-picker-with-icon">
			<span data-v-56ae83be="" data-v-2706028c="" disabled="disabled"
				class="v-date-custom"><input data-v-2706028c=""
				data-v-56ae83be="" disabled="disabled" placeholder="시작 예정일 선택"
				readonly="readonly" type="input" class="date-picker-input">
			<div data-v-7605e1b2="" data-v-56ae83be=""
					class="vc-popover-content-wrapper">
					<!---->
				</div></span> <img data-v-2706028c=""
				src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_calendar-disabled%403x.png" alt="시작일 선택 달력 아이콘"
				class="date-select-calendar-icon" style="cursor: pointer;">
		</div>
	</li>
</ul>