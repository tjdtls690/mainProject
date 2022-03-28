<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<option selected>itemCode</option>
<c:forEach var="list" items="${list }">
	<option value=${list.item_code }>${list.item_name }</option>
</c:forEach>
