<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<thead>
	<tr>
		<th>주문날짜</th>
		<th>원가</th>
		<th>배송비</th>
		<th>총가격</th>                                         
		<th>쿠폰가</th>                                         
		<th>포인트 사용</th>                                         
		<th>할인</th>                                         
		<th>결제금액</th>                                                                              
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${listMonth}">
		    <tr>
		        <td>${list.payment_date }</td>
		        <td>${list.payment_price }</td>
		        <td>${list.payment_delivery_price}</td>
		        <td>${list.payment_sum_price }</td>
		        <td>${list.payment_coupon_price }</td>
		        <td>${list.payment_point_price }</td>
		        <td>${list.payment_sail_price }</td>
		        <td>${list.payment_final_price }</td>

		    </tr>
	</c:forEach>
</tbody>