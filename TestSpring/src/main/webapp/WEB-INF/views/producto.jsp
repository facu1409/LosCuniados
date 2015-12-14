<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Productos</title>
		<jsp:include page="importLibrerias.jsp"></jsp:include>
	</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<br />
		<div class="row">
			<div class="col-md-12">	
				<div class="panel panel-default">
					<div class="panel-body">					
						<h3 class="text-primary">
							Producto
						</h3>
						<c:url var="addAction" value="/producto/add" ></c:url>
						<br />
						<form:form class="form-inline" action="${addAction}" commandName="producto">		
							<c:if test="${!empty producto.nombre}">							
								<div class="row">
									<div class="col-md-4">
										<div class="form-group has-default">
											<form:label class="control-label" for="id" path="id">ID:</form:label>
											<form:input class="form-control" id="id" path="id" readonly="true" size="8" disabled="true" />
											<form:hidden path="id" />				
										</div>
									</div>
								</div>
								<br />	
							</c:if>							
							<div class="row">
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" path="nombre">Nombre:</form:label><br />
										<form:input class="form-control"  path="nombre" />
									</div>
								</div>	
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" path="detalle">Detalle:</form:label><br />
										<form:input style="width:730px" class="form-control"  path="detalle" />
									</div>
								</div>
								
								
							</div>	
							<br />
							<div class="row">
								<div class="col-md-12">
									<c:if test="${!empty producto.nombre}">
										<input class="btn btn-primary" type="submit" value="Editar" />
									</c:if>    
									<c:if test="${empty producto.nombre}">
										<input class="btn btn-success" type="submit" value="Agregar" />
									</c:if>
								</div>
							</div>
						</form:form>	
					</div>	
				</div>
			</div>
		</div>
	<br>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<h3 class="text-primary">Listado Productos</h3>
						<br />
						<c:if test="${!empty listProductos}">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">		
								<tr class="active success">
									<th>Nombre</th>			
									<th>Detalle</th>
									<th>Acciones</th>
																									
								</tr>				
							<c:forEach items="${listProductos}" var="producto">		
								<tr>		
									<td><c:out value="${producto.nombre}" /></td>				
									<td><c:out value="${producto.detalle}" /></td>																	
									<td align="center">
										<a style="padding: 5px;color:gray" href="<c:url value='/editProducto/${producto.id}' />"><span class="glyphicon glyphicon-edit"></span></a>
										<a style="padding: 5px;color:gray;" href="<c:url value='/removeProducto/${producto.id}' />"><span class="glyphicon glyphicon-remove"></span></a>
									</td>
								</tr>
							</c:forEach>
							</table>
						</div>
						</c:if>	
					</div>
				</div>	
			</div>
		</div>
	<br>	
	</div>
</body>
</html>
