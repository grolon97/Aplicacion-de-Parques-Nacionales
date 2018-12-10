package parquesnacionales

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class LogoServiceSpec extends Specification {

    LogoService logoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Logo(...).save(flush: true, failOnError: true)
        //new Logo(...).save(flush: true, failOnError: true)
        //Logo logo = new Logo(...).save(flush: true, failOnError: true)
        //new Logo(...).save(flush: true, failOnError: true)
        //new Logo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //logo.id
    }

    void "test get"() {
        setupData()

        expect:
        logoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Logo> logoList = logoService.list(max: 2, offset: 2)

        then:
        logoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        logoService.count() == 5
    }

    void "test delete"() {
        Long logoId = setupData()

        expect:
        logoService.count() == 5

        when:
        logoService.delete(logoId)
        sessionFactory.currentSession.flush()

        then:
        logoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Logo logo = new Logo()
        logoService.save(logo)

        then:
        logo.id != null
    }
}
