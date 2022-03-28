<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<c:if test="${tagMain eq 1000 }">
	<thead>
	    <tr>
	        <th>랭크</th>
	        <th>태그명</th>
	        <th>판매횟수</th>
			<th>총 판매금액</th>                                         
	    </tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${list }" varStatus="status">
		    <tr>
		        <td>${status.count }위</td>
		        <td>
			       	<c:choose>
						<c:when test="${list.tagMain eq 100}"> 1.정기구독 </c:when>
						<c:when test="${list.tagMain eq 200}"> 2.샐러드 </c:when>
						<c:when test="${list.tagMain eq 300}"> 3.샌드위치/랩 </c:when>
						<c:when test="${list.tagMain eq 400}"> 4.도시락/간편식 </c:when>
						<c:when test="${list.tagMain eq 500}"> 5.죽/스프 </c:when>
						<c:when test="${list.tagMain eq 600}"> 6.세트상품 </c:when>
						<c:when test="${list.tagMain eq 700}"> 7.간식 </c:when>
						<c:when test="${list.tagMain eq 800}"> 8.음료 </c:when>	
					</c:choose>
		        </td>                      
		        <td>${list.count }</td>
<%-- 		        <td>${list.sum }</td> --%>
		        <td><fmt:formatNumber value="${list.sum }" pattern="#,### 원" /></td>
		    </tr>
		</c:forEach>
	</tbody>
	<c:forEach var="list2" items="${list2 }">
		<input type="hidden" name="tagMain" value="${list2.tagMain}">
		<input type="hidden" name="count" value="${list2.count}">
	</c:forEach>

</c:if>

<c:if test="${tagMain ne 1000 }">
	<thead>
	    <tr>
	        <th>랭크</th>
	        <th>상품명</th>
	        <th>판매 횟수</th>
			<th>총 판매 금액</th>                                         
	    </tr>
	</thead>
	<tbody>
		<c:forEach var="list2" items="${list2 }" varStatus="status">
		    <tr>
		        <td>${status.count }위</td>
		        <td>${list2.name }</td>                      
		        <td>${list2.quantity }</td>
<%-- 		        <td>${list2.price }</td> --%>
		        <td><fmt:formatNumber value="${list2.price }" pattern="#,### 원" /></td>
		    </tr>
		</c:forEach>
	</tbody>
	<c:forEach var="list" items="${list }">
		<input type="hidden" name="name" value="${list.name}">
		<input type="hidden" name="count" value="${list.quantity}">
	</c:forEach>
</c:if>
