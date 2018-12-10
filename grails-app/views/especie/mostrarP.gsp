<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="publico" />
        <g:set var="entityName" value="${message(code: 'especie.label', default: 'Especie')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-especie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <!--<ul>
                <li><g:link class="create" action="create"> Agregar Area Protegida</g:link></li>
            </ul>-->
        </div>
        <div id="list-especie" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${especieList}" />

            <div class="pagination">
                <g:paginate total="${especieCount ?: 0}" />
            </div>
        </div>
    </body>
</html>