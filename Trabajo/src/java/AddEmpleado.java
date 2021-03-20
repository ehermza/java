import java.io.*;
import java.util.Enumeration;
import java.util.NoSuchElementException;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.*;
import javax.servlet.http.*;

import empre.basedatos.*;
import empre.Conexion;
import empre.cargo.*;

import foto.*;

public class AddEmpleado extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String msje = "ERROR: Al ingresar nuevo item";
        
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");    
        MultipartRequest mRqst = new MultipartRequest(request, ".");       
        Enumeration archivo= mRqst.getFileNames();
        
        String nombre= (String)archivo.nextElement();
        String mime= (String)mRqst.getContentType(nombre);
        
        String pass1=(String)mRqst.getParameter("pass1");
        String pass2=(String)mRqst.getParameter("pass2");
        
        if (pass1.equals(pass2)) {
            
            String nick= (String)mRqst.getParameter("nick");   
            File arch= mRqst.getFile(nombre);
            int size= 0;
            String nombreArch= "";

            boolean IMG_CARG= false;        
            /* SI No subio Archivo, cargar predeterm */
            if (mime == null){                
                FotoPredet predet= new FotoPredet();            
                arch = predet.getFile("http://localhost:8084/Trabajo/foto.jpg");
                size= (int)arch.length();
                nombreArch= arch.getName();
                mime= "image/jpeg";
                IMG_CARG= true;
            }
            else {
                /* si Archivo Ok! -> Cargar imagen */
                if ("image/jpeg".equals(mime)){
                    size = (int)arch.length();      
                    nombreArch= arch.getName();
                    IMG_CARG= true;
                }
            }

            if (IMG_CARG){
                FotoBD mnjFoto= new FotoBD();
                mnjFoto.setConexion(conexion);
                Foto nvaFoto= new Foto();

                nvaFoto.setNick(nick);
                nvaFoto.setMime(mime);
                nvaFoto.setSize(size);
                nvaFoto.setTmpFile(arch);
                nvaFoto.setFilename("predet.jpg");

                mnjFoto.setFoto(nvaFoto);
                if (!mnjFoto.guardar()) IMG_CARG = false;
            }

            /* si la IMG Cargo mandamos TODO a la base datos */
            if (IMG_CARG){
                /* cargando datos personales del empleado */
    //            String perfil= (String)mRqst.getParameter("perfil");
                String nomb= (String)mRqst.getParameter("nombre");
                String apellido= (String)mRqst.getParameter("apellido");
                String empresa= (String)mRqst.getParameter("empresa");
                String pass= (String)mRqst.getParameter("pass1");
                String str= (String)mRqst.getParameter("sueldo");
                int sueldo= Integer.parseInt(str);

                /* Guardar datos en tabla Empleado */
                EmpleBD mnjEmple= new EmpleBD();
                mnjEmple.setConexion(conexion);
                Empleado emple= new Empleado();

                emple.setNick(nick);
                emple.setNombre(nomb);
                emple.setApellido(apellido);
                emple.setEmpresa(empresa);
                emple.setSueldo(sueldo);
                emple.setEstado(1);

                mnjEmple.setEmpleado(emple);

                /* Guardar datos a tabla Usuario */
                UsuarioBD mnjUsuar= new UsuarioBD();
                mnjUsuar.setConexion(conexion);
                Usuario usuar= new Usuario();

                usuar.setNick(nick);
                usuar.setPass(pass);
                usuar.setNombre(nomb);
                usuar.setEmpresa(empresa);
                usuar.setPerfil("empleado");

                mnjUsuar.setUsuario(usuar);

                if (mnjEmple.agregar() && mnjUsuar.agregar())
                    msje = "Ok! Se agrego empleado con exito";
            }
            else
                msje= "ERROR: Ingresaste contraseñas distintas";
        }
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
