
package empre.basedatos;

import java.util.Vector;
import java.sql.*;
import empre.basedatos.*;
import empre.cargo.*;
import proyecto.Proyecto;

/**
 *
 * @author ezequielher
 */
public class UsuarioBD {
    Usuario usuario;
    empre.Conexion conexion;
    
    /**
     * Creates a new instance of UsuarioBD
     */
    public UsuarioBD() {
    }
    public boolean agregar(){
        try {
            String senten = "insert into usuario (nick, perfil, nombre, empresa, pass)" +
                     " values (?, ?, ?, ?, ?)" ;
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            
            query.setString(1, usuario.getNick());
            query.setString(2, usuario.getPerfil());
            query.setString(3, usuario.getNombre());            
            query.setString(4, usuario.getEmpresa());
            query.setString(5, usuario.getPass());
            
            query.execute();
            query.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    public boolean modificar(){
        try{
            String senten= "update usuario set nombre=? where nick like ?";
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            
            query.setString(1, usuario.getNombre());
            query.setString(2, usuario.getNick());
            query.execute();
            query.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    
    public boolean eliminar(){
        try{
            String senten= "delete from usuario where nick like ?";
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            
            query.setString(1, usuario.getNick());
            query.execute();
            query.close();
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    
    public Proyecto getProyecto(int id_proy){
        try {
            String senten= "select * from proyecto where id_proy = ?";
            PreparedStatement preg= conexion.getConexion().prepareStatement(senten);
            preg.setInt(1, id_proy);
            ResultSet resp= preg.executeQuery();
            
            Proyecto proye= new Proyecto();
            
            while (resp.next()){
                proye.setIdent(resp.getInt("id_proy"));
                proye.setTitulo(resp.getString("titulo"));
                proye.setLider(resp.getString("lider"));
                proye.setEmpresa(resp.getString("empresa"));
                proye.setDetalle(resp.getString("detalle"));
                proye.setCosto(resp.getInt("costo"));
            }   resp.close();
            
            String senten1= "select nick from pers_proy where id_proy= ?";
            PreparedStatement query1 = conexion.getConexion().prepareStatement(senten1);
            query1.setInt(1, proye.getIdent());
            ResultSet resp1= query1.executeQuery();
            
            Vector gente= new Vector();
            while (resp1.next()){
                gente.addElement(resp1.getString("nick"));
            }
            proye.setEmpleados(gente);            
            resp1.close();
            return proye;
        }
        catch(Exception e){
            return null;
        }        
    }
    
    public Empleado getEmpleado(String nick){
        try {
            String senten = "select * from empleado where nick like ?";
            PreparedStatement cons = conexion.getConexion().prepareStatement(senten);
            cons.setString(1, nick);
            ResultSet resp = cons.executeQuery(); 
            Empleado pers= new Empleado();
            
            while (resp.next()){
                pers.setNick(resp.getString("nick"));
                pers.setNombre(resp.getString("nombre"));
                pers.setApellido(resp.getString("apellido"));
                pers.setEmpresa(resp.getString("empresa"));
                pers.setSueldo(resp.getInt("sueldo"));
            } 
            resp.close();
            return pers;
        }
        catch(Exception e){
            return null;
        }
    }

    public Empresa getEmpresa(int id_emp){
        try {
            String senten= "select * from empresa where id_emp like ?";
            PreparedStatement preg= conexion.getConexion().prepareStatement(senten);
            preg.setInt(1, id_emp);
            ResultSet resp= preg.executeQuery();
            
            Empresa empre= new Empresa();
            while (resp.next()){
                empre.setId(resp.getInt("id_emp"));
                empre.setNombre(resp.getString("nombre"));
                empre.setPresid(resp.getString("presid"));
                empre.setDomic(resp.getString("domic"));
                empre.setTelef(resp.getString("telef"));                
            }
            resp.close();
            return empre;
        }
        catch(Exception e){
            return null;
        }
    }
    
    public void setUsuario(Usuario usuar){
        this.usuario= usuar;
    }
    public Usuario getUsuario(){
        return usuario;
    }
    public empre.Conexion getConexion(){
        return conexion;
    }
    public void setConexion(empre.Conexion conex){
        this.conexion= conex;
    }
}
