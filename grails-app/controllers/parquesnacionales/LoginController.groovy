package parquesnacionales

class LoginController {

    def index(){}

    def login(){
        /*if (usuario.hasErrors()){
            redirect(action:"login")
        }
        else{
            session.usuarioAutenticado=usuario
            redirect(view:"/indexPrivado")
        }*/
        if((params.username == "gonzalo" && params.password == "rolon") || (params.username == "alejandro" && params.password=="alvarez")){
            flash.message = "Acceso permitido"          
            session.usuario = "admin"
            redirect(url: "/p")
        }

        else{
            flash.message = "Acceso denegado"
            redirect(action: "index")
        }

    }
    

    def logout() {
        session.usuario = null
        redirect(url: "/") }
}

class UserCommand{
    String username
    String password
    static constraints = {
        user(blank: false, minSize: 5)
        pass(blank: false, minSize: 5)
    }
}