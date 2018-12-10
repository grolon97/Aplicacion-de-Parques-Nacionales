package parquesnacionales

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class AutorizacionInterceptorSpec extends Specification implements InterceptorUnitTest<AutorizacionInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test autorizacion interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"autorizacion")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
