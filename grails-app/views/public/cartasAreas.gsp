<!DOCTYPE html>

<html>
<head>
    <meta name="layout" content="publico"/>
    
<style>
     .card{
         border-radius:none;
         margin-top:20px;
     }
     .pagination a{
         color:black;
     }
     .pagination a:hover{
         color:white;
         background-color:#212529;
     }
    .jumbotron{
       color:whitesmoke;
       background-image:url('${resource(dir:"images",file:"parque-valle-luna.jpg")}');
     }
     #jum-container{
         padding-left:40px;
     }
     .row{
         margin-top:10px;
     }
</style>    
</head>
<body>
        <div class="jumbotron jumbotron-fluid">
                <div class="container-fluid" id="jum-container">
                    <h1 class="display-4">Listado de Parques Nacionales</h1>
                </div>
                </div> 
        <hr/>      
        <div class="container">   
                <div class="row">  
                    <g:each var="i" in="${(0..2)}">
                      <g:each var="area" in="${listadoAreas}">  
                        <div class="col-md-4">  
                            <div class="card" style="width: 20rem;">
                                <img class="card-img-top" src="${area.imagen}" alt="Card image cap">
                                <div class="card-body text-center">
                                <h5 class="card-title">${area.nombre}</h5>
                                <p class="card-text">Descripción</p>
                                <g:link class="btn btn-primary" action="fichaArea" params="[areaID: area.id ]">Ver</g:link> 
                            </div>
                         </div>
                       </div>    
                      </g:each>
                    </g:each>
                </div>   
        </div>           
            <div class="container-fluid" style="margin-top:20px">
                <nav aria-label="Desplazamiento entre Parques">
                    <ul class="pagination justify-content-center">
                            <li class="page-item"><a class="page-link" href="#">Anterior</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><p class="texto-paginacion"><a class="page-link" href="#">Siguiente</a></p></li>
                    </ul>
                </nav>       
            </div> <!-- cierro CONTAINER -->    

</div>
</body>
</html>