<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="privado" />
        <g:set var="entityName" value="${message(code: 'genero.label', default: 'Genero')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-genero" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class=" fa fa-list solo" action="index">  Listar Generos</g:link></li>
                <li><g:link class="fa fa-plus solo" action="create">  Agregar Genero</g:link></li>
            </ul>
        </div>
        <div id="show-genero" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="genero" />
            <g:form resource="${this.genero}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.genero}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
