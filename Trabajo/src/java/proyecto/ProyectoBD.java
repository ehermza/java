/*
 * ProyectoBD.java
 *
 * Created on 15 de febrero de 2007, 18:55
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package proyecto;
import java.sql.*;
import empre.Conexion;
import proyecto.Proyecto;
import java.util.Vector;

/**
 *
 * @author ezequielher
 */
public class ProyectoBD {
    Conexion conexion;
    Proyecto proye;
    
    /** Creates a new instance of ProyectoBD */
    public ProyectoBD() {
    }
    
    public boolean agregar(){
        try {
            String senten = "insert into proyecto (titulo, detalle, empresa, costo) values (?, ?, ?, ?)";
            PreparedStatement query = conexion.getConexion().prepareStatement(senten);
            query.setString(1, proye.getTitulo());
            query.setString(2, proye.getDetalle());
            query.setString(3, proye.getEmpresa());
            query.setInt(4, proye.getCosto());
            
            query.execute();
            query.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    
    public void setIdent(){
        try {
            String senten = "select id_proy from proyecto where detalle like ?";
            PreparedStatement query = conexion.getConexion().prepareStatement(senten);
            query.setString(1, proye.getDetalle());
            ResultSet resp= query.executeQuery();
            while (resp.next()){
                int idProyecto= resp.getInt("id_proy");
                proye.setIdent(idProyecto);
            }
            resp.close();
        }
        catch(SQLException e){
        }
    }
        
    public boolean setEmpleados(){
        try{
            String senten= "select nick, estado from empleado where empresa like 'YPF' or empresa like ?";
            PreparedStatement query = conexion.getConexion().prepareStatement(senten);
            query.setString(1, proye.getEmpresa());
            ResultSet resp= query.executeQuery();
            
            while (resp.next()){
                if (resp.getInt("estado") > 0){
                    String senten2 = "insert into pers_proy (id_proy, nick) values (?, ?)";
                    PreparedStatement query2 = conexion.getConexion().prepareStatement(senten2);
                    query2.setInt(1, proye.getIdent());
                    query2.setString(2, resp.getString("nick"));
                    query2.execute();
                }
            }            
            resp.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }

    public Proyecto getProyecto(){
        return proye;
    }
    public void setProyecto(Proyecto proyecto){
        this.proye= proyecto;
    }    
    public Conexion getConexion(){
        return conexion;
    }
    public void setConexion(Conexion conex){
        this.conexion= conex;
    }    
}
