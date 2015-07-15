<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clientes</title>
</head>
<body>
	<center>

		<div style="color: teal; font-size: 30px">Clientes</div>

		<c:if test="${!empty clienteList}">
			<table border="1" bgcolor="black" width="600px">
				<tr
					style="background-color: teal; color: white; text-align: center;"
					height="40px">

					<td><spring:message code="label.firstname"/></td>
					<td><spring:message code="label.lastname"/></td>
					<td><spring:message code="label.telMovil"/></td>
					<td><spring:message code="label.email"/></td>
					<td><spring:message code="label.direccionCalle"/></td>
					<td><spring:message code="label.direccionNro"/></td>
					<td><spring:message code="label.direccionDpto"/></td>
					<td><spring:message code="label.direccionPiso"/></td>			
					<td><spring:message code="label.edit"/></td>
					<td><spring:message code="label.delete"/></td>
				</tr>
				<c:forEach items="${clienteList}" var="user">
					<tr
						style="background-color: white; color: black; text-align: center;"
						height="30px">
						
						<td><c:out value="${user.nombre}" />
						</td>
						<td><c:out value="${user.apellido}" />
						</td>
						<td><c:out value="${user.telMovil}" />
						</td>
						<td><c:out value="${user.email}" />
						</td>
						<td><c:out value="${user.direccionCalle}" />
						</td>
						<td><c:out value="${user.direccionNro}" />
						</td>
						<td><c:out value="${user.direccionDpto}" />
						</td>
						<td><c:out value="${user.direccionPiso}" />
						</td>

						<td><a href="clienteEdit?id=${user.clienteID}"><spring:message code="label.edit"/></a></td>
						<td><a href="clienteDelete?id=${user.clienteID}"><spring:message code="label.delete"/></a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>


		<a href="clienteForm"><spring:message code="label.nuevocliente"/></a>
	</center>
</body>
</html>
