<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<thead>
	<tr>
		<th>주문날짜</th>
		<th>상품명</th>                                                                                                                     
		<th>수량</th>                                         
		<th>결제금액</th>                                                                              
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${list}">
		    <tr>
		        <td>${list.date}</td>
		        <td>${list.name}</td>
		        <td>${list.quantity}</td>
		        <td>${list.price}</td>

		    </tr>
	</c:forEach>
</tbody>