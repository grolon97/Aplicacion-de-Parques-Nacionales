package parquesnacionales
import groovy.json.JsonSlurper
import TPIntegrador.*

    String base = "https://sib.gob.ar/api/2.0.0/ficha-area-protegida/"
    String endpoint = "areas-protegidas"

    URL apiUrl = new URL(base + endpoint)

    def AP = new JsonSlurper().parse(apiUrl)

    AP.each{
        if ((it.jurisdiccion == "APN") && (it.caracter=="Parque Nacional")){
            def areaP = new AreaProtegida()
            println it.nombre
            areaP = findByNombre(it.nombre)

            //SI LA IMAGEN PRINCIPAL ES DISTINTO A NULL
            if (!it.imagen_principal==null){
                println "PARQUE NACIONAL ${areaP.nombre} CONTIENE IMAGEN, GUARDANDO..."
                areaP.imagen = it.imagen
                areaP.validate()
                if (areaP.hasErrors()) {
                    println "ERROR EN EL GUARDADO DEL AREA PROTEGIDA"
                    areaP.errors.allErrors.each {
                        println it
                    }
                } else {
                    areaP.save()
                    println "IMAGEN DE ${areaP.nombre} GUARDADA"
                } 
            }
        }
    }
