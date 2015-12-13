<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html> 
	<head>
		<title>Página de Login</title>

		<style>
		.error {
			padding: 15px;
			margin-bottom: 20px;
			border: 1px solid transparent;
			border-radius: 4px;
			color: #a94442;
			background-color: #f2dede;
			border-color: #ebccd1;
		}

		.msg {
			padding: 15px;
			margin-bottom: 20px;
			border: 1px solid transparent;
			border-radius: 4px;
			color: #31708f;
			background-color: #d9edf7;
			border-color: #bce8f1;
		}

		#login-box {
			width: 320px;
			padding: 20px;
			margin: 0px auto;
			background: #fff;
			-webkit-border-radius: 2px;
			-moz-border-radius: 2px;
			border: 1px solid #000;
		}

	</style>

</head>

<body onload='document.loginForm.username.focus();'>

 	<!--  -->
	<div align="center">
		<img src="<c:url value="../LosCunia/resources/images/logotipo.png" />" width="250" height="250" >
	</div>
	
	<div id="login-box">

		<h3>Ingresar usuario y contraseña</h3>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
			action="<c:url value='/j_spring_security_check' />" method='POST'>

			<table>
				<tr>
					<td>Usuario:</td>
					<td><input type='text' name='username'></td>
				</tr>
				<tr>
					<td>Contraseña:</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td colspan='2'><input name="submit" type="submit"
						value="Aceptar" /></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>
<jsp:include page="/WEB-INF/views/importLibrerias.jsp"></jsp:include>
</body>
</html>
