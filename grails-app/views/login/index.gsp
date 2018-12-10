<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="publico"/>
	<title>Login</title>
	<asset:stylesheet src="stylelogin.css" />
	<asset:stylesheet src="application.css" />
	<asset:javascript src="application.css" />
  <style>
      #container-imagen{
		background: linear-gradient(rgba(0, 0, 0, 0.3), 
		rgba(0, 0, 0, 0.3)
		), url('${resource(dir:"images",file:"cerro-hornacal.jpg")}');
         background-size: cover;
	  }
  </style>	
</head>
<body>
	 <!-- comienzo del LOGIN -->
	 <div class="container-fluid" id="container-imagen">
		<div class="login-form">
		<div class="main-div">
		<div class="panel" id="panel-login">
		<h2>Administrador</h2>
		<p>Por favor ingrese su Usuario y Contraseña</p>
		</div>
			<g:form action="login" name="loginform" id="Login" accept-charset="UTF-8" role="form">
				<fieldset>
					  <div class="form-group">
						<input class="form-control" placeholder="Usuario" name="username" type="text">
					  </div>
					<div class="form-group">
						<input class="form-control" placeholder="Contraseña" name="password" type="password">
					</div>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:submitButton name="Entrar" class="btn btn-primary" type="submit" value="Iniciar Sesión"/>
				</fieldset>
			</g:form>

			</div>
		</div>
		</div>
</body>
</html>