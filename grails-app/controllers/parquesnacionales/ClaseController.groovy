package parquesnacionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ClaseController {

    ClaseService claseService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond claseService.list(params), model:[claseCount: claseService.count()]
    }

    def show(Long id) {
        respond claseService.get(id)
    }

    def create() {
        respond new Clase(params)
    }

    def save(Clase clase) {
        if (clase == null) {
            notFound()
            return
        }

        try {
            claseService.save(clase)
        } catch (ValidationException e) {
            respond clase.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clase.label', default: 'Clase'), clase.id])
                redirect clase
            }
            '*' { respond clase, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond claseService.get(id)
    }

    def update(Clase clase) {
        if (clase == null) {
            notFound()
            return
        }

        try {
            claseService.save(clase)
        } catch (ValidationException e) {
            respond clase.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'clase.label', default: 'Clase'), clase.id])
                redirect clase
            }
            '*'{ respond clase, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        claseService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'clase.label', default: 'Clase'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clase.label', default: 'Clase'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
