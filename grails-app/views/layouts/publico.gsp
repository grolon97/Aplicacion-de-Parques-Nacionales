<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Parques Nacionales"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="bootstrap.js"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet"> 
    <g:layoutHead/>
    <style>
       #boton-login{
          background-color:#343a40;
          border-color:#888;
       }
    </style>
</head>
<body>


       <!-- comienzo NAVBAR -->
 <nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top">
        <a class="navbar-brand" href="#" style="padding:0">
    <g:img dir="images"  file="admin-parques-logowhite100x100.png" width="50" height="50" class="d-inline-block align-top" />
        <a class="navbar-brand" href="/" style="margin-left:0px; padding-left:0px">APN</a>
        <ul class="navbar-nav mr-auto">

         <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Ver Parques
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <g:link controller="public" action="mostrarAreasP" class="dropdown-item">Listado</g:link>
                  <g:link controller="public" action="cartasAreas" class="dropdown-item">Ficha</g:link>
                  <a class="dropdown-item" href="#">Mapa</a>
                </div>
         </li>
         <li>
            <a class="nav-link" href="#">Sobre Parques Nacionales</a>
         </li>
        </ul>    
        <ul class="nav navbar-nav my-2">
            
        <g:link controller="login" action="index"> 
            <li><button class="navbar-btn btn btn-primary-outline nav-link" id="boton-login" name="login" value="Login">Login</button></li>
        </g:link>    
        </ul>     
    </nav> <!-- cierre NAVBAR -->

    <g:layoutBody/>


</body>
</html>
