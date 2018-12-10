package parquesnacionales

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
class PublicController {
    AreaProtegidaService areaProtegidaService
    EspecieService especieService




    private def returnAreaProtegida(def identificador){
        def areaP = AreaProtegida.get(identificador)
        return areaP
    }

    def mostrarAreasP(){
        return [listadoAreas: AreaProtegida.list()]
    }

    def cartasAreas(){
        return [listadoAreas: AreaProtegida.list()]
    }    

    def fichaArea(){
       def areaProtegida = returnAreaProtegida(params.areaID)
        def especiesArea = null
            println areaProtegida.nombre  
         if(!areaProtegida.especies){
             println "NO SE HAN ENCONTRADO ESPECIES"
         } else{
             especiesArea = areaProtegida.especies
         }
        if(!areaProtegida){
            render("Área no encontrada")
        }else{
            return [area:areaProtegida,listadoEspecies:especiesArea]
        }

    }


    def fichaEspecie(long identificador){
        def especie = Especie.get(identificador)
        println params
        println identificador
        if (especie==null){
            render("No existe la especie")
        } else{
            render(view:"fichaEspecie",model:[especieObject:especie])
        }
    }

    def filtrarEspecies(){
        println params
        def opcionElegida = params.opcionSeleccionada


        def areaLocal = returnAreaProtegida(params.areaID)
        // el error radica en que se está retornando null
        def nombreBuscado = params.textoBusqueda

        def especiesArea = areaLocal.especies
        def especiesFiltradas = []

        if(especiesArea != null) {
            if (opcionElegida == "Reino") {
                    especiesArea.each{
                        if(it.reino == nombreBuscado){
                            especiesFiltradas.add(Especie.get(it.id))
                        }
                    }
                }
            } else if (opcionElegida == "Clase"){

                 especiesArea.each{ it ->
                     especiesArea.each{
                         if(it.clase == nombreBuscado){
                             especiesFiltradas.add(Especie.get(it.id))
                         }
                    }
                 }
            }
        /* si no hay valores seleccionados, tanto por el dropdown menu como el textfield,
      retornará en algunos de los campos null */
        render(view:"fichaArea",action:"filtrarEspecies", model:['area':areaLocal,'listadoEspecies':especiesFiltradas])
    }


}
