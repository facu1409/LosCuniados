<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Facturas</title>
<jsp:include page="importLibrerias.jsp"></jsp:include>
</head>
<body>
	<script>
		$(function() {
			$('#datetimepicker2').datetimepicker({
				locale : 'es',
				format : 'DD/MM/YYYY'
			});
		});

		/*$(document).ready(function(){
		 $(".numerico").numeric();
		 });*/

		//-->TABLA PRODUCTOS
		var i = 1;
		$("#add_row").click(function() {

		});
		$("#delete_row").click(function() {
			if (i > 1) {
				$("#addr" + (i - 1)).html('');
				i--;
			}
		});

		//<--TABLA PRODUCTOS

		$(document).on("click", "#btn_selectCliente", function(event) {
			var idCliente = $('input[name=radiosCliente]:checked').val();
			$('#id_Cliente').val(idCliente);
			var nombre = $('#nombre_' + idCliente).html();
			var apellido = $('#apellido_' + idCliente).html();
			var nombre_apellido = nombre + ' ' + apellido;
			$('#nombre_cliente').val(nombre_apellido);
			$('#modalClientes').modal('toggle');
		});

		var idProd;
		$(document).on("click", "#btn_selectProd", function(event) {
			idProd = $('input[name=radiosProducto]:checked').val();
			var descripcion = $('#descripcion_' + idProd).html();
			var stock = $('#stock_' + idProd).html();
			$('#prod_desc').val(descripcion);
			$('#modalProductos').modal('toggle');
		});

		var monto = 0;
		var i = 0;
		$(document).on("click", '#btn_agregarLinea', function() {

			//$("#linea_idProd").val(idProd);
			var precioUn = $("#prod_precio").val();
			var cant = $("#cant").val();
			var total = cant * precioUn;	
			
			var $row = $('<tr>' +
					 '<td><input readonly="readonly" name="lineasFactura['+i+'].id_producto" value="'+idProd+'" /></td>'
					+'<td><input readonly="readonly" name="lineasFactura['+i+'].precio_unitario" value="'+precioUn+'" /></td>'
					+'<td><input readonly="readonly" name="lineasFactura['+i+'].cantidad" value="'+cant+'" /></td>'
					+'<td><input readonly="readonly" name="lineasFactura['+i+'].total" value="'+total+'" /></td>'
			+'</tr>');

			$('#tabla_factura> tbody:last').append($row);

			monto = monto + total;
			$('#monto').val(monto);
			i++;

		});

		$(document).on("click", '#btn_borrarLinea', function() {
			if (i > 1) {
				$("#addr" + (i - 1)).html('');
				i--;
			}
		});
	</script>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<br />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<h3 class="text-primary">Factura</h3>
						<c:url var="addAction" value="/factura/add"></c:url>
						<br />
						<form:form id="facturaForm" class="form-inline"	action="${addAction}" commandName="factura" modelAttribute="factura">
							<c:if test="${factura.id > 0}">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group has-default">
											<form:label class="control-label" for="id" path="id">ID:</form:label>
											<br />
											<form:input class="form-control" id="id" path="id"
												readonly="true" size="8" disabled="true" />
											<form:hidden path="id" />
										</div>
									</div>
								</div>
								<br />
							</c:if>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<form:label class="control-label" path="fecha">Fecha:</form:label>
										<br />
										<div class='input-group date' id='datetimepicker2'>
											<form:input type='text' class="form-control" path="fecha" />
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<form:input id="id_Cliente" type="hidden" path="id_Cliente" />
										<label class="control-label">Cliente:</label><br />
										<div class="input-group">
											<input type="text" id="nombre_cliente" class="form-control"
												placeholder="Buscar..."> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button"
													data-toggle="modal" data-target="#modalClientes">
													&nbsp;<span class="glyphicon glyphicon-search"
														aria-hidden="true"></span>&nbsp;
												</button>
											</span>
										</div>
										<!-- /input-group -->
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<form:label class="control-label" path="id_tipoFactura">Tipo de Factura</form:label>
										<br />
										<form:select class="form-control" path="id_tipoFactura">											
											<form:option value="A" label="   A   " />
											<form:option value="B" label="   B   " />
											<form:option value="C" label="   C   " selected="selected" />
										</form:select>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label">Producto:</label><br />
										<div class="input-group">
											<input id="prod_desc" type="text" class="form-control"	placeholder="Buscar..."> <span	class="input-group-btn">
												<button class="btn btn-default" type="button" data-toggle="modal" 
													data-target="#modalProductos">&nbsp;<span class="glyphicon glyphicon-search"
													aria-hidden="true"></span>&nbsp;
												</button>
											</span>
										</div>
										<!-- /input-group -->
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label">Precio:</label><br /> <input
											id="prod_precio" type="text" class="form-control">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label">Cantidad:</label><br /> <input
											id="cant" class="form-control input-number" value="1"
											type="number" name="quantity" min="1">
									</div>
								</div>
								<div class="col-md-3" style="padding-top: 20px">
									<div class="form-group">
										<button type="button" class="btn btn-primary"
											id="btn_agregarLinea">Agregar</button>
									</div>
								</div>
							</div>
							<br />
							<div class="table-responsive">
								<table id="tabla_factura"
									class="table table-bordered table-hover">
									<thead>
										<tr class="active success">
											<th>Producto</th>
											<th>Precio Unitario</th>
											<th>Cantidad</th>
											<th>Precio</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${factura.lineasFactura}" var="lineaFactura"	varStatus="status">
											<tr>
												<td align="center">${status.count}</td>
												<td><input readonly="readonly"	name="lineasFactura[${status.index}].id_producto" value="${lineaFactura.idProducto}" /></td>
												<td><input readonly="readonly" name="lineasFactura[${status.index}].precio_unitario" value="${lineaFactura.precioUnitario}" /></td>
												<td><input readonly="readonly" name="lineasFactura[${status.index}].cantidad" value="${lineaFactura.cantidad}" /></td>
												<td><input readonly="readonly" name="lineasFactura[${status.index}].total"	value="${lineaFactura.total}" /></td>
											</tr>
										</c:forEach>
										<%-- 										<c:forEach items="${factura.lineasFactura}" var="lineaFactura" varStatus="status"> --%>
										<!-- 											<tr> -->
										<%-- 												<td id="linea_idProd"><c:out --%>
										<%-- 														value="${lineaFactura.idProducto}" /></td> --%>
										<%-- 												<td id="linea_precioUn"><c:out --%>
										<%-- 														value="${lineaFactura.precioUnitario}" /></td> --%>
										<%-- 												<td id="linea_cant"><c:out --%>
										<%-- 														value="${lineaFactura.cantidad}" /></td> --%>
										<%-- 												<td id="linea_total"><c:out --%>
										<%-- 														value="${lineaFactura.total}" /></td> --%>
										<!-- 											</tr> -->
										<%-- 										</c:forEach> --%>
									</tbody>
								</table>
							</div>
					</div>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<form:label class="control-label" for="monto" path="monto">Total:</form:label>
						<br />
						<form:input class="form-control" id="monto" path="monto"
							readonly="true" />
					</div>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-12">
					<c:if test="${factura.id > 0}">
						<input class="btn btn-primary" type="submit" value="Editar" />
					</c:if>
					<c:if test="${factura.id == 0}">
						<input class="btn btn-success" type="submit" value="Agregar" />
					</c:if>
				</div>
			</div>
			</form:form>
			<!------------ Modal Seleccion Clientes ------------------------------------------------------------------->
			<div class="modal fade" id="modalClientes">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">Clientes</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<c:if test="${!empty listClientes}">
											<div class="table-responsive">
												<table class="table table-bordered table-hover">
													<tr class="active success">
														<th width="30px"></th>
														<th>DNI/CUIT</th>
														<th>Nombre</th>
														<th>Apellido</th>
													</tr>
													<c:forEach items="${listClientes}" var="cliente">
														<tr>
															<td><input type="radio" name="radiosCliente"
																id="${cliente.id}" value="${cliente.id}" /></td>
															<td><c:out value="${cliente.dniCuit}" /></td>
															<td id="nombre_${cliente.id}"><c:out
																	value="${cliente.nombre}" /></td>
															<td id="apellido_${cliente.id}"><c:out
																	value="${cliente.apellido}" /></td>
														</tr>
													</c:forEach>
												</table>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cerrar</button>
							<button type="button" class="btn btn-primary"
								id="btn_selectCliente">Seleccionar</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!------------ Modal Seleccion Producto ------------------------------------------------------------------->
			<div class="modal fade" id="modalProductos">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">Productos</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<c:if test="${!empty listProductos}">
											<div class="table-responsive">
												<table class="table table-bordered table-hover">
													<tr class="active success">
														<th width="30px"></th>
														<th>Nombre</th>
														<th>Stock</th>
													</tr>
													<c:forEach items="${listProductos}" var="producto">
														<tr>
															<td><input type="radio" name="radiosProducto"
																id="${producto.id}" value="${producto.id}" /></td>
															<td id="descripcion_${producto.id}"><c:out
																	value="${producto.nombre}" /></td>
															<td id="stock_${producto.id}"><c:out
																	value="${producto.stock}" /></td>
														</tr>
													</c:forEach>
												</table>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cerrar</button>
							<button type="button" class="btn btn-primary" id="btn_selectProd">Seleccionar</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<%-- 						</form:form>	 --%>
		</div>
	</div>
	<!-- 			</div> -->
	<!-- 		</div> -->
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<h3 class="text-primary">Listado Facturas</h3>
					<br />
					<c:if test="${!empty listFacturas}">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<tr class="active success">
									<th>Fecha</th>
									<th>Monto</th>
									<th>Acciones</th>
								</tr>
								<c:forEach items="${listFacturas}" var="factura">
									<tr>
										<td><c:out value="${factura.fecha}" /></td>
										<td><c:out value="${factura.monto}" /></td>
										<td align="center"><a style="padding: 5px; color: gray"
											href="<c:url value='/editFactura/${factura.id}' />"><span
												class="glyphicon glyphicon-edit"></span></a> <a
											style="padding: 5px; color: gray;"
											href="<c:url value='/removeFactura/${factura.id}' />"><span
												class="glyphicon glyphicon-remove"></span></a></td>
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
	<!-- 	</div> -->
</body>
</html>
