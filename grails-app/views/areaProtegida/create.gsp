<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="privado" />
        <g:set var="entityName" value="${message(code: 'areaProtegida.label', default: 'AreaProtegida')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-areaProtegida" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="fa fa-list solo" action="index">Listado Areas Protegidas</g:link></li>
            </ul>
        </div>
        <div  id="create-areaProtegida" class="content scaffold-create" role="main">
            <h1>Agregar Area Protegida</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.areaProtegida}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.areaProtegida}" var="error">
                <li><g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form class="form-group" resource="${this.areaProtegida}" method="POST">
                <fieldset class="form">
                   <f:all bean="areaProtegida" input-class="form-control"/>
                </fieldset>    
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Agregar" class="btn" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
