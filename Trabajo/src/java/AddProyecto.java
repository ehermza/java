/*
 * AddProyecto.java
 *
 * Created on 15 de febrero de 2007, 18:25
 */

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
import empre.Conexion;
import empre.basedatos.Buscador;
import proyecto.*;
/**
 *
 * @author ezequielher
 * @version
 */
public class AddProyecto extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String mensj= "ERROR: No se pudo agregar proyecto";
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        ProyectoBD mnjProy= new ProyectoBD();
        mnjProy.setConexion(conexion);
        
        Proyecto proyecto= new Proyecto();
        proyecto.setEmpresa(request.getParameter("empresa"));
        proyecto.setTitulo(request.getParameter("titulo"));
        proyecto.setDetalle(request.getParameter("detalle"));
        proyecto.setCosto(Integer.parseInt(request.getParameter("costo")));
        
        mnjProy.setProyecto(proyecto);
        
        if (mnjProy.agregar()) 
        {
            mnjProy.setIdent();        
            if (mnjProy.setEmpleados())
                mensj= "Ok! se agrego proyecto con exito";
        }
        HttpSession session= request.getSession(true);
        session.setAttribute("aviso", mensj);
        response.sendRedirect("./administ/menu.jsp");        
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
