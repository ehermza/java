/*
 * EmpleBD.java
 *
 * Created on 14 de febrero de 2007, 12:43
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package empre.basedatos;

import empre.cargo.Empleado;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Vector;
import empre.Conexion;

/**
 *
 * @author ezequielher
 */
public class EmpleBD {
    protected Conexion conexion;
    private Empleado emple;
    
    
    /** Creates a new instance of EmpleBD */
    public EmpleBD() {
    }
    
    public void setEmpleado(Empleado emple){
        this.emple= emple;
    }
    
    public Empleado getEmpleado(){
        return emple;
    }
    
    public boolean agregar(){
        try {
            String senten = "insert into empleado (nick, nombre, apellido, empresa, sueldo, estado)" +
                     " values (?, ?, ?, ?, ?, ?)" ;
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            
            query.setString(1, emple.getNick());
            query.setString(2, emple.getNombre());
            query.setString(3, emple.getApellido());
            query.setString(4, emple.getEmpresa());
            query.setInt(5, emple.getSueldo());
            query.setInt(6, emple.getEstado());
            
            query.execute();
            query.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    
    public boolean modificar(){
        try {
            String senten = "update empleado set nombre=?, apellido=?, sueldo=? where nick like ? ";
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            
            query.setString(1, emple.getNombre());
            query.setString(2, emple.getApellido());
               query.setInt(3, emple.getSueldo());
            query.setString(4, emple.getNick());
            
            query.execute();
            query.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }  
    
    public boolean eliminar(){
        try {
            String senten = "update empleado set estado=? where nick like ?";
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            
            query.setInt(1, 0);
            query.setString(2, emple.getNick());
            query.execute();
            query.close();
            
            senten= "delete from usuario where nick like ?";
            query= conexion.getConexion().prepareStatement(senten);
            
            query.setString(1, emple.getNick());
            query.execute(); 
            query.close();
            return true;
        }
        catch(Exception e){            
            return false;
        }
    }
    
    public empre.Conexion getConexion(){
        return conexion;
    }
    public void setConexion(Conexion conex){
        this.conexion= conex;
    }    
}
