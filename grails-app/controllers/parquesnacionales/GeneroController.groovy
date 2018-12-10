package parquesnacionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class GeneroController {

    GeneroService generoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond generoService.list(params), model:[generoCount: generoService.count()]
    }

    def show(Long id) {
        respond generoService.get(id)
    }

    def create() {
        respond new Genero(params)
    }

    def save(Genero genero) {
        if (genero == null) {
            notFound()
            return
        }

        try {
            generoService.save(genero)
        } catch (ValidationException e) {
            respond genero.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'genero.label', default: 'Genero'), genero.id])
                redirect genero
            }
            '*' { respond genero, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond generoService.get(id)
    }

    def update(Genero genero) {
        if (genero == null) {
            notFound()
            return
        }

        try {
            generoService.save(genero)
        } catch (ValidationException e) {
            respond genero.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'genero.label', default: 'Genero'), genero.id])
                redirect genero
            }
            '*'{ respond genero, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        generoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'genero.label', default: 'Genero'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'genero.label', default: 'Genero'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
