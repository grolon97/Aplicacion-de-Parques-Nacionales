package parquesnacionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class EspecieServiceSpec extends Specification {

    EspecieService especieService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Especie(...).save(flush: true, failOnError: true)
        //new Especie(...).save(flush: true, failOnError: true)
        //Especie especie = new Especie(...).save(flush: true, failOnError: true)
        //new Especie(...).save(flush: true, failOnError: true)
        //new Especie(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //especie.id
    }

    void "test get"() {
        setupData()

        expect:
        especieService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Especie> especieList = especieService.list(max: 2, offset: 2)

        then:
        especieList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        especieService.count() == 5
    }

    void "test delete"() {
        Long especieId = setupData()

        expect:
        especieService.count() == 5

        when:
        especieService.delete(especieId)
        sessionFactory.currentSession.flush()

        then:
        especieService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Especie especie = new Especie()
        especieService.save(especie)

        then:
        especie.id != null
    }
}
