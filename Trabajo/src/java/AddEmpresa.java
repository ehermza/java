/*
 * AddEmpresa.java
 *
 * Created on 15 de febrero de 2007, 19:13
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
public class AddEmpresa extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        EmpreBD mnjEmpre= new EmpreBD();
        mnjEmpre.setConexion(conexion);
        
        Empresa empre= new Empresa();
        empre.setNombre(request.getParameter("nombre"));
        empre.setDomic(request.getParameter("direc"));
        empre.setTelef(request.getParameter("telef"));
        empre.setPresid(request.getParameter("presid"));
        mnjEmpre.setEmpresa(empre);
        
        String mensj= "ERROR: No se pudo agregar empresa";        
        if (mnjEmpre.agregar())
            mensj= "Ok! se agrego empresa con exito";
        
        HttpSession session= request.getSession(true);
        session.setAttribute("aviso", mensj);
        response.sendRedirect("./administ/menu.jsp");        
    }
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
