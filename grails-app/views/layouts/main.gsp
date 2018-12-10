<!doctype html>
<html lang="en" class="no-js">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Parques Nacionales"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
    <!--style=background-image:"woods-wallpaper.jpg"-->
</head>
<body >
        <div class="container">
                
                <!-- Second navbar for sign in -->
                <nav class="navbar navbar-default navbar-fixed-top">
                  <div class="container">
                    <!-- Brand and toggle get grouped for better mobile nd</adisplay -->
                    <div class="navbar-header">
                      <!--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>-->
                      <a class="navbar-brand" href="/"> <asset:image src="hoja-logo.png" class="img-rounded" alt="Parques Nacionales" style="width:60px;height:60px"/>  </a>
                    </div>
                
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-collapse-2">
                      <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Areas Protegidas</a></li>
                        <li><a href="#">Especies</a></li>
                        <li><a href="#">¿Quiénes somos?</a></li>
                        <li>
                          <a class="btn btn-default btn-outline btn-circle"  href="${createLink(controller:'login',action:'login')}">Identificarse</a>
                        </li>
                      </ul>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container -->
                </nav><!-- /.navbar -->

    <div style="margin:100px"></div>
    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
