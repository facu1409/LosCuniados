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

		$(document).ready(
				function() {
					//Cargo fecha de hoy
					var today = new Date();
					var dd = today.getDate();
					var mm = today.getMonth() + 1; //January is 0!

					var yyyy = today.getFullYear();
					if (dd < 10) {
						dd = '0' + dd
					}
					if (mm < 10) {
						mm = '0' + mm
					}
					var today = dd + '/' + mm + '/' + yyyy;
					document.getElementById("fecha").value = today;

					//Validaciones
					$('#compraForm').validate(
							{
								rules : {
									fecha : {
										required : true
									},
									nombre_proveedor : {
										minlength : 2,
										required : true
									},
									prod_desc : {
										required : true
									},
									prod_precio : {
										required : true,
										number : true
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
			$('#idProveedor').val(idProveedor);
			var nombre = $('#nombre_' + idProveedor).html();
			$('#provNombre').val(nombre);
			$('#nombre_proveedor').val(nombre);
			$('#modalProveedores').modal('toggle');
		});

		var stock = 0;
		var descripcion;
		var idProducto;
		var detalle;
		$(document).on("click", "#btn_selectProd", function(event) {
			idProducto = $('input[name=radiosProducto]:checked').val();
			descripcion = $('#descripcion_' + idProducto).html();
			detalle = $('#detalle_' + idProducto).html();
			stock = $('#stock_' + idProducto).html();
			$('#prod_desc').val(descripcion);
			$('#modalProductos').modal('toggle');
		});

		//Eliminar Linea de Compra
		var id_linea;
		$(document).on("click", ".claseLinea", function(event) {
			id_linea = $(this).attr('id');

			var totalLinea = $('#inputTotal_' + id_linea).val();

			var trLinea = $('#linea_' + id_linea);

			$(trLinea).remove();

			monto = $('#monto').val();
			monto = monto - totalLinea;
			$('#monto').val(monto);
		});

		//Agregar Linea de Compra
		var monto = 0;
		var i = 0;
		$(document)
				.on(
						"click",
						'#btn_agregarLinea',
						function() {

							var precioUn = $("#prod_precio").val();
							var cant = $("#cant").val();
							var total = cant * precioUn;
							stock = parseInt(stock) + parseInt(cant);

							var $row = $('<tr id="linea_'+i+'">'
									+ '<input type="hidden" style=" border: none;" readonly="readonly" name="lineasCompra['+i+'].idProducto" value="'+idProducto+'" />'
									+ '<td><input style=" border: none;" readonly="readonly" name="lineasCompra['+i+'].descripcion" value="'+descripcion+'" /></td>'
									+ '<td><input style=" border: none;" readonly="readonly" name="lineasCompra['+i+'].cantidad" value="'+cant+'" /></td>'
									+ '<td><input style=" border: none;" readonly="readonly" name="lineasCompra['+i+'].precio_unitario" value="'+precioUn+'" /></td>'
									+ '<td><input id="inputTotal_'+i+'" style=" border: none;" readonly="readonly" name="lineasCompra['+i+'].total" value="'+total+'" /></td>'
// 									+ '<td><input style=" border: none;" readonly="readonly" name="lineasCompra['+i+'].stock" value="'+stock+'" /></td>'
									+ '<td><a class="claseLinea" id="'+i+'" style="padding: 5px; color: gray;cursor: pointer;"><span class="glyphicon glyphicon-remove"></span></a></td>'
									+ '</tr>');

							$('#tabla_compra> tbody:last').append($row);

							monto = monto + total;
							$('#monto').val(monto);
							i++;

						});
	</script>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
				<div class="panel-heading" style="font-size: 24px;">
						Compra
					</div>
					<div class="panel-body">						
						<c:url var="addAction" value="/compra/add"></c:url>
						<form:form id="compraForm" action="${addAction}"
							commandName="compra" modelAttribute="compra">
							<c:if test="${compra.id > 0}">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group has-default">
											<form:label class="control-label" for="id" path="id">ID:</form:label>

											<form:input class="form-control" id="id" path="id"
												readonly="true" size="8" disabled="true" />
											<form:hidden path="id" />
										</div>
									</div>
								</div>
							</c:if>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<form:label class="control-label" path="fecha">Fecha:</form:label>

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
										<form:input id="idProveedor" type="hidden" path="idProveedor" />
										<form:input id="provNombre" type="hidden" path="provNombre" />
										<label class="control-label">Proveedor:</label>
										<div class="input-group">
											<input type="text" id="nombre_proveedor"
												name="nombre_proveedor" class="form-control"
												placeholder="Buscar..."> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button"
													data-toggle="modal" data-target="#modalProveedores">
													&nbsp;<span class="glyphicon glyphicon-search"
														aria-hidden="true"></span>&nbsp;
												</button>
											</span>
										</div>
										<!-- /input-group  -->
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label">Producto:</label>
										<div class="input-group">
											<input id="prod_desc" name="prod_desc" type="text"
												class="form-control" placeholder="Buscar..."> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button"
													data-toggle="modal" data-target="#modalProductos">
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
										<label class="control-label">Cantidad:</label> <input
											id="cant" class="form-control input-number" value="1"
											type="number" name="quantity" min="1">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label">Precio:</label> <input
											id="prod_precio" name="prod_precio" type="number" step="0.01"
											class="form-control">
									</div>
								</div>
								<div class="col-md-3" style="padding-top: 25px">
									<div class="form-group">
										<button type="button" class="btn btn-primary"
											id="btn_agregarLinea">Agregar</button>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<table id="tabla_compra"
									class="table table-bordered table-hover">
									<thead>
										<tr class="active success">
											<!-- 											<th>IdProducto</th> -->
											<th>Producto</th>
											<th>Cantidad</th>
											<th>Precio</th>
											<th>Total</th>
											<!-- 											<th>Stock</th> -->
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${compra.lineasCompra}" var="lineaCompra"
											varStatus="status">
											<input type="hidden" readonly="readonly"
												name="lineasCompra[${status.index}].id_producto"
												value="${lineaCompra.idProducto}" />
											<tr>
												<td align="center">${status.count}</td>
												<td><input readonly="readonly"
													name="lineasCompra[${status.index}].descripcion"
													value="${lineaCompra.producto}" /></td>
												<td><input readonly="readonly"
													name="lineasCompra[${status.index}].precio_unitario"
													value="${lineaCompra.precioUnitario}" /></td>
												<td><input readonly="readonly"
													name="lineasCompra[${status.index}].cantidad"
													value="${lineaCompra.cantidad}" /></td>
												<td><input readonly="readonly"
													id="inputTotal_${status.index}"
													name="lineasCompra[${status.index}].total"
													value="${lineaCompra.total}" /></td>
												<!-- 												<td><input  readonly="readonly" -->
												<%-- 													name="lineasCompra[${status.index}].stock" --%>
												<%-- 													value="${lineaCompra.stock}" /></td>	 --%>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<form:label class="control-label" for="monto" path="monto">Total:</form:label>

										<form:input class="form-control" id="monto" path="monto"
											readonly="true" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<c:if test="${compra.id > 0}">
										<input class="btn btn-primary" type="submit" value="Editar" />
									</c:if>
									<c:if test="${compra.id == 0}">
										<input class="btn btn-success" type="submit" value="Comprar" />
									</c:if>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<!------------ Modal Seleccion Proveedores ------------------------------------------------------------------->
			<div class="modal fade" id="modalProveedores">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">Proveedores</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<c:if test="${!empty listProveedores}">
											<div class="table-responsive">
												<table class="table table-bordered table-hover">
													<tr class="active success">
														<th width="30px"></th>
														<th>CUIT</th>
														<th>Nombre</th>
													</tr>
													<c:forEach items="${listProveedores}" var="proveedor">
														<tr>
															<td><input type="radio" name="radiosProveedor"
																id="${proveedor.id}" value="${proveedor.id}" /></td>
															<td><c:out value="${proveedor.cuit}" /></td>
															<td id="nombre_${proveedor.id}"><c:out
																	value="${proveedor.nombre}" /></td>
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
														<th>Detalle</th>
														<th>Stock</th>
													</tr>
													<c:forEach items="${listProductos}" var="producto">
														<tr>
															<td><input type="radio" name="radiosProducto"
																id="${producto.id}" value="${producto.id}" /></td>
															<td id="descripcion_${producto.id}"><c:out
																	value="${producto.nombre}" /></td>
															<td id="detalle_${producto.id}"><c:out
																	value="${producto.detalle}" /></td>
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
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
				<div class="panel-heading" style="font-size: 24px;">
						Listado de Compras
					</div>
					<div class="panel-body">						
						<c:if test="${!empty listCompras}">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<tr class="active success">
										<th>Fecha</th>
										<th>Monto</th>
										<th>Proveedor</th>
										<th> </th>
									</tr>
									<c:forEach items="${listCompras}" var="compra">
										<tr>
											<td><c:out value="${compra.fecha}" /></td>
											<td><c:out value="${compra.monto}" /></td>
											<%-- 											<td><c:out value="${compra.idProveedor}" /></td> --%>
											<td><c:out value="${compra.provNombre}" /></td>
											<td align="center"><a
												style="padding: 5px; color: gray; cursor: pointer;"
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
	</div>
</body>
</html>
