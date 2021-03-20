/*
 * ModEmpleado.java
 *
 * Created on 15 de febrero de 2007, 19:48
 */

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
import empre.Conexion;
import empre.basedatos.EmpleBD;
import empre.basedatos.UsuarioBD;
import empre.cargo.Empleado;
import empre.cargo.Usuario;

/**
 *
 * @author ezequielher
 * @version
 */
public class ModEmpleado extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        EmpleBD mnjEmple= new EmpleBD();
        mnjEmple.setConexion(conexion);
        
        Empleado emple= new Empleado();
        emple.setNick(request.getParameter("nick"));
        emple.setNombre(request.getParameter("nombre"));
        emple.setApellido(request.getParameter("apellido"));
        emple.setSueldo(Integer.parseInt(request.getParameter("sueldo")));
        
        mnjEmple.setEmpleado(emple);
        
        UsuarioBD mnjUsuar= new UsuarioBD();
        mnjUsuar.setConexion(conexion);        
        
        Usuario usuar= new Usuario();
        usuar.setNombre(request.getParameter("nombre"));
        usuar.setNick(request.getParameter("nick"));
        mnjUsuar.setUsuario(usuar);

        if (mnjEmple.modificar() && mnjUsuar.modificar())
            response.sendRedirect("./administ/lista_emple.jsp");    
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
