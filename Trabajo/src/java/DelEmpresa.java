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
public class DelEmpresa extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String mensj= "ERROR: No se pudo dar de baja";   
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");        
        EmpreBD mnjEmpre= new EmpreBD();
        mnjEmpre.setConexion(conexion);
        
        Empresa empre= new Empresa();
        empre.setId(Integer.parseInt(request.getParameter("id")));
        empre.setNombre(request.getParameter("nombre"));
        mnjEmpre.setEmpresa(empre);
                
        if (mnjEmpre.eliminar())
            response.sendRedirect("./administ/lista_empre.jsp");              
    }

    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
