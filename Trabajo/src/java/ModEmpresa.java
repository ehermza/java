/*
 * ModEmpresa.java
 *
 * Created on 15 de febrero de 2007, 19:46
 */

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
import empre.cargo.Empresa;
import empre.basedatos.EmpreBD;
import empre.Conexion;

/**
 *
 * @author ezequielher
 * @version
 */
public class ModEmpresa extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        String mensj= "ERROR: No se pudo modificar empresa";        
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        EmpreBD mnjEmpre= new EmpreBD();
        mnjEmpre.setConexion(conexion);
        
        Empresa empre= new Empresa();
        int iden= Integer.parseInt(request.getParameter("id"));
        empre.setId(iden);
        empre.setNombre(request.getParameter("nombre"));
        empre.setDomic(request.getParameter("domicilio"));
        empre.setTelef(request.getParameter("telefono"));
        empre.setPresid(request.getParameter("presidente"));
        
        mnjEmpre.setEmpresa(empre);        
        
        mnjEmpre.modificar();
            response.sendRedirect("./administ/lista_empre.jsp");        
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
