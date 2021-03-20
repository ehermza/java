package empre.cargo;

 public class Empleado {
    protected String nick;
    protected String nombre;
    protected String apellido;
    protected String empresa;
    protected int sueldo; 
    protected int estado;
    
    public Empleado(){        
    }
    public void setEstado(int estado){
        this.estado= estado;
    }
    public int getEstado(){
        return estado;
    }
    public void setNick(String nick){
        this.nick= nick;
    }
    public String getNick(){
        return nick;
    }
    public void setNombre(String nombre){
        this.nombre= nombre;
    }
    public String getNombre(){
        return nombre;
    }
    public void setApellido(String apel){
        this.apellido= apel;
    }
    public String getApellido(){
        return apellido;
    }
    public void setEmpresa(String empre){
        this.empresa= empre;
    }
    public String getEmpresa(){
        return empresa;
    }
    public void setSueldo(int sueldo){
        this.sueldo= sueldo;
    }
    public int getSueldo(){
        return sueldo;
    }    
 }