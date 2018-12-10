package parquesnacionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class LogoController {

    LogoService logoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond logoService.list(params), model:[logoCount: logoService.count()]
    }

    def show(Long id) {
        respond logoService.get(id)
    }

    def create() {
        respond new Logo(params)
    }

    def save(Logo logo) {
        if (logo == null) {
            notFound()
            return
        }

        try {
            logoService.save(logo)
        } catch (ValidationException e) {
            respond logo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'logo.label', default: 'Logo'), logo.id])
                redirect logo
            }
            '*' { respond logo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond logoService.get(id)
    }

    def update(Logo logo) {
        if (logo == null) {
            notFound()
            return
        }

        try {
            logoService.save(logo)
        } catch (ValidationException e) {
            respond logo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'logo.label', default: 'Logo'), logo.id])
                redirect logo
            }
            '*'{ respond logo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        logoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'logo.label', default: 'Logo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'logo.label', default: 'Logo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
