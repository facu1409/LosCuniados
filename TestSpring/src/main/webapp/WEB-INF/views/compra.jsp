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
			
		
			$(document).ready(function () {
			//Cargo fecha de hoy
			var today = new Date();
		    var dd = today.getDate();
		    var mm = today.getMonth()+1; //January is 0!

		    var yyyy = today.getFullYear();
		    if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 
		    var today = dd+'/'+mm+'/'+yyyy;
		    document.getElementById("fecha").value = today;
		    
		    //Validaciones
		    $('#facturaForm').validate({	    	
		        rules: {
		        	fecha: {		               
		        		required: true
		            },
		            nombre_cliente: {
		                minlength: 2,
		                required: true
		            },
		            prod_desc: {		               
		                required: true
		            },
		            prod_precio: {
		                required: true,
		                number: true
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
			var apellido = $('#apellido_' + idProveedor).html();
			var nombre_apellido = nombre + ' ' + apellido;
			$('#nombre_proveedor').val(nombre_apellido);
			$('#modalProveedores').modal('toggle');
		});

		var idProd;
		$(document).on("click", "#btn_selectProd", function(event) {
			idProd = $('input[name=radiosProducto]:checked').val();
			var descripcion = $('#descripcion_' + idProd).html();
			var stock = $('#stock_' + idProd).html();
			$('#prod_desc').val(descripcion);
			$('#modalProductos').modal('toggle');
		});

				
		
		//Eliminar Linea de Compra
		var id_linea;		
		$(document).on("click", ".claseLinea", function(event) {
			id_linea = $(this).attr('id');	
				
			var totalLinea = $('#inputTotal_'+id_linea).val();
			
			var trLinea = $('#linea_'+id_linea);
			
			$(trLinea).remove();
			
			monto = $('#monto').val();			
			monto = monto - totalLinea;	
			$('#monto').val(monto);
		});

		//Agregar Linea de Compra
		var monto = 0;
		var i = 0;
		$(document).on("click",'#btn_agregarLinea', function() {
							
			var precioUn = $("#prod_precio").val();
			var cant = $("#cant").val();
			var total = cant * precioUn;
			
			var $row = $('<tr id="linea_'+i+'">'
					+ '<td><input style=" border: none;" readonly="readonly" name="lineaCompra['+i+'].id_producto" value="'+idProd+'" /></td>'
					+ '<td><input style=" border: none;" readonly="readonly" name="lineaCompra['+i+'].cantidad" value="'+cant+'" /></td>'
					+ '<td><input style=" border: none;" readonly="readonly" name="lineaCompra['+i+'].precio_unitario" value="'+precioUn+'" /></td>'
					+ '<td><input id="inputTotal_'+i+'" style=" border: none;" readonly="readonly" name="lineaCompra['+i+'].total" value="'+total+'" /></td>'
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
 								<div class="col-md-3"> 
 									<div class="form-group"> 
 										<form:input id="idProveedor" type="hidden" path="idProveedor" />
 										<label class="control-label">Proveedor:</label><br />
 										<div class="input-group">
 											<input type="text" id="nombre_proveedor" class="form-control"
 												placeholder="Buscar..."> 
 												<span
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
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label">Precio:</label><br /> <input
											id="prod_precio" type="text" class="form-control">
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
											<th>Precio</th>
											<th>Total</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${compra.lineasCompra}" var="lineaCompra"
											varStatus="status">
											<tr>
												<td align="center">${status.count}</td>
												<td><input  readonly="readonly"
													name="lineasCompra[${status.index}].id_producto"
													value="${lineaCompra.idProducto}" /></td>
												<td><input readonly="readonly"
													name="lineasCompra[${status.index}].precio_unitario"
													value="${lineaCompra.precioUnitario}" /></td>
												<td><input readonly="readonly"
													name="lineasCompra[${status.index}].cantidad"
													value="${lineaCompra.cantidad}" /></td>
												<td><input readonly="readonly" id="inputTotal_${status.index}"
													name="lineasCompra[${status.index}].total"
													value="${lineaCompra.total}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
									<c:if test="${compra.id > 0}">
										<input class="btn btn-primary" type="submit" value="Editar" />
									</c:if>
									<c:if test="${compra.id == 0}">
										<input class="btn btn-success" type="submit" value="Agregar" />
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
