<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<span data-v-8f2f8136="" class="row--v-center row--h-between col coupon__use">
	<span data-v-8f2f8136="">1장 사용</span> 
	<span data-v-8f2f8136="">
	<c:choose>
		<c:when test="${check == 2 || check == 4 || check == 5 || check == 6 }">
			<em data-v-8f2f8136=""><fmt:formatNumber value="${realSale }" pattern="#,###" /></em> % 할인
		</c:when>
		<c:otherwise>
			<em data-v-8f2f8136=""><fmt:formatNumber value="${realSale }" pattern="#,###" /></em> 원 할인
		</c:otherwise>
	</c:choose>
	</span>
</span>