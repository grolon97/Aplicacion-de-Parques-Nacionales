<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="sb-admin.css" />
    <asset:javascript src="bootstrap.js"/>
     
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Parques Nacionales"/>
    </title>

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc= sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous"-->
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
    <style>
        #boton-salir{
            background-color:#343a40;
            border-color:#888;
        } 
        #wrapper{
            background-color: #343a40;
        }
        .sidebar-sticky-left {
        position: -webkit-sticky;
        position: sticky;
        top: 0;
        }
    </style>
    <!--style=background-image:"woods-wallpaper.jpg"-->
    
</head>
<body>

              <!-- comienzo NAVBAR -->
 <nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top">
        <a class="navbar-brand" href="#" style="padding:0">
    <g:img dir="images"  file="admin-parques-logowhite100x100.png" width="50" height="50" class="d-inline-block align-top" />
        <a class="navbar-brand" href="#" style="margin-left:0px; padding-left:0px">APN</a>
        <ul class="navbar-nav mr-auto">
         <li>
            <a class="nav-link" href="/p">ACCESO ADMINISTRADOR<span class="sr-only">(current)</span></a> 
         </li>
        </ul>    
        <ul class="nav navbar-nav my-2">
            
        <g:link controller="login" action="index"> 
            <li><button class="navbar-btn btn btn-primary-outline nav-link" id="boton-salir" name="logout" value="Salir">Salir</button></li>
        </g:link>    
        </ul>     
    </nav> <!-- cierre NAVBAR -->
    
 
    <div class="container-fluid"> <!--comienzo contenido debajo de NAVBAR-->
        <div class="row">
            <div class="col-md-2 col-xs-2" style="padding:0;margin:0"> <!--comienzo SIDEBAR-->                    
                <div id="wrapper" class="sidebar-sticky-left"> 
                    <div id="content-wrapper">
                            <ul class="sidebar navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                    <i class="fas fa-fw fa-tachometer-alt"></i>
                                    <span>Categorías:</span>
                                </a>
                                </li>                
                                <li class="nav-item">
                                <a class="nav-link" href="${createLink(controller:'areaProtegida',action:'index')}">
                                    <i class="fas fa-fw fa-tachometer-alt"></i>
                                    <span>Areas Protegidas</span>
                                </a>
                                </li>
                                <li class="nav-item">
                                <a class="nav-link" href="${createLink(controller:'especie',action:'index')}">
                                    <i class="fas fa-fw fa-chart-area"></i>
                                    <span>Especies</span></a>
                                </li>
                                <li class="nav-item">
                                <a class="nav-link" href="${createLink(controller:'objetivo',action:'index')}">
                                    <i class="fas fa-fw fa-table"></i>
                                    <span>Objetivos</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${createLink(controller:'logo',action:'index')}">
                                    <i class="fas fa-fw fa-table"></i>
                                    <span>Logos</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${createLink(controller:'genero',action:'index')}">
                                    <i class="fas fa-fw fa-table"></i>
                                    <span>Genero</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${createLink(controller:'clase',action:'index')}">
                                    <i class="fas fa-fw fa-table"></i>
                                    <span>Clase</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${createLink(controller:'orden',action:'index')}">
                                    <i class="fas fa-fw fa-table"></i>
                                    <span>Orden</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${createLink(controller:'familia',action:'index')}">
                                    <i class="fas fa-fw fa-table"></i>
                                    <span>Familia</span></a>
                                </li>
                            </ul>
                    </div>
                </div>
            </div> <!--fin SIDEBAR-->

         
    
            <g:layoutBody/>
    

        </div>
    </div>
</body>
</html>