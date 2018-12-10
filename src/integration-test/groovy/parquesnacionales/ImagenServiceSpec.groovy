package parquesnacionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ImagenServiceSpec extends Specification {

    ImagenService imagenService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Imagen(...).save(flush: true, failOnError: true)
        //new Imagen(...).save(flush: true, failOnError: true)
        //Imagen imagen = new Imagen(...).save(flush: true, failOnError: true)
        //new Imagen(...).save(flush: true, failOnError: true)
        //new Imagen(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //imagen.id
    }

    void "test get"() {
        setupData()

        expect:
        imagenService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Imagen> imagenList = imagenService.list(max: 2, offset: 2)

        then:
        imagenList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        imagenService.count() == 5
    }

    void "test delete"() {
        Long imagenId = setupData()

        expect:
        imagenService.count() == 5

        when:
        imagenService.delete(imagenId)
        sessionFactory.currentSession.flush()

        then:
        imagenService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Imagen imagen = new Imagen()
        imagenService.save(imagen)

        then:
        imagen.id != null
    }
}
