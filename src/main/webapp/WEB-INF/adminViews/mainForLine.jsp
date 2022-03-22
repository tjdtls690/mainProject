<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<c:forEach var="day" items="${chart}">
		<input type="hidden" name="day" value="${day.date}">
	</c:forEach>
		<c:forEach var="day" items="${chart}">
		<input type="hidden" name="daySum" value="${day.daySum}">
	</c:forEach>
	

	