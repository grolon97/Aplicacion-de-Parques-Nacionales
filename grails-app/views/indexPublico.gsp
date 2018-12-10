<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="publico"/>
    <title>Administración de Parques Nacionales</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Bootstrap core CSS -->
        <asset:stylesheet src="bootstrap.min.css" />
        <!-- Custom styles for this template -->
        <asset:stylesheet src="half-slider.css" />
        <!-- Custom styles for this template -->
        <asset:stylesheet src="landing-page.min.css" />
  <style>
    #boton-ver{
      background: #f0ad4e none repeat scroll 0 0;
      border-color: #f0ad4e;
      color: #ffffff;
    }
  </style>      
</head>
<body>
   <!-- Página bienvenida a Parques Nacionales -->

   <header>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image:url('${resource(dir:"images",file:"parque1.jpg")}')">
     
              <div class="carousel-caption d-none d-md-block">
                <h3>First Slide</h3>
                <p>This is a description for the first slide.</p>
              </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image:url('${resource(dir:"images",file:"parque2.jpg")}')">
              <div class="carousel-caption d-none d-md-block">
                <h3>Second Slide</h3>
                <p>This is a description for the second slide.</p>
              </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image:url('${resource(dir:"images",file:"parque3.jpg")}')">
              <div class="carousel-caption d-none d-md-block">
                <h3>Third Slide</h3>
                <p>This is a description for the third slide.</p>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </header>
      <hr/>
      <!-- Image Showcases -->
      <section class="showcase">
          <div class="container-fluid p-0">
            <div class="row no-gutters">
    
              <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image:url('${resource(dir:"images",file:"parque1.jpg")}')"></div>
              <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                <h2>Administración de Parques Nacionales</h2>
                <p class="lead mb-0">El rol de la APN es gestionar un sistema de áreas protegidas como una de las herramientas de conservación fundamentales para el mantenimiento de la diversidad biológica, el patrimonio natural y cultural del país.
                    Debido a estas características, tiene una gran afluencia de turistas en modalidades como el campamentismo que facilitan el contacto con la naturaleza.
                 </p>
              </div>
            </div>
            <div class="row no-gutters">
              <div class="col-lg-6 text-white showcase-img" style="background-image:url('${resource(dir:"images",file:"parque2.jpg")}')"></div>
              <div class="col-lg-6 my-auto showcase-text">
                <h2>Explore los Parques</h2>
                <p class="lead mb-0">Además de los parques, existen alrededor de 250 predios protegidos que se encuentran bajo jurisdicción municipal, provincial o gestión privada. Son conocidos 
                    con diversas denominaciones.</p>   
              </div>
            </div>
            <div class="row no-gutters">
              <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image:url('${resource(dir:"images",file:"parque3.jpg")}')"></div>
              <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                  <h2>Explore los Parques</h2>
                  <p class="lead mb-0">Contamos con muchos parques</p> 
                  <g:link controller="public" action="mostrarAreasP"><button class="btn btn-primary" id="boton-ver">Ver Parques</button></g:link>
              </div>
            </div>
          </div>
        </section>
  
      <!-- Footer -->
      <footer class="footer bg-light">
        <div class="container">
          <p class="m-0 text-center text-dark">Copyright &copy; Your Website 2018</p>
        </div>
        <!-- /.container --> 
      </footer>
  
      <!-- esto despues se tiene que importar -->
      <!-- Bootstrap core JavaScript -->
      <asset:javascript src="jquery.min.js" />
      <asset:javascript src="bootstrap.bundle.min.js" />

</body>
</html>