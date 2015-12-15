<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login</title>
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

#login-box {
	width: 350px;
	padding: 20px;
	margin: 100px auto;
	margin-top: 10px;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
	background: #fff;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<div align="center">
		<img src="<c:url value="../LosCunia/resources/images/logotipo.png" />"
			width="30%">
	</div>

	<div id="login-box">

		<h3>Ingresar usuario y contrase�a</h3>

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
					<td>Contrase�a:</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr align="right">
					<td colspan='2'><input class="btn btn-default" name="submit"
						type="submit" value="Ingresar" /></td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>	
</body>
</html>
