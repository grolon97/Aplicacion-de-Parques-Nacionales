package parquesnacionales

import grails.gorm.services.Service

@Service(Clase)
interface ClaseService {

    Clase get(Serializable id)

    List<Clase> list(Map args)

    Long count()

    void delete(Serializable id)

    Clase save(Clase clase)

}