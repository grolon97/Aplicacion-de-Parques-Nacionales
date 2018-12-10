<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="privado" />
        <g:set var="entityName" value="${message(code: 'familia.label', default: 'Familia')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-familia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class=" fa fa-list solo" action="index">  Listar Familias</g:link></li>
                <li><g:link class="fa fa-plus solo" action="create">  Agregar Familia</g:link></li>
            </ul>
        </div>
        <div id="edit-familia" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.familia}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.familia}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.familia}" method="PUT">
                <g:hiddenField name="version" value="${this.familia?.version}" />
                <fieldset class="form">
                    <f:all bean="familia"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>