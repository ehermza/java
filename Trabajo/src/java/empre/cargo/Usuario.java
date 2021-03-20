
package empre.cargo;

/**
 *
 * @author ezequielher
 */
public class Usuario {
    private String nick;
    private String pass;
    private String nombre;
    private String empresa;
    private String perfil;
    
    /** Creates a new instance of Usuario */
    public Usuario() {
    }
    public void setNick(String nick){
        this.nick= nick;
    }
    public String getNick(){
        return nick;
    }
    public void setPass(String pass){
        this.pass= pass;
    }
    public String getPass(){
        return pass;
    }
    public void setPerfil(String perfil){
        this.perfil= perfil;
    }
    public String getPerfil(){
        return perfil;
    }
    public void setNombre(String nombre){
        this.nombre= nombre;
    }
    public String getNombre(){
        return nombre;
    }   
    public void setEmpresa(String empre){
        this.empresa= empre;
    }
    public String getEmpresa(){
        return empresa;
    }
}
