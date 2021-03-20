package empre;

import java.util.Date;

public class Cita {
    private String nickOrig;
    private String nickDest;
    private Date fecha;
    private String titulo;
    private String texto;

    /** Creates a new instance of Agenda */
    public void Agenda() {
    }
    
    public void setOrig(String nick){
        this.nickOrig=nick;
    }
    
    public String getOrig(){
        return nickOrig;
    }
    
    public void setDest(String nick){
        this.nickDest=nick;
    }
    
    public String getDest(){
        return nickDest;
    }
    
    public void setFecha(Date fecha){
        this.fecha= fecha;
    }
    
    public Date getFecha(){
        return fecha;
    }
    
    public void setTitulo(String titulo){
        this.titulo= titulo;
    }
    
    public String getTitulo(){
        return titulo;
    }
    
    public void setTexto(String texto){
        this.texto= texto;
    }
    
    public String getTexto(){
        return texto;
    }

}
