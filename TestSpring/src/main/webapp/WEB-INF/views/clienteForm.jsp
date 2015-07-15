<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registro</title>
</head>
<body>
	<center>

		<div style="color: teal; font-size: 30px">Registro</div>

	<c:url var="userRegistration" value="saveUser.html" />
		<form:form id="registerForm" modelAttribute="cliente" method="post"
			action="profesionalRegister">
			<table width="400px" height="150px">
				<tr>
					<td><form:label path="nombre"><spring:message code="label.firstname"/></form:label></td>
					<td><form:input path="nombre" /></td>
				</tr>
				<tr>
					<td><form:label path="apellido"><spring:message code="label.lastname"/></form:label></td>
					<td><form:input path="apellido" /></td>
				</tr>		
				<tr>
					<td><form:label path="telMovil"><spring:message code="label.telMovil"/></form:label></td>
					<td><form:input path="telMovil" /></td>
				</tr>
				<tr>
					<td><form:label path="email"><spring:message code="label.email"/></form:label></td>
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td><form:label path="direccionCalle"><spring:message code="label.direccionCalle"/></form:label></td>
					<td><form:input path="direccionCalle" /></td>
				</tr>
				<tr>
					<td><form:label path="direccionNro"><spring:message code="label.direccionNro"/></form:label></td>
					<td><form:input path="direccionNro" /></td>
				</tr>
				<tr>
					<td><form:label path="direccionDpto"><spring:message code="label.direccionDpto"/></form:label></td>
					<td><form:input path="direccionDpto" /></td>
				</tr>
				<tr>
					<td><form:label path="direccionPiso"><spring:message code="label.direccionPiso"/></form:label></td>
					<td><form:input path="direccionPiso" /></td>
				</tr>
			
				<tr>
					<td></td>
					<td><input type="submit" value=<spring:message code="label.register"/> />
					</td>
				</tr>
			</table>
		</form:form>


		<a href="clienteList"><spring:message code="label.clienteList"/></a>
	</center>
</body>
</html>
