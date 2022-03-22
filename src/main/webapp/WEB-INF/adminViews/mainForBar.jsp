<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<c:forEach var="day" items="${month}">
		<input type="hidden" name="monthSum" value="${day.daySum}">
	</c:forEach>
