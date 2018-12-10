package parquesnacionales

class AreaProtegida {
    String nombre
    String creacion
    String superficie
    String latitud
    String longitud
    String localidad
    String provincia
    String imagen
    Logo logo
    static hasMany = [especies:Especie, objetivos:Objetivo]
    static constraints = {
        nombre()
        creacion()
        superficie()
        provincia()
        localidad()
        latitud()
        longitud()
        especies()
        objetivos()
        logo()
        imagen()

    }
    String toString(){
        return nombre;
    }
}
