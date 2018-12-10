<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="privado"/>
        <g:set var="entityName" value="${message(code: 'areaProtegida.label', default: 'AreaProtegida')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="admin.css" />
    </head>

    <body>
    


       <div class="col-md-10 col-xs-10" style="padding-top:15px;padding-left:30px;margin:0">
        <div class="nav" role="navigation">
            <g:link class="fa fa-plus solo" action="create"><button class="btn">Agregar Área Protegida</button></g:link>

        </div>
        <div id="list-areaProtegida" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
               <div class="message" role="status">${flash.message}</div>
            </g:if>
        
            <f:table collection="${areaProtegidaList}" />
        
            <div class="pagination">
                <g:paginate total="${areaProtegidaCount ?: 0}" />
            </div>
        </div>
       </div>

    
    
    </body>
</html>