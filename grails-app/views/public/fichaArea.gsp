<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="publico" />
    <title>${area.nombre}</title>
    <asset:stylesheet src="bootstrap.min.css" />
    <asset:javascript src="bootstrap.bundle.min.js" />
    <asset:javascript src="bootstrap.bundle.js" />
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.css' rel='stylesheet' />
    <style>
      #imagen-parquenacgen{
        background-image:url('${resource(dir: "images", file: "ruta-parquedark.jpg")}'); 
        background-size: cover; 
      }
      #container-busqueda{
          margin-top:0 auto;
          padding-top:15px;
          padding-bottom:15px;
          background-color:#343a40;
          color:whitesmoke;
      }
      #imagen-parquenacesp{
        background: linear-gradient(rgba(0, 0, 0, 0.5), 
                        rgba(0, 0, 0, 0.5)
                        ), url('${area.imagen}');
        background-size: cover;
      }
      .jumbotron{
        background:none;
      }
      .btn.btn-primary{
        background: #f0ad4e;
        border-color: #f0ad4e;
        color: #ffffff;
      }
      .card{
          border-radius:0px;
          border:none;
         /* box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);*/
      }
      .card-header{
          background-color:#f0ad4e;
      }
      .card-header h5{
          color:whitesmoke;
      }
      .card-body{
          font-size:1.2em;
      }
      
    </style>
</head>
<body>
    <!-- si no se encuentra una imagen disponible para el parque, uno generico en el jumbotron -->
    <g:if test="${area.imagen==' '}">
            <div class="jumbotron jumbotron-fluid">
                <div class="container-fluid" id="jum-container">
                    <h1 class="display-4">${area.nombre}</h1>
                </div>
            </div>
    </g:if>
    <g:else>
            <div class="jumbotron jumbotron-fluid" id="imagen-parquenacesp">
                <div class="container-fluid" id="jum-container">
                    <h1 class="display-4" style="color:whitesmoke;">${area.nombre}</h1>
                </div>
            </div>      
        <!--   -->
    </g:else>

    <div class="container">
            <div class="row row-eq-height">  
             <div class="col-md-3">   
               <img src="${area.logo.url}" class="img-fluid imagen img-responsive" alt="Responsive image"/>
             </div> 
             <div class="col-md-9 align-self-center">
               <div class="card">
                  <div class="card-header">
                        <h5 class="card-title">Información del Parque</h5>  
                  </div> 
                  <div class="card-body">
                    <h6 class="card-subtitle mb-2 text-muted">Descripción</h6>
                    <p class="card-text">El <strong>Parque Nacional ${area.nombre}</strong> se encuentra ubicado en la provincia de <b>${area.provincia}</b>,
                      en la localidad de <b>${area.localidad}</b>. Fue creado en <b>${area.creacion}</b> y cuenta con una 
                      superficie de <b>${area.superficie} km<sup>2</sup></b>. <br/><br/>
                  </div>
              </div>
             </div>
            </div>                   

        <div class="row" style="margin-top:30px">
              <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Datos del Parque</h5>
                    </div>    
                    <div class="card-body">
                      <h6 class="card-subtitle mb-2 text-muted">Descripción</h6>
                      <p class="card-text">Latitud: ${area.latitud}</p>
                      <p class="card-text">Longitud: ${area.longitud}</p>
                      <g:if test="{area.objetivos != null}">
                                 <p class="card-text">Listado de Objetivos:</p> 
                                    <g:each in="${area.objetivos}" var="o">
                                        <p class="card-text">&nbsp;&nbsp; ${o.descripcion}</p>
                                    </g:each>
                      </g:if>
                             <g:else><p class="card-text">Este area no tiene objetivos</p></g:else>

                    </div>
                </div>
              </div>
              <div class="col-md-6 align-self-center">
                 <div id="map" style="height:425px;width:500px;"></div>
                 <script>
                        mapboxgl.accessToken = 'pk.eyJ1IjoiZ3JvbG9uIiwiYSI6ImNqbGR6bmxvMzAwdDAzdmw1dnk5Mzl5bWYifQ.FSVBSNw_PPQLZ9BU4WFDBg';
                        var map = new mapboxgl.Map({
                            container: 'map', // container id
                            style: 'mapbox://styles/mapbox/streets-v9', // stylesheet location
                            center: ['${area.longitud}', '${area.latitud}'], // starting position [lng, lat]
                            zoom: 9 // starting zoom
                        });
                 </script>  
              </div>  
        </div> 
    </div>
    <hr/>

    <div class="container-fluid" id="container-busqueda">
     <div class="row">
        <div class="col-md-7">     
            <h3>Listado de Especies</h3>
        </div>     
        <g:form class="form-inline" controller="public" params="[areaID:area.id]">
         <div class="col text-right align-self-center"> 
            <g:select class="form-control" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" 
             name="opcionSeleccionada" from="${['Categoría ','Reino', 'Clase']}" /> 
         </div>
         <div class="col"> 
                <g:textField class="form-control" name="textoBusqueda" value="${textoBusqueda}" />
         </div>
         <div class="col">                   
                <g:actionSubmit class="btn btn-primary" value="Buscar" action="filtrarEspecies" />
         </div>
        </g:form>
      </div>  
      </div>    
    </div>    
      <div class="container-fluid">
          <ul>
             <g:each in="${listadoEspecies}" var="especie">
                <li><g:link action="fichaEspecie" params="[identificador : especie.id]" >${especie.nombreCientifico}</g:link></li>
             </g:each>
         </ul>
      </div>

    <!-- 
        
        DISEÑO 
        BOOTSTRAP 4 
    
    --> 
</body>
</html>