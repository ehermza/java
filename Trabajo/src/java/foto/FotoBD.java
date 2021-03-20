/*
 * FotoBD.java
 *
 * Created on 17 de enero de 2007, 19:05
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package foto;

import java.sql.*;
import java.io.File;
import java.io.*;
import java.util.Vector;
import java.net.URL;
import java.net.URLConnection;

import empre.Conexion;
import com.oreilly.servlet.MultipartRequest;


/**
 *
 * @author Chiaramonte
 */
public class FotoBD {
private Foto foto; // clase obj
private Conexion conexion;
    /** Creates a new instance of FotoBD */
    public FotoBD() {
    }
    public void setFoto(Foto foto) {
        this.foto = foto;
    }
    
    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }
    public Conexion getConexion(Conexion conexion) {
        return this.conexion;
    }
    
   public Foto getPredeterm(String nick){
       FotoPredet predet= new FotoPredet();
       File arch = predet.getFile("http://localhost:8084/Trabajo/foto.jpg");

       Foto nvaFoto= new Foto();
       nvaFoto.setNick(nick);
       nvaFoto.setFilename("predet.jpg");
       nvaFoto.setMime("image/jpeg");
       nvaFoto.setTmpFile(arch);
       nvaFoto.setSize((int)arch.length());
       
       return nvaFoto;
    }
   
     public boolean guardar() {
        try {       
            String query= "insert into foto (nick, nombreFoto, tamano, tipo, contenido) values (?, ?, ?, ?, ?)";
            PreparedStatement ps= conexion.getConexion().prepareStatement(query);
            ps.setString(1, foto.getNick());
            ps.setString(2, foto.getFilename());
               ps.setInt(3, foto.getSize());
            ps.setString(4, foto.getMime());
            try{
                ps.setBinaryStream(5, new FileInputStream(foto.getTmpFile()),
                    (int) foto.getTmpFile().length());
                ps.execute();
            } 
            catch (FileNotFoundException ex1) {
                return false;
            }
            ps.close();
            return true;
        } 
        catch (Exception e) {
            return false;
        } 
    }

     public Foto getFoto(String nick) {
        
        try {
            String query = "select * from foto where nick like ?";
             PreparedStatement ps = conexion.getConexion().prepareStatement(query);
             ps.setString(1, nick);
             ResultSet rs = ps.executeQuery();
             if (rs.next()){
                 foto= new Foto();
                 
                 //foto.setId(rs.getInt("id"));
                 foto.setNick(rs.getString("nick"));
                 foto.setFilename(rs.getString("nombreFoto"));
                 foto.setSize(rs.getInt("tamano"));
                 foto.setMime(rs.getString("tipo"));
                 foto.setContenido(rs.getBytes("contenido"));
                 return foto;
             }
             return null;
        }
        catch(Exception e){
            return null;
        }
    
    }
/* 
    public boolean borrarFoto(String usr){
        try{
            String query="delete from foto where nick=?";
            PreparedStatement cons= conexion.getConexion().prepareStatement(query);
            cons.setString(1,usr);
            if (cons.executeUpdate(query) <= 0) {
                //si da 0 es xq fallo la ejecucion
            cons.close();
            return false;
        }
            cons.close();
            return true;
        }
        catch(SQLException excep){
            excep.printStackTrace();
            return false;
        }
    }
*/

}
