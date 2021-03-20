<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="cita.*"%>
<%@page import="cita.citaBD.*"%>
<%@page import="empre.Conexion" %>
<%@page import="empre.cargo.*"%>
<%@page import="empre.basedatos.LiderBD"%>
<%@page import="java.util.Vector" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LIDER</title>
    </head>
    <body bgcolor="lightgray">
   <%
    if(session.getAttribute("perfil") != null && session.getAttribute("perfil").equals("lider")) {
        
        String tituloMsj = request.getParameter("titulo");
        String msj= request.getParameter("msj");
        String year= request.getParameter("year");
        String mes= request.getParameter("mes");
        String dia= request.getParameter("dia");
        String hora= request.getParameter("hora");
        String min= request.getParameter("min");
        String destinoCita[]= request.getParameterValues("emp");
        String nick = (String)session.getAttribute("nick");
        String empresa = (String)session.getAttribute("empresa");
        
       Mensaje msjNuevo =  new Mensaje();
       msjNuevo.setMsj(msj);
       msjNuevo.setFechaCita(year, mes, dia, hora, min);
      // msjNuevo.setFechaCita(2007,10,12,14,27);
       msjNuevo.setEmpresa(empresa);
       msjNuevo.setNick(nick);
       msjNuevo.setTitulo(tituloMsj);
       
       Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","gaston","1234");
       LiderBD usuar = new LiderBD();
       usuar.setConexion(conexion);
       usuar.setMsj(msjNuevo);
       if (usuar.guardarMsj(nick)){
            out.println("<center>");
            out.println("MENSAJE CARGADO");
            out.println("</center>");
            int nMsj=0;
            Cita nvaCita = new Cita();
            
            for (int i=0; i < destinoCita.length; i++){
                //nvaCita.setTitulo(tituloCita);
                nvaCita.setNick(destinoCita[i]);
                 
                usuar.setConexion(conexion);
                Vector vector = usuar.verMsj(nick);
                if(vector != null &&  !vector.isEmpty()){ // 2
                    Mensaje id=(Mensaje)vector.lastElement();
                    nMsj = id.getId();
                    vector=null;
                    CitaBD citaAlm = new CitaBD();
                    citaAlm.setConexion(conexion);
                    citaAlm.setCita(nvaCita);
                    if(citaAlm.crearCita( nMsj)){ // 3
                        out.println("CITA OK </BR>");
                        if(citaAlm.aviso(destinoCita[i],0)){ // 4
                            out.println("AVISO OK </BR>");
                            } // 4
                        else{
                            out.println("AVISO FALLO </br>"+ destinoCita[1]);}
                        } // 3
                    else{
                        out.println("FALLA EN CREACION DE CITA");
                        out.println("<a href=Citas.jsp>VOLVER</a><BR>");
                        }
                    } // 2
                 else{
                     out.println("ERROR en vector </BR>");
                     out.println("<a href=Citas.jsp?idMsj=0>VOLVER</a><BR>");
                     }
            }// for
            
            
       }
       out.println("<a href='Citas.jsp?idMsj=0'>VOLVER</a>");
     }
     else{
        response.sendRedirect("../index.jsp");
     }
%>
    
    
    
    </body>
</html>
