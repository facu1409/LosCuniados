<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Clientes</title>
		<jsp:include page="importLibrerias.jsp"></jsp:include>
	</head>
<body>
<script>
 $(function () {
                $('#datetimepicker2').datetimepicker({
                    locale: 'es',
                    format: 'DD/MM/YYYY'
                });
            });
 
 $(document).ready(function () {

	    $('#clienteForm').validate({	    	
	        rules: {
	        	dniCuit: {
	                minlength: 8,
	                maxlength: 11,
	                required: true,
	                number: true
	            },
	            nombre: {
	                minlength: 2,
	                required: true
	            },
	            apellido: {
	                minlength: 2,
	                required: true
	            },
	            email: {	                
	                email: true
	            },
	            telefono: {
	                required: true,
	                number: true
	            }	   
	        },
	        highlight: function(element) {
	            $(element).closest('.form-group').addClass('has-error');
	        },
	        unhighlight: function(element) {
	            $(element).closest('.form-group').removeClass('has-error');
	        },
	        errorElement: 'span',
	        errorClass: 'help-block',
	        errorPlacement: function(error, element) {
	            if(element.parent('.input-group').length) {
	                error.insertAfter(element.parent());
	            } else {
	                error.insertAfter(element);
	            }
	        }
	    });

	});
 
</script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	
		<div class="row">
			<div class="col-md-12">	
				<div class="panel panel-default">
					<div class="panel-heading" style="font-size: 24px; ">
						Cliente</div>
					<div class="panel-body">
						<c:url var="addAction" value="/cliente/add" ></c:url>						
						<form:form id="clienteForm" action="${addAction}" commandName="cliente">		
							<c:if test="${!empty cliente.nombre}">							
								<div class="row">
									<div class="col-md-4">
										<div class="form-group has-default">
											<form:label class="control-label" for="id" path="id">ID:</form:label>
											<form:input class="form-control" id="id" path="id" readonly="true" size="8" disabled="true" />
											<form:hidden path="id" />				
										</div>
									</div>
								</div>									
							</c:if>							
							<div class="row">
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" for="dniCuit" path="dniCuit">DNI/CUIT:</form:label>
										<form:input value="" class="form-control numerico" id="dniCuit" path="dniCuit" />				
									</div>
								</div>
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" path="nombre">Nombre:</form:label>
										<form:input class="form-control"  path="nombre" />
									</div>
								</div>
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" path="apellido">Apellido:</form:label>
										<form:input class="form-control"  path="apellido" />
									</div>						
								</div>
							</div>							
							<div class="row">
								<div class="col-md-4">	
									<div class="form-group">
										<form:label class="control-label" path="telefono">Celular:</form:label>
										<form:input class="form-control numerico"  path="telefono" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<form:label class="control-label" path="email">Email:</form:label>
										<form:input class="form-control"  path="email" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<form:label class="control-label" path="fechaNacimiento">Fecha de Nacimiento:</form:label>
										  <div class='input-group date' id='datetimepicker2'>
						                    <form:input type='text' class="form-control" path="fechaNacimiento" />
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
									</div>
								</div>
							</div>							
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<form:label class="control-label" path="domicilio">Domicilio:</form:label>
										<form:input class="form-control"  path="domicilio" />					
									</div>
								</div>								
							</div>							
							<div class="row">
								<div class="col-md-12">
									<c:if test="${!empty cliente.nombre}">
										<input class="btn btn-primary" type="submit" value="Editar" />
									</c:if>    
									<c:if test="${empty cliente.nombre}">
										<input class="btn btn-success" type="submit" value="Agregar" />
									</c:if>
								</div>
							</div>
						</form:form>	
					</div>	
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
				<div class="panel-heading" style="font-size: 24px;">
						Listado Clientes
					</div>
					<div class="panel-body">						
						<c:if test="${!empty listClientes}">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">		
								<tr class="active success">
									<th>DNI/CUIT</th>			
									<th>Nombre</th>
									<th>Apellido</th>
									<th>Celular</th>
									<th>Email</th>
									<th>Domicilio</th>
									<th>Fecha de Nacimiento</th>										
									<th>Acciones</th>					
								</tr>				
							<c:forEach items="${listClientes}" var="cliente">		
								<tr>		
									<td><c:out value="${cliente.dniCuit}" /></td>				
									<td><c:out value="${cliente.nombre}" /></td>
									<td><c:out value="${cliente.apellido}" /></td>
									<td><c:out value="${cliente.telefono}" /></td>
									<td><c:out value="${cliente.email}" /></td>				
									<td><c:out value="${cliente.domicilio}" /></td>	
									<td><c:out value="${cliente.fechaNacimiento}" /></td>																					
									<td align="center">
										<a style="padding: 5px;color:gray" href="<c:url value='/edit/${cliente.id}' />"><span class="glyphicon glyphicon-edit"></span></a>
										<a style="padding: 5px;color:gray;" href="<c:url value='/remove/${cliente.id}' />"><span class="glyphicon glyphicon-remove"></span></a>
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
	</div>
</body>
</html>
