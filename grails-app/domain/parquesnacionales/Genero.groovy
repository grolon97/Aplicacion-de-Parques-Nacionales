package parquesnacionales

class Genero {
    String nombre
    static hasMany = [especies:Especie];
    static belongsTo = Familia;
    static constraints = {
        nombre()
        especies()
    }

    String toString(){
        return nombre
    }
}
