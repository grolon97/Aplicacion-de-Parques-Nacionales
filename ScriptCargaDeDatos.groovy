package parquesnacionales
import groovy.json.JsonSlurper
import TPIntegrador.*

    String base = "https://sib.gob.ar/api/2.0.0/ficha-area-protegida/"
    String endpoint = "areas-protegidas"

    URL apiUrl = new URL(base + endpoint)

    def AP = new JsonSlurper().parse(apiUrl)

    def i = 1

    AP.each{
        if ((it.jurisdiccion == "APN") && (it.caracter=="Parque Nacional")){
            def areaP = new AreaProtegida()
            areaP.nombre = it.nombre
            areaP.creacion = it.ano_creacion
            areaP.superficie = it.superficie
            areaP.latitud = it.lat
            areaP.longitud = it.lng
            areaP.localidad = it.localidad
            areaP.provincia = it.provincia



            URL infoUrl = new URL(base + "$it.slug/datos-basicos")
            def apInfo = new JsonSlurper().parse(infoUrl)

            //SI LA IMAGEN PRINCIPAL DEL JSON NO ES NULA
            if (!apInfo.imagen_principal == null){
                areaP.imagen = apInfo.imagen_principal.url
            }
            else{
                areaP.imagen = " "
            } 

           /* no importa si el logo existe o no, se tiene que crear sí o sí una instancia en el modelo de la aplicación */
             def logo = new Logo()

            // osea que no tenga logo
            if(apInfo.logo==null){

                logo.url = " "
            } else{
            	logo.url = apInfo.logo.url 
            }
                /* se le asigna al área, o el logo vacío o su URL */
                    areaP.logo = logo
                    logo.validate()
					if (logo.hasErrors()) {
						println "ERROR EN EL GUARDADO DEL LOGO"
					    logo.errors.allErrors.each {
					        println it
					    }
				    } else {
				    	println "LOGO GUARDADO"
				    	logo.save()
				    } 
                        areaP.validate()
					if (areaP.hasErrors()) {
						println "ERROR EN EL GUARDADO DEL AREA PROTEGIDA"
					    areaP.errors.allErrors.each {
					        println it
					    }
				    } else {
				    	println "AREA PROTEGIDA GUARDADA"
				    	areaP.save()
				    } 




             // osea si no es null
            if(!apInfo.objetivos==null){
                apInfo.objetivos.each{
                    def objetivo = Objetivo.findByDescripcion(it)
                    if (objetivo==null){
                        objetivo = new Objetivo()
                        objetivo.descripcion = it
                        objetivo.validate()

                        if (objetivo.hasErrors()) {
                            println "ERROR EN EL GUARDADO DEL OBJETIVO"
                            objetivo.errors.allErrors.each {
                                println it
                            }

                        } else {
                            println "OBJETIVO GUARDADO"
                            objetivo.save()
                            areaP.addToObjetivos(objetivo)
                            objetivo.addToAreasProtegidas(areaP)
                        }
                    }
                    else{
                        println "OBJETIVO YA EXISTIA"
                        areaP.addToObjetivos(objetivo)
                        objetivo.addToAreasProtegidas(areaP)
                        objetivo.save()
                    }

                }
            }

            URL especiesUrl = new URL(base + "$it.slug/especies")
             println especiesUrl
            def apEspecies = new JsonSlurper().parse(especiesUrl)
            
            apEspecies.each{  // it.especie es nombre Cientifico en la API
            	// se busca en el modelo si es que ya existe
                def especie = Especie.findByNombreCientifico(it.nombre_cientifico)

               /* SI LA ESPECIE NO EXISTE, SE CREA UNA NUEVA */
                if(especie==null){
                	println "la especie no existe, se procede a crear una nueva"
                    especie = new Especie()
                    especie.reino = it.reino
                    especie.especie = it.especie
                    especie.nombreCientifico = it.nombre_cientifico
                    especie.nombreComun = it.nombre_comun
                    especie.origen = it.origen
                    especie.endemica = (it.endemica == 1)
                    
                    def genero = Genero.findByNombre(it.genero)

                    //SI EL GENERO NO SE ENCONTRABA GUARDADO

                    if(genero==null){
                        genero = new Genero()
                        genero.nombre = it.genero
                        genero.validate()
                        if (genero.hasErrors()) {
                            println "ERROR EN EL GUARDADO DEL GENERO"
                            genero.errors.allErrors.each {
                                println it
                            }
                        } else {
                            println "GENERO GUARDADO"
                            genero.save()
                        }
                    }
                    else{
                        println "EL GENERO YA EXISTIA"
                        genero.addToEspecies(especie)
                        genero.save()
                    }
                    especie.genero = genero

                    //SE COMPLETO EL GUARDADO DEL GENERO

                    especie.validate()
					if (especie.hasErrors()) {
						println "ERROR EN EL GUARDADO DE LA ESPECIE"
					    especie.errors.allErrors.each {
					        println it
					    }
				    } else {
				    	println "ESPECIE GUARDADA"
				    	especie.save()
				    }

                    areaP.addToEspecies(especie)
                    areaP.validate()

                    if (areaP.hasErrors()){
                        println "ERROR EN EL ENLAZADO DE ESPECIES CON AREAP"
                        areaP.errors.allErrors.each{
                            println it
                        }
                    }

                    else{
                        println "ENLAZADO ESPECIE-AREAP CON EXITO"
                        areaP.save()
                        especie.addToHabitats(areaP)
                        especie.save()
                    }
                    
                    
 					//SI LA ESPECIE TIENE IMAGENES
                    if(it.has_imagenes){
                        it.imagenes.each{
                            def imagen = new Imagen()
                            imagen.url = ("http:" + it.url)
                            imagen.validate()
                        if (imagen.hasErrors()) {
                            println "ERROR EN EL GUARDADO DE LA IMAGEN DE ESPECIE"
                            imagen.errors.allErrors.each {
                                println it
                            }
                        } else {
                            println "IMAGEN DE ESPECIE GUARDADA"
                            imagen.save()
                            especie.addToImagenes(imagen)
                            }

                        }
                    }

                    //SI LA ESPECIE TIENE SONIDOS
                    if(it.has_sonidos){
                        it.sonidos.each{
                            def sonido = new Sonido()
                            sonido.url = ("http:" + it.url)
                            sonido.validate()
                        if (sonido.hasErrors()) {
                            println "ERROR EN EL GUARDADO DEL SONIDO DE ESPECIE"
                            sonido.errors.allErrors.each {
                                println it
                            }
                        } else {
                            println "SONIDO DE ESPECIE GUARDADO"
                            sonido.save()
                            especie.addToSonidos(sonido)
                            }

                        }
                        }

                    def familia = Familia.findByNombre(it.familia)

                    //SI NO EXISTE LA FAMILIA
                    if(familia==null){
                        println "PROCEDIENDO A CREAR FAMILIA"
                        familia = new Familia()
                        familia.nombre = it.familia
                        familia.validate()
                        if (familia.hasErrors()) {
                            println "ERROR EN EL GUARDADO DE LA FAMILIA"
                            familia.errors.allErrors.each {
                                println it
                            }
                        } else {
                            println "FAMILIA GUARDADA"
                            familia.addToGeneros(especie.genero)
                            familia.save()
                            }

                        }
                    
                    else{
                        println "YA EXISTIA LA FAMILIA"
                        familia.addToGeneros(especie.genero)
                        familia.save()
                    }
                    

                    def orden = Orden.findByNombre(it.orden)
                    if(orden==null){
                        println "PROCEDIENDO A CREAR NUEVO ORDEN"
                        orden = new Orden()
                        orden.nombre = it.orden
                        orden.validate()
                        if (orden.hasErrors()) {
                            println "ERROR EN EL GUARDADO DEL ORDEN"
                            orden.errors.allErrors.each {
                                println it
                            }
                        } else {
                            println "ORDEN GUARDADO"
                            orden.save()
                            orden.addToFamilias(familia)
                            orden.save()
                            }
                    }
                    else{
                        println "YA EXISTIA EL ORDEN"
                        orden.addToFamilias(familia)
                        orden.save()
                    }

                    def clase = Clase.findByNombre(it.clase)

                    if(clase==null){
                        println "PROCEDIENDO A CREAR NUEVA CLASE"
                        clase = new Clase()
                        clase.nombre = it.clase
                        clase.validate()
                        if (clase.hasErrors()) {
                            println "ERROR EN EL GUARDADO DE LA CLASE"
                            clase.errors.allErrors.each{
                                println it
                            }
                        } else{
                            println "CLASE GUARDADA"
                            clase.save()
                            clase.addToOrdenes(orden)
                            clase.save()
                        }
                    }

                    else{
                        println "CLASE YA EXISTIA"
                        clase.addToOrdenes(orden)
                        clase.save()
                    }
                }
                else{
                    println "LA ESPECIE YA EXISTE"
                    areaP.addToEspecies(especie)
                    areaP.validate()

                    if (areaP.hasErrors()){
                        println "ERROR EN EL ENLAZADO DE ESPECIES CON AREAP"
                        areaP.errors.allErrors.each{
                            println it
                        }
                    }

                    else{
                        println "ENLAZADO ESPECIE-AREAP CON EXITO"
                        areaP.save()
                        especie.addToHabitats(areaP)
                        especie.save()
                    }

                }
            }
        }
            
    }
