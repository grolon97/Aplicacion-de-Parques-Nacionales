package parquesnacionales

class Especie {
    String reino
    String especie
    String nombreCientifico
    String origen
    boolean endemica
    String nombreComun
    Genero genero
    static belongsTo = [AreaProtegida, Genero]
    static hasMany = [habitats:AreaProtegida, sonidos:Sonido, imagenes:Imagen]
    static constraints = {
        especie()
        reino()
        nombreCientifico()
        nombreComun()
        genero()
        endemica()
        habitats()
        sonidos()
        imagenes()
    }

    String toString(){
        return nombreCientifico
    }
}
