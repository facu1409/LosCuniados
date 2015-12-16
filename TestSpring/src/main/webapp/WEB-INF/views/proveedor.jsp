<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Proveedores</title>
		<jsp:include page="importLibrerias.jsp"></jsp:include>
	</head>
<body>
<script>
 
 $(document).ready(function () {

	    $('#proveedorForm').validate({	    	
	        rules: {
	        	cuit: {
	                minlength: 11,
	                maxlength: 11,
	                required: true,
	                number: true
	            },
	            nombre: {
	                minlength: 2,
	                required: true
	            },
	            telefono: {
	                minlength: 2,
	                required: true
	            },
	            mail: {	                
	                email: true
	            },
	            domicilio: {
	                minlength: 2,
	                required: true
	            }
	        },
	        highlight: function (element) {
	            $(element).closest('.control-group').removeClass('success').addClass('error');
	        },
	        success: function (element) {
	            element.text('').addClass('valid')
	                .closest('.control-group').removeClass('error').addClass('success');
	        }
	    });

	});
 
</script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<br />
		<div class="row">
			<div class="col-md-12">	
				<div class="panel panel-default">
					<div class="panel-body">					
						<h3 class="text-primary">
							Proveedor
						</h3>
						<c:url var="addAction" value="/proveedor/add" ></c:url>
						<br />						
						<form:form id="proveedorForm" class="form-inline" action="${addAction}" commandName="proveedor">		
							<c:if test="${!empty proveedor.nombre}">							
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
										<form:label class="control-label" for="cuit" path="cuit">CUIT:</form:label><br />
										<form:input class="form-control" id="cuit" path="cuit" />				
									</div>
								</div>
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" path="nombre">Nombre:</form:label><br />
										<form:input class="form-control"  path="nombre" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" path="telefono">Telefono:</form:label><br />
										<form:input class="form-control"  path="telefono" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<form:label class="control-label" path="mail">Email:</form:label><br />
										<form:input class="form-control"  path="mail" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<form:label class="control-label" path="domicilio">Domicilio:</form:label><br />
										<form:input class="form-control"  path="domicilio" />					
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-12">
									<c:if test="${!empty proveedor.nombre}">
										<input class="btn btn-primary" type="submit" value="Editar" />
									</c:if>    
									<c:if test="${empty proveedor.nombre}">
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
						<h3 class="text-primary">Listado Proveedores</h3>
						<br />
						<c:if test="${!empty listProveedores}">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">		
								<tr class="active success">
									<th>Cuit</th>			
									<th>Nombre</th>
									<th>Telefono</th>
									<th>Mail</th>
									<th>Domicilio</th>									
									<th>Acciones</th>									
								</tr>				
							<c:forEach items="${listProveedores}" var="proveedor">		
								<tr>		
									<td><c:out value="${proveedor.cuit}" /></td>				
									<td><c:out value="${proveedor.nombre}" /></td>
									<td><c:out value="${proveedor.telefono}" /></td>
									<td><c:out value="${proveedor.mail}" /></td>				
									<td><c:out value="${proveedor.domicilio}" /></td>																		
									<td align="center">
										<a style="padding: 5px;color:gray" href="<c:url value='/editProveedor/${proveedor.id}' />"><span class="glyphicon glyphicon-edit"></span></a>
										<a style="padding: 5px;color:gray;" href="<c:url value='/removeProveedor/${proveedor.id}' />"><span class="glyphicon glyphicon-remove"></span></a>
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
