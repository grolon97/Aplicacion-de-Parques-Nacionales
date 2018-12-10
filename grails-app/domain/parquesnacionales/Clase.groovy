package parquesnacionales

class Clase {
    String nombre;
    static hasMany = [ordenes:Orden];
    static constraints = {
        nombre()
        ordenes()
    }

    String toString(){
        return nombre
    }
}
