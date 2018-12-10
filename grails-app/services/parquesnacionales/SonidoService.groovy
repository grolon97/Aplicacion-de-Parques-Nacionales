package parquesnacionales

import grails.gorm.services.Service

@Service(Sonido)
interface SonidoService {

    Sonido get(Serializable id)

    List<Sonido> list(Map args)

    Long count()

    void delete(Serializable id)

    Sonido save(Sonido sonido)

}