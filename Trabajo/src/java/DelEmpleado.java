/*
 * DelEmpleado.java
 *
 * Created on 15 de febrero de 2007, 21:03
 */

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
import empre.Conexion;
import empre.basedatos.EmpleBD;
import empre.cargo.Empleado;

/**
 *
 * @author ezequielher
 * @version
 */
public class DelEmpleado extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        EmpleBD mnjEmple= new EmpleBD();
        mnjEmple.setConexion(conexion);
        
        String nickReq= request.getParameter("nick");
        Empleado emple= new Empleado();
        emple.setNick(nickReq);
        mnjEmple.setEmpleado(emple);
        
        if (mnjEmple.eliminar())        
            response.sendRedirect("./administ/lista_emple.jsp");    
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
