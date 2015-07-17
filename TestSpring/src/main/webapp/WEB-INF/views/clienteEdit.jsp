<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edición</title>
</head>
<body>
	<center>

		<div style="color: teal; font-size: 30px">Edición Cliente</div>

		<c:url var="userRegistration" value="clienteUpdate" />
		
		<form:form id="registerForm" modelAttribute="cliente" method="post"
			action="clienteUpdate">
			<table width="400px" height="150px">			
				<tr>
					<td>
						<form:label path="nombre">Nombre</form:label>
					</td>
					<td>
						<form:input path="nombre"  value="${cliente.nombre}"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="apellido">Apellido:</form:label>
					</td>
					<td>
						<form:input path="apellido" value="${cliente.apellido}"/>
					</td>
				</tr>		
				<tr>
					<td>
						<form:label path="telMovil">Celular:</form:label>
					</td>
					<td>
						<form:input path="telMovil" value="${cliente.telMovil}"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="email">Email:</form:label>
					</td>
					<td>
						<form:input path="email" value="${cliente.email}"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="direccionCalle">Calle:</form:label>
					</td>
					<td>
						<form:input path="direccionCalle" value="${cliente.direccionCalle}"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="direccionNro">Número:</form:label>
					</td>
					<td>
						<form:input path="direccionNro" value="${cliente.direccionNro}" />
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="direccionDpto">Depto:</form:label>
					</td>
					<td>
						<form:input path="direccionDpto" value="${cliente.direccionDpto}"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="direccionPiso">Piso:</form:label>
					</td>
					<td>
						<form:input path="direccionPiso" value="${cliente.direccionPiso}"/>
					</td>
				</tr>
			
				<tr>
					<td></td>
					<td>
						<input type="submit" value="Modificar" />
					</td>
				</tr>
			</table>
			<input id="clienteID" name="id" type="hidden" value="${cliente.clienteID}"/>
		</form:form>


		
	</center>
</body>
</html>
