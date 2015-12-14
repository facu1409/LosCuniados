<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Compras</title>
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

		$(document).on("click", "#btn_selectProveedor", function(event) {
			var idProveedor = $('input[name=radiosProveedor]:checked').val();
			$('#id_proveedor').val(idProveedor);
			var nombre = $('#nombre_' + idProveedor).html();
			var apellido = $('#apellido_' + idProveedor).html();
			var nombre_apellido = nombre + ' ' + apellido;
			$('#nombre_proveedor').val(nombre_apellido);
			$('#modalProveedors').modal('toggle');
		});

		var idProd;
		$(document).on("click", "#btn_selectProd", function(event) {
			idProd = $('input[name=radiosProducto]:checked').val();
			var descripcion = $('#descripcion_' + idProd).html();
			var stock = $('#stock_' + idProd).html();
			$('#prod_desc').val(descripcion);
			$('#modalProductos').modal('toggle');
		});

		var i = 0;
		$(document).on("click", '#btn_agregarLinea', function() {

			//$("#linea_idProd").val(idProd);
			var cant = $("#cant").val();	
			
			var $row = $('<tr>' +
					 '<td><input readonly="readonly" name="lineasCompra['+i+'].id_producto" value="'+idProd+'" /></td>'
					+'<td><input readonly="readonly" name="lineasCompra['+i+'].cantidad" value="'+cant+'" /></td>'
			+'</tr>');

			$('#tabla_compra> tbody:last').append($row);
			
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
						<h3 class="text-primary">Compra</h3>
						<c:url var="addAction" value="/compra/add"></c:url>
						<br />
						<form:form id="compraForm" class="form-inline"	action="${addAction}" commandName="compra" modelAttribute="compra">
							<c:if test="${compra.id > 0}">
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
<!-- 								<div class="col-md-3"> -->
<!-- 									<div class="form-group"> -->
<%-- 										<form:input id="id_proveedor" type="hidden" path="id_proveedor" /> --%>
<!-- 										<label class="control-label">Proveedor:</label><br /> -->
<!-- 										<div class="input-group"> -->
<!-- 											<input type="text" id="nombre_proveedor" class="form-control" -->
<!-- 												placeholder="Buscar..."> <span -->
<!-- 												class="input-group-btn"> -->
<!-- 												<button class="btn btn-default" type="button" -->
<!-- 													data-toggle="modal" data-target="#modalProveedors"> -->
<!-- 													&nbsp;<span class="glyphicon glyphicon-search" -->
<!-- 														aria-hidden="true"></span>&nbsp; -->
<!-- 												</button> -->
<!-- 											</span> -->
<!-- 										</div> -->
<!-- 										/input-group -->
<!-- 									</div> -->
<!-- 								</div> -->
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
								<table id="tabla_compra"
									class="table table-bordered table-hover">
									<thead>
										<tr class="active success">
											<th>Producto</th>
											<th>Cantidad</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${compra.lineasCompra}" var="lineaCompra"	varStatus="status">
											<tr>
												<td align="center">${status.count}</td>
												<td><input readonly="readonly"	name="lineasCompra[${status.index}].id_producto" value="${lineaCompra.idProducto}" /></td>
												<td><input readonly="readonly" name="lineasCompra[${status.index}].cantidad" value="${lineaCompra.cantidad}" /></td>
											</tr>
										</c:forEach>									
									</tbody>
								</table>
							</div>
					</div>
				</div>
			</div>
			<br />
			<br />
			<div class="row">
				<div class="col-md-12">
					<c:if test="${compra.id > 0}">
						<input class="btn btn-primary" type="submit" value="Editar" />
					</c:if>
					<c:if test="${compra.id == 0}">
						<input class="btn btn-success" type="submit" value="Agregar" />
					</c:if>
				</div>
			</div>
			</form:form>
			<!------------ Modal Seleccion Proveedores ------------------------------------------------------------------->
			<div class="modal fade" id="modalProveedors">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">Proveedors</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<c:if test="${!empty listProveedors}">
											<div class="table-responsive">
												<table class="table table-bordered table-hover">
													<tr class="active success">
														<th width="30px"></th>
														<th>DNI/CUIT</th>
														<th>Nombre</th>
														<th>Apellido</th>
													</tr>
													<c:forEach items="${listProveedors}" var="proveedor">
														<tr>
															<td><input type="radio" name="radiosProveedor"
																id="${proveedor.id}" value="${proveedor.id}" /></td>
															<td><c:out value="${proveedor.dniCuit}" /></td>
															<td id="nombre_${proveedor.id}"><c:out
																	value="${proveedor.nombre}" /></td>
															<td id="apellido_${proveedor.id}"><c:out
																	value="${proveedor.apellido}" /></td>
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
								id="btn_selectProveedor">Seleccionar</button>
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
					<h3 class="text-primary">Listado Compras</h3>
					<br />
					<c:if test="${!empty listCompras}">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<tr class="active success">
									<th>Fecha</th>
									<th>Acciones</th>
								</tr>
								<c:forEach items="${listCompras}" var="compra">
									<tr>
										<td><c:out value="${compra.fecha}" /></td>
										<td align="center"><a style="padding: 5px; color: gray"
											href="<c:url value='/editCompra/${compra.id}' />"><span
												class="glyphicon glyphicon-edit"></span></a> <a
											style="padding: 5px; color: gray;"
											href="<c:url value='/removeCompra/${compra.id}' />"><span
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
