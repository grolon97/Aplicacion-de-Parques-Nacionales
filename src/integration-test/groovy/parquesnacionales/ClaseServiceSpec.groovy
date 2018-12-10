package parquesnacionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ClaseServiceSpec extends Specification {

    ClaseService claseService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Clase(...).save(flush: true, failOnError: true)
        //new Clase(...).save(flush: true, failOnError: true)
        //Clase clase = new Clase(...).save(flush: true, failOnError: true)
        //new Clase(...).save(flush: true, failOnError: true)
        //new Clase(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //clase.id
    }

    void "test get"() {
        setupData()

        expect:
        claseService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Clase> claseList = claseService.list(max: 2, offset: 2)

        then:
        claseList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        claseService.count() == 5
    }

    void "test delete"() {
        Long claseId = setupData()

        expect:
        claseService.count() == 5

        when:
        claseService.delete(claseId)
        sessionFactory.currentSession.flush()

        then:
        claseService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Clase clase = new Clase()
        claseService.save(clase)

        then:
        clase.id != null
    }
}
