package parquesnacionales

class Imagen {
    String url
    static belongsTo = [especie:Especie]
    static constraints = {
    }

    String toString(){
        return url
    }
}
