/*
 * AddLider.java
 *
 * Created on 16 de febrero de 2007, 10:16
 */

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
import empre.Conexion;
import java.sql.*;
/**
 *
 * @author ezequielher
 * @version
 */
public class AddLider extends HttpServlet {
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String msje= "ERROR: No se pudo seleccionar lider";
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        
        if ("".equals(request.getParameter("lider"))) {
            try {
                String senten="update proyecto set lider= ? where id_proy= ? ";
                PreparedStatement query1= conexion.getConexion().prepareStatement(senten);
                int idProy= Integer.parseInt(request.getParameter("id_proy"));
                query1.setString(1, request.getParameter("nick"));
                query1.setInt(2, idProy);
                query1.execute();
                query1.close();

                senten="update usuario set perfil='lider' where nick like ?";
                PreparedStatement query2= conexion.getConexion().prepareStatement(senten);
                query2.setString(1, request.getParameter("nick"));
                query2.execute(); 
                query2.close();
                
                msje= "Ok! Lider seleccionado con exito!";                
            }
            catch(Exception e){            
            }    
        }
        else { msje= "ERROR: Este proyecto ya tiene lider"; }
        
        HttpSession session= request.getSession(true);
        session.setAttribute("aviso", msje);
        response.sendRedirect("./administ/menu.jsp");        
    }
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
