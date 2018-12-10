<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="privado" />
        <g:set var="entityName" value="${message(code: 'especie.label', default: 'Especie')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-especie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="fa fa-list solo" action="index">   Listar Especies</g:link></li>
            </ul>
        </div>
        <div id="create-especie" class="content scaffold-create" role="main">
            <h1>Agregar Especie</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.especie}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.especie}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.especie}" method="POST">
                <fieldset class="form">
                    <f:all bean="especie"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Agregar" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
