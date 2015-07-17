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
				<tr	style="background-color: teal; color: white; text-align: center;"
					height="40px">
					<td>Nombre</td>
					<td>Apellido</td>
					<td>Celular</td>
					<td>Email</td>
					<td>Calle</td>						
					<td><b>Editar</b></td>
					<td><b>Eliminar</b></td>
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
						<td><c:out value="${user.direccion}" />
						</td>						

						<td><a href="clienteEdit?id=${user.clienteID}">Editar</a></td>
						<td><a href="clienteDelete?id=${user.clienteID}">Eliminar</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>


		<a href="clienteForm">Nuevo Cliente</a>
	</center>
</body>
</html>
