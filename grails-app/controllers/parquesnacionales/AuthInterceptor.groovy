package parquesnacionales


class AuthInterceptor {

	public AuthInterceptor(){
        match controller: ~/(areaProtegida|especie|orden|clase|familia|genero|imagen|logo|objetivo|sonido)/

                  /*.excludes(controller: 'login')
                  .excludes(controller: 'public')*/
        /*.excludes(view:"/")*/
	}

    boolean before() {
        if (!session.usuario){
            flash.message = "Identifíquese para poder continuar"
            redirect(controller: 'login')
            return false
        }
        true
        /*matchAll().excludes(uri:'/').
                excludes(controller:'login').
                excludes(controller:'publicoController')*/
    }

    boolean after() { 
        true
        }

    void afterView() {
        // no-op
    }
}
