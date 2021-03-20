package empre.cargo;

public class Empresa {
    private int id_emp;
    private String nombre;
    private String domic;
    private String telef;
    private String presid;
    private String estado;
    
    /** Creates a new instance of Empresa */
    public Empresa() {
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getNombre(){
        return nombre;
    }
    public void setDomic(String direc){
        this.domic = direc;
    }
    public String getDomic(){
        return domic;
    }
    public void setTelef(String telef){
        this.telef = telef;
    }
    public String getTelef(){
        return telef;
    }
    public void setPresid(String pres){
        this.presid= pres;
    }
    public String getPresid(){
        return presid;
    }
    public void setId(int nro){
        this.id_emp= nro;
    }
    public int getId(){
        return id_emp;
    }
    public void setEstado(String est){
        this.estado= est;
    }
    public String getEstado(){
        return estado;
    }
}
