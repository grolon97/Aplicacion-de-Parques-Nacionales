package parquesnacionales

class Orden {
    String nombre
    static hasMany = [familias:Familia]
    static belongsTo = Clase
    static constraints = {
        nombre()
        familias()
    }

    String toString(){
        return nombre
    }
}
