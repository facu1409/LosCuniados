<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
	padding-top: 80px
		/* Es lo que mide la navbar, para que el texto no se vaya detras, en caso de Fixed*/
}
</style>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Menu</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index"> Inicio <%--                     <img style="color: white;width: 50%;height: 50%" src="<c:url value="/resources/images/carro.png" />" alt=""> --%>
			</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="clientes">Clientes</a></li>
				<li><a href="productos">Productos</a></li>
				<li><a href="proveedores">Proveedores</a></li>
				<li><a href="facturas">Facturas</a></li>
				<li><a href="compras">Compras</a></li>
				<li><a href="<c:url value="j_spring_security_logout" />">Logout</a></li>
			</ul>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</div>
</nav>
