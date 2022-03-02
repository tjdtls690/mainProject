<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<article data-v-2706028c="" class="selected-detail-wrap">
	<div data-v-2706028c="" class="selected-detail">
		<img data-v-2706028c="" src="/images/exit@2x.png" class="selected-detail__close"> 
<!-- 												삭제 버튼 -->
		<div data-v-2706028c="" class="selected-detail__title" id="${size}">
             			${name} // ${ size}
		</div>
		<div data-v-2706028c="" class="form-selected-detail-number-wrap">
			<nav data-v-4ba0dee4="" data-v-2706028c="" class="form-number" readonly="readonly" style="box-sizing: border-box; width: 120px; height: 32px;">
				<button data-v-4ba0dee4="" type="button" class="form-number__control" id="minus-button">
					<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
						<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
							<path data-v-4ba0dee4="" fill="currentColor" d="M7 11.5h10v1H7z">
							</path>
						</g>   
					</svg>     
				</button> 
				<span data-v-4ba0dee4="" class="form-number__input">
					<input data-v-4ba0dee4="" id="508" type="number" min="1" max="9999" step="1" value="1">
				</span> 
				<button data-v-4ba0dee4="" type="button" class="form-number__control" id="plus-button" value="${size}" >
					<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
						<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
							<path data-v-4ba0dee4="" fill="currentColor" d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z">
							</path>
						</g>
					</svg>
				</button>
			</nav>
		</div>
	</div>
</article>