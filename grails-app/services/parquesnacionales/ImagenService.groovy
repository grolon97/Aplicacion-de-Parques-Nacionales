package parquesnacionales

import grails.gorm.services.Service

@Service(Imagen)
interface ImagenService {

    Imagen get(Serializable id)

    List<Imagen> list(Map args)

    Long count()

    void delete(Serializable id)

    Imagen save(Imagen imagen)

}