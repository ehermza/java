/*
 * Proyecto.java
 *
 * Created on 14 de febrero de 2007, 20:26
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package proyecto;
import java.util.Vector;

/**
 *
 * @author ezequielher
 */
public class Proyecto {
    private int idProyecto;
    private String titulo;
    private String empresa;
    private String detalle;
    private Vector empleados;
    private String lider;
    private int costo;
    
    /** Creates a new instance of Proyecto */
    public Proyecto() {
    }
    public void setIdent(int id){
        this.idProyecto= id;
    }
    public int getIdent(){
        return idProyecto;
    }
    public void setEmpresa(String empr){
        this.empresa= empr;
    }
    public String getEmpresa(){
        return empresa;
    }
    public void setTitulo(String titulo){
        this.titulo= titulo;
    }
    public String getTitulo(){
        return titulo;
    }
    public void setDetalle(String detalle){
        this.detalle= detalle;
    }
    public String getDetalle(){
        return detalle;
    }
    public void setCosto(int costo){
        this.costo= costo;
    }
    public int getCosto(){
        return costo;
    }
    public void setLider(String lider){
        this.lider= lider;
    }
    public String getLider(){
        return lider;
    }
    public void setEmpleados(Vector gente){
        this.empleados= gente;
    }
    public Vector getEmpleados(){
        return empleados;
    }
}
