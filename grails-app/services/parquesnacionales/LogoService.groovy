package parquesnacionales

import grails.gorm.services.Service

@Service(Logo)
interface LogoService {

    Logo get(Serializable id)

    List<Logo> list(Map args)

    Long count()

    void delete(Serializable id)

    Logo save(Logo logo)

}