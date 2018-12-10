package parquesnacionales

class Objetivo {
    String descripcion
    static hasMany = [areas:AreaProtegida]
    static belongsTo = AreaProtegida
    static constraints = {
        descripcion()
        areas()
    }

    String toString(){
        return descripcion
    }
}
