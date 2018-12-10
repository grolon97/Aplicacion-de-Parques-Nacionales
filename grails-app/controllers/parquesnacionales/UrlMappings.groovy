package parquesnacionales

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }
        "/"(view:"/indexPublico")
        "/p"(view:"/indexPrivado")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "/areasP"(controller: 'public', action: 'mostrarAreasP')
        /*"/us"(view: '/nosotros')*/
    }
}
