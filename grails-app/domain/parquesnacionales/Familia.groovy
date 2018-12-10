package parquesnacionales

class Familia {
    String nombre
    static hasMany = [generos:Genero];
    static belongsTo = Orden;
    static constraints = {
        nombre()
        generos()
    }

    String toString(){
        return nombre
    }
}
