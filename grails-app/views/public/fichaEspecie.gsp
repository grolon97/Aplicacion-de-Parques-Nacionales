<!DOCTYPE <!DOCTYPE html>
<html>
<head>    
    <title>Información de Especie</title>
    <meta name="layout" content="publico" />
    <asset:stylesheet src="application.css" />
    <asset:javascript src="application.js" />
</head>
<body>
    <!-- Ficha de la especie -->
    <div class="container" style="margin-top:20px">
      <div class="row">
          <div class="col">
             <h1 class="h1">${especieObject.nombreComun}</h1>
             <h2>${especieObject.nombreCientifico}</h2>
          </div>
          <div class="col">
           <g:set var="imagenes" value="${especieObject.imagenes}" />
        <g:if test="${imagenes != null}">   
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="${imagenes[0].url}" alt="First slide">      
                    </div>
                        <g:if test="${imagenes[1] != null}">                  
                            <div class="carousel-item">
                                <img class="d-block w-100" src="${imagenes[1].url}" alt="Second slide">      
                            </div>
                        </g:if>
                        <g:if test="${imagenes[2] != null}">                  
                            <div class="carousel-item">
                                <img class="d-block w-100" src="${imagenes[2].url}" alt="Third slide">      
                            </div>
                        </g:if>                     
                </div>       
            </div>
        </g:if>   
          </div>     
      </div>
    </div>
    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="bootstrap.bundle.min.js" />
</body>
</html>