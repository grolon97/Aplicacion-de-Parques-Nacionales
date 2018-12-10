package parquesnacionales

import grails.gorm.services.Service

@Service(Genero)
interface GeneroService {

    Genero get(Serializable id)

    List<Genero> list(Map args)

    Long count()

    void delete(Serializable id)

    Genero save(Genero genero)

}