/*
 * Validar.java
 *
 * Created on 29 de enero de 2007, 12:50
 */

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

import empre.Conexion;
import empre.basedatos.Buscador;
//import empre.basedatos.UsuarioBD;
import empre.cargo.Usuario;

/**
 *
 * @author ezequielher
 * @version
 */
public class Validar extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        Buscador buscador= new Buscador();
        buscador.setConexion(conexion);
                
        String nick=request.getParameter("usr");
        String pass=request.getParameter("pass");
        String sgte= "./index.jsp";

        if (buscador.verificar(nick, pass)){
            Usuario usuar= new Usuario();
            usuar= buscador.validar(nick);
            HttpSession session= request.getSession(true);
            session.setAttribute("usuario", usuar);
            String perfil= usuar.getPerfil();
            if ("administrador".equals(perfil)) sgte= "./administ/menu.jsp";
            if ("empleado".equals(perfil)) sgte= "./empleado/menu.jsp";
            if ("lider".equals(perfil)) sgte= "./lider/menu.jsp";
        }
        response.sendRedirect(sgte); 
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
