/*
 * EmpreBD.java
 *
 * Created on 14 de febrero de 2007, 13:23
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package empre.basedatos;

import empre.cargo.Empresa;
import java.sql.*;
/**
 *
 * @author ezequielher
 */
public class EmpreBD {
    private empre.Conexion conexion;
    private Empresa empre;
    
    /** Creates a new instance of EmpreBD */
    public EmpreBD() {
    }

    public void setEmpresa(Empresa empresa){
        this.empre= empresa;
    }
    public Empresa getEmpresa(){
        return empre;
    }
    public boolean agregar(){
        boolean resp= true;        
        try {
            String senten = "insert into empresa (nombre, domic, telef, presid, estado)" +
                    " values (?, ?, ?, ?, ?)";
            PreparedStatement cons = conexion.getConexion().prepareStatement(senten);
            cons.setString(1, empre.getNombre());
            cons.setString(2, empre.getDomic());
            cons.setString(3, empre.getTelef());
            cons.setString(4, empre.getPresid());
            cons.setInt(5, 1);
            
            cons.execute();
            cons.close();
        }
        catch(SQLException e){
            resp = false;
        }
        return resp;
    }
    
    public boolean modificar(){
        try{
            String senten= "update empresa set nombre=?, domic=?, telef=?, presid=? where id_emp= ?";
            PreparedStatement cons= conexion.getConexion().prepareStatement(senten);
            cons.setString(1, empre.getNombre());
            cons.setString(2, empre.getDomic());
            cons.setString(3, empre.getTelef());
            cons.setString(4, empre.getPresid());
            cons.setInt(5, empre.getId());
            
            cons.execute();
            cons.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }  
    public boolean eliminar(){
        try {       /* Se da de baja a la empresa y a todos sus integrantes */
            String senten = "update empresa set estado=? where id_emp=?";
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            
            query.setInt(1, 0);
            query.setInt(2, empre.getId());
            query.execute();
            query.close();
            
            senten = "update empleado set estado=? where empresa like ?";
            query= conexion.getConexion().prepareStatement(senten);
            query.setInt(1, 0);
            query.setString(2, empre.getNombre());
            query.execute();
            query.close();            

            senten = "delete from usuario where empresa like ?";
            query= conexion.getConexion().prepareStatement(senten);
            query.setString(1, empre.getNombre());
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
    public void setConexion(empre.Conexion conex){
        this.conexion= conex;
    }    
}
