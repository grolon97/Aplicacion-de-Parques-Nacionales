package parquesnacionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SonidoController {

    SonidoService sonidoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond sonidoService.list(params), model:[sonidoCount: sonidoService.count()]
    }

    def show(Long id) {
        respond sonidoService.get(id)
    }

    def create() {
        respond new Sonido(params)
    }

    def save(Sonido sonido) {
        if (sonido == null) {
            notFound()
            return
        }

        try {
            sonidoService.save(sonido)
        } catch (ValidationException e) {
            respond sonido.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sonido.label', default: 'Sonido'), sonido.id])
                redirect sonido
            }
            '*' { respond sonido, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond sonidoService.get(id)
    }

    def update(Sonido sonido) {
        if (sonido == null) {
            notFound()
            return
        }

        try {
            sonidoService.save(sonido)
        } catch (ValidationException e) {
            respond sonido.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sonido.label', default: 'Sonido'), sonido.id])
                redirect sonido
            }
            '*'{ respond sonido, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        sonidoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sonido.label', default: 'Sonido'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sonido.label', default: 'Sonido'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
