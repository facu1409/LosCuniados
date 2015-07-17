<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Clientes</title>
	</head>
<body>	

<!-- 		<div style="color: teal; font-size: 30px">Registro</div> -->	
<%-- 		<form:form id="registerForm" commandName="cliente" modelAttribute="cliente" method="post" action="clienteRegister"> --%>
<h1>
	Agregar Cliente
</h1>
	<c:url var="addAction" value="/cliente/add" ></c:url>
	
	<form:form action="${addAction}" commandName="cliente">
		<table width="400px" height="150px">
			<c:if test="${!empty cliente.nombre}">
			<tr>
				<td>
					<form:label path="id">
						ID
					</form:label>
				</td>
				<td>
					<form:input path="id" readonly="true" size="8"  disabled="true" />
					<form:hidden path="id" />
				</td> 
			</tr>
			</c:if>
				<tr>
					<td><form:label path="nombre">Nombre:</form:label></td>
					<td><form:input path="nombre" /></td>
				</tr>
				<tr>
					<td><form:label path="apellido">Apellido:</form:label></td>
					<td><form:input path="apellido" /></td>
				</tr>		
				<tr>
					<td><form:label path="telMovil">Celular:</form:label></td>
					<td><form:input path="telMovil" /></td>
				</tr>
				<tr>
					<td><form:label path="email">Email:</form:label></td>
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td><form:label path="direccion">Direccion:</form:label></td>
					<td><form:input path="direccion" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${!empty cliente.nombre}">
							<input type="submit" value="Editar" />
						</c:if>
						<c:if test="${empty cliente.nombre}">
							<input type="submit" value="Agregar" />
						</c:if>
					</td>
				</tr>
		</table>
	</form:form>	
<!-- 		<a href="clienteList">Ir a Listado</a> -->
<br>
<h3>Listado Clientes</h3>
<c:if test="${!empty listPersons}">	
	<table border="1" bgcolor="black" width="600px">
		<tr>
			<th>Nombre<th>
			<th>Apellido</th>
			<th>Celular</th>
			<th>Email</th>
			<th>Calle</th>						
			<th>Editar</th>
			<th>Eliminar</th>
		<tr>		
	</tr>	
					
	<c:forEach items="${listClientes}" var="cliente">		
			<tr>						
				<td><c:out value="${cliente.nombre}" />
				</td>
				<td><c:out value="${cliente.apellido}" />
				</td>
				<td><c:out value="${cliente.telMovil}" />
				</td>
				<td><c:out value="${cliente.email}" />
				</td>
				<td><c:out value="${cliente.direccion}" />
				</td>	
			<td><a href="<c:url value='/edit/${cliente.clienteID}' />" >Editar</a></td>
			<td><a href="<c:url value='/remove/${cliente.clienteID}' />" >Eliminar</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>	
</body>
</html>
