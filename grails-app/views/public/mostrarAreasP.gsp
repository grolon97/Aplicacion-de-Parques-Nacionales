<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="publico"/>

<style>
     .table{
         margin:0 auto;
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
</style>    
</head>
<body>
        <div class="jumbotron jumbotron-fluid">
                <div class="container-fluid" id="jum-container">
                    <h1 class="display-4">Listado de Parques Nacionales</h1>
                </div>
                </div> 
            
            <hr/>
            <div class="container-fluid">    
                    <table class="table table-borderless text-centered">
                            <thead class="thead-dark">
                            <tr>
                                <th>Nombre</th>
                                <th>Localidad</th>
                                <th>Provincia</th>
                                <th>Ficha</th>
                            </tr>
                            </thead>
                            <tbody>
                                <g:each in="${listadoAreas}" var="area" >
                                    <tr>
                                        <td>${area.nombre}</td>
                                        <td>${area.localidad}</td>
                                        <td>${area.provincia}</td>
                                        <td>
                                            <g:link action="fichaArea" params="[areaID: area.id]">
                                                    Ver
                                            </g:link> 
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
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