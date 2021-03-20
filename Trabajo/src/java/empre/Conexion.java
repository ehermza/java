package empre;

import java.sql.Connection; //paquetes nesarios para sql
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

public class Conexion {
    
    private Connection conexion;

    public Conexion(String urlConexion,String user,String pass) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion=DriverManager.getConnection(urlConexion,user,pass);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } 
    }

    public Connection getConexion() {
        return conexion;
        //DEVUELVE LA CONEXION
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }
}
