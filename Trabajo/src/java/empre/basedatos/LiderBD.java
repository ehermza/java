
package empre.basedatos;

import empre.cargo.Lider;
//import empre.cargo.Empleado;
import java.sql.*;
import java.util.Vector;
import empre.Conexion;

public class LiderBD  {
    private Lider lider;
    private Conexion conexion;
    
    public LiderBD() {
        super();
    }
    public void setLider(Lider lider){
        this.lider= lider;
    }
    public Lider getLider(){
        return lider;
    }

    
    public int[] getMisProyectos(){
        try{
            String senten= "select id_proy from proyecto where lider like ?";
            PreparedStatement query= conexion.getConexion().prepareStatement(senten);
            query.setString(1, lider.getNick());
            ResultSet resp= query.executeQuery();
            
            int i=0;
            int proyectos[] = null;
            while(resp.next()){
                int id_proy= resp.getInt("id_proy");
                proyectos[i++]= id_proy;
            }
            return proyectos;
        }
        catch(Exception e){   
            return null;
        }
    }
    public empre.Conexion getConexion(){
        return conexion;
    }
    public void setConexion(empre.Conexion conex){
        this.conexion= conex;
    }    
}