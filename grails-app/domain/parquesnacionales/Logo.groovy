package parquesnacionales

class Logo {
    String url
    static belongsTo = AreaProtegida
    static constraints = {
    }

    String toString(){
        return url
    }
}
