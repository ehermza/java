
package empre.basedatos;

import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import empre.basedatos.*;
import empre.Conexion;
import empre.cargo.*;
import proyecto.Proyecto;

public class Buscador {
    private Conexion conexion;
    
    public Buscador() {
    }
    
    public boolean verificar(String nick, String contr){ 
        boolean usuarOk= false;
        try {
            String sentencia= "select nick from usuario where nick like ? and pass like ?";
            PreparedStatement query= conexion.getConexion().prepareStatement(sentencia);

            query.setString(1, nick);
            query.setString(2, contr);
            ResultSet resp= query.executeQuery();            
            
            while (resp.next()) 
                if (nick.equals(resp.getString("nick"))) usuarOk= true;
        }
        catch (Exception e){
        }
        return usuarOk;
    }        
    
    public Usuario validar(String nick){ 
        try {
            String sentencia= "select * from usuario where nick like ?";
            PreparedStatement query= conexion.getConexion().prepareStatement(sentencia);

            query.setString(1, nick);
            ResultSet resp= query.executeQuery();            
            
            Usuario usuar= new Usuario();            
            while (resp.next()){
                usuar.setNick(resp.getString("nick"));
                usuar.setNombre(resp.getString("nombre"));
                usuar.setPerfil(resp.getString("perfil"));  
                usuar.setEmpresa(resp.getString("empresa"));
                usuar.setPass(resp.getString("pass"));
            }
            return usuar;
        }
        catch (SQLException e){
            return null;
        }
    }    
/*    
    public Vector getNombreEmpre(){
        try{
            String senten= "select nombre from empresa order by id_emp";
            PreparedStatement cons= conexion.getConexion().prepareStatement(senten);            
            ResultSet resp= cons.executeQuery();
            
            Vector empresas= new Vector();
            while(resp.next()){
                Empresa empre= new Empresa();
                empre.setId(resp.getInt("id_emp"));
                empre.setNombre(resp.getString("nombre"));
                empresas.addElement(empre);
            }
            return empresas;
        }
        catch (Exception e){
            return null;
        }        
    }
*/
    public Vector getEmpresas(){
        try{
            String senten= "select * from empresa order by id_emp";
            PreparedStatement cons= conexion.getConexion().prepareStatement(senten);            
            ResultSet resp= cons.executeQuery();
            Vector empresas= new Vector();
            
            while(resp.next()){ 
                if (resp.getInt("estado") > 0) {
                    Empresa empre= new Empresa();
                    empre.setId(resp.getInt("id_emp"));
                    empre.setNombre(resp.getString("nombre"));
                    empre.setDomic(resp.getString("domic"));
                    empre.setTelef(resp.getString("telef"));
                    empre.setPresid(resp.getString("presid"));
                    empre.setEstado(resp.getString("estado"));

                    empresas.addElement(empre);
                }
            }
            return empresas;
        }
        catch (Exception e){
            return null;
        }
    }
    
    public Vector getEmpleados(){
        try{
            String senten= "select * from empleado ";
            PreparedStatement cons = conexion.getConexion().prepareStatement(senten);
            ResultSet resp = cons.executeQuery(); 
            Vector empleados= new Vector();
            
            while(resp.next()){
                if (resp.getInt("estado") > 0) {
                    Empleado pers= new Empleado();  
                    pers.setNick(resp.getString("nick"));
                    pers.setNombre(resp.getString("nombre"));
                    pers.setApellido(resp.getString("apellido"));
                    pers.setEmpresa(resp.getString("empresa"));
                    pers.setSueldo(resp.getInt("sueldo"));
                    pers.setEstado(resp.getInt("estado"));

                    empleados.addElement(pers);
                }
            }
            return empleados;
        }
        catch(Exception e){
            return null;
        }
    }
        
    public Vector getProyectos(){
        try{
            String senten= "select * from proyecto ";
            PreparedStatement cons = conexion.getConexion().prepareStatement(senten);
            ResultSet resp = cons.executeQuery(); 
            Vector proyectos= new Vector();
            
            while(resp.next()){
                Proyecto proye= new Proyecto();  
                proye.setIdent(resp.getInt("id_proy"));
                proye.setEmpresa(resp.getString("empresa"));
                proye.setDetalle(resp.getString("detalle"));
                proye.setCosto(resp.getInt("costo"));
                proye.setTitulo(resp.getString("titulo"));
                proye.setLider(resp.getString("lider"));

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
                
                proyectos.addElement(proye);
            }
            return proyectos;
        }
        catch(Exception e){
            return null;
        }
    }    

    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }
    public Conexion getConexion() {
        return conexion;
    }    
}