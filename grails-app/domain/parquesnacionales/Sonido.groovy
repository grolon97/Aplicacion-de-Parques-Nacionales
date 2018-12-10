package parquesnacionales

class Sonido {
    String url
    static belongsTo = [especie:Especie]
    static constraints = {
    }

    String toString(){
        return url
    }
}
