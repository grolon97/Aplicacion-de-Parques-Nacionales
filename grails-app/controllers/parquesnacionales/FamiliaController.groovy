package parquesnacionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class FamiliaController {

    FamiliaService familiaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond familiaService.list(params), model:[familiaCount: familiaService.count()]
    }

    def show(Long id) {
        respond familiaService.get(id)
    }

    def create() {
        respond new Familia(params)
    }

    def save(Familia familia) {
        if (familia == null) {
            notFound()
            return
        }

        try {
            familiaService.save(familia)
        } catch (ValidationException e) {
            respond familia.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'familia.label', default: 'Familia'), familia.id])
                redirect familia
            }
            '*' { respond familia, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond familiaService.get(id)
    }

    def update(Familia familia) {
        if (familia == null) {
            notFound()
            return
        }

        try {
            familiaService.save(familia)
        } catch (ValidationException e) {
            respond familia.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'familia.label', default: 'Familia'), familia.id])
                redirect familia
            }
            '*'{ respond familia, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        familiaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'familia.label', default: 'Familia'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'familia.label', default: 'Familia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
