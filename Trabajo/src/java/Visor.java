/*
 * Visor.java
 *
 * Created on 6 de febrero de 2007, 16:43
 */

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import empre.Conexion;
import foto.Foto;
import foto.FotoBD;

/**
 *
 * @author ezequielher
 * @version
 */
public class Visor extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","gaston","1234");
        FotoBD fotobd = new FotoBD();
        fotobd.setConexion(conexion);
        
        String usr = request.getParameter("usr");
        Foto foto = fotobd.getFoto(usr);
        //adquiero el outputStream para contestarle al cliente
        OutputStream os = response.getOutputStream();
        
        response.setContentType("image/jpeg;charset=iso-8859-1");
//        response.setContentType(foto.getMime() + ";charset=iso-8859-1");
        //escribo el contenido de la foto en el outputStream
        os.write(foto.getContenido());
        os.close();
    }

    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
