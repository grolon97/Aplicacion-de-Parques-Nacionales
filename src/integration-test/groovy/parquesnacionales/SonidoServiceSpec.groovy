package parquesnacionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SonidoServiceSpec extends Specification {

    SonidoService sonidoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Sonido(...).save(flush: true, failOnError: true)
        //new Sonido(...).save(flush: true, failOnError: true)
        //Sonido sonido = new Sonido(...).save(flush: true, failOnError: true)
        //new Sonido(...).save(flush: true, failOnError: true)
        //new Sonido(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //sonido.id
    }

    void "test get"() {
        setupData()

        expect:
        sonidoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Sonido> sonidoList = sonidoService.list(max: 2, offset: 2)

        then:
        sonidoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        sonidoService.count() == 5
    }

    void "test delete"() {
        Long sonidoId = setupData()

        expect:
        sonidoService.count() == 5

        when:
        sonidoService.delete(sonidoId)
        sessionFactory.currentSession.flush()

        then:
        sonidoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Sonido sonido = new Sonido()
        sonidoService.save(sonido)

        then:
        sonido.id != null
    }
}
