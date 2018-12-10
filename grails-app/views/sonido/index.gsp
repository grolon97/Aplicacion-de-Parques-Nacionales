<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="privado" />
        <g:set var="entityName" value="${message(code: 'sonido.label', default: 'Sonido')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="admin.css" />
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="fa fa-plus solo" action="create">  Agregar Sonido</g:link></li>
            </ul>
        </div>
        <div id="list-sonido" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${sonidoList}" />

            <div class="pagination">
                <g:paginate total="${sonidoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>