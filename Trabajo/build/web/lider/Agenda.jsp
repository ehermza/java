<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="calendario.*" %>
<%@page import="java.util.Vector"%>
<%@page import="cita.citaBD.CitaBD"%>
<%@page import="cita.Cita"%>
<%@page import="cita.Mensaje"%>
<%@page import="empre.basedatos.LiderBD"%>
<%@page import="empre.Conexion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import= "java.text.ParseException"%>
<%@page import= "java.util.Date"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMPLEADO</title>
    </head>
    <body bgcolor="lightgray">
    <center>
        
    <font face="Arial" size="2">
        
    <%
       if(session.getAttribute("perfil") != null && session.getAttribute("perfil").equals("lider")) {
           String nick=(String)session.getAttribute("nick");
        
    %>
    <%! int contador=0;%>
            <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
                <tr>
                    <th><a href="../index.jsp">LOG OUT</a></th>
                    <TH><a href="Citas.jsp">CREAR CITA</a></TH>
                    <TH><a href="menu.jsp?idMsj=0">MENU</a></TH>
                </tr>
            </table>
            </br>
            <table border="0" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
               <tr>
                   <th><a href="Agenda.jsp?valor=-1">RETROCEDER</a></th>
                   <th><a href="Agenda.jsp?valor=1">ADELANTAR</a></th>
                  
               </tr> 
               <tr>
                   <th colspan="2" align="center"><a href="Agenda.jsp?valor=0">DIA DE HOY</a></th>
                   
                  
               </tr> 
            </table>
            <br>
            <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
                <tr>
    <%
            Vector semana = null;
            Calendario cal = new Calendario();
            Fecha fecha = new Fecha();
            
            int valor= Integer.parseInt(request.getParameter("valor"));
           
            switch(valor){
                case 0:
                    contador=0;
                    semana = cal.semActual(contador);
                    break;
                case 1:
                    contador++;
                    semana = cal.semActual(contador);
                    break;
                case -1:
                    contador--;
                    semana = cal.semActual(contador);
                    break;
                case 2:
                    
                    semana = cal.semActual(contador);
                    break;
                    
            }
             
            for (int i=0; i < semana.size();i++){
                fecha = (Fecha)semana.elementAt(i);
                
    %>         
                <th><a href="Agenda.jsp?fecha=<%= fecha.getFecha()%>&mes=<%= fecha.getMes()%>&valor=2"><%= fecha.getDia()%> <%= fecha.getFecha()%>/<%=fecha.getMes()%></a></th>
                
    <%    
               }
    %>
                </tr>
                </table>
                </br>
    <%
            
            if(request.getParameter("fecha") != null && request.getParameter("mes") != null){
            
                String f=request.getParameter("fecha");
                String m= request.getParameter("mes");
                
                
                
                out.println("</br>");
                out.println("<table border=1 align=center cellpadding=2 cellspacing=0 bordercolor=#000000>");
                out.println("<TR><th>TITULO</TH><TH>HORA DE LA CITA</TH><TH>ESTADO</TH><TR>");
                Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","gaston","1234");
                Calendario horas = new Calendario();
                CitaBD cita =new CitaBD();
                LiderBD emp = new LiderBD();
                
                Vector diario =null;
                
                diario = horas.horario();
                //------DATOS PARA CITA
                Vector vecCita = null;
                Vector miMsj = null;
                cita.setConexion(conexion);
                emp.setConexion(conexion);
                vecCita = cita.verCita(nick);
                
                for(int i=0; i< diario.size(); i++){
                    
                    Fecha horTrabajo = (Fecha)diario.elementAt(i);
                    
                   
                    String dateSt = ""+fecha.getYear()+"-"+m+"-"+f+" "+horTrabajo.getHora()+"";
                    
                
    %>              <tr>
                    <th COLSPAN="3"><%= horTrabajo.getHora()%>:<%= horTrabajo.getMin()%></th>
                    
                    </tr>
    <%
                    
                    if(vecCita != null  &&  !vecCita.isEmpty()){
                        
                        for (int j=0; j < vecCita.size();j++){
                            
                            Cita idMsj = (Cita)vecCita.elementAt(j);
                            
                            
                            
                            miMsj = emp.verMsj(idMsj.getIdMsje());
                            if(miMsj != null  &&  !miMsj.isEmpty()){
                                
                                for (int k=0; k < miMsj.size();k++){
                                    
                                    Mensaje titulo = (Mensaje)miMsj.elementAt(k);
                                    String fechaTs =titulo.getFechaCitaTs().toString();
                                    
                                    if(fechaTs.indexOf(dateSt) != -1){
                                        
                                        //poner FILAS
                                        
    %>                                  <tr>
                                        <th><a href="misCitas.jsp?id=<%=titulo.getId()%>&est=2"><%= titulo.getTitulo()%></a></th>
                                        <th><%= titulo.getFechaCitaTs()%></th>
                                        <th><%
                                                int estado = idMsj.getEstado();
                                                if(estado == 2)
                                                    out.println("LEIDA");
                                                else 
                                                    out.println("RECIBIDA");
                                            %>
                                        </th>
                                        </TR>
                                        
   <%
                                        
                                    }
                                   // else{
   %>
                                        
  <%                                    
                                  //  }
                                    
                                    
                                }
                            }
                                                
                        }
                    }
                }
                out.println("</table>");
                
            }
            
                     
                
       }
       else{
           response.sendRedirect("../index.jsp");
       }
    %>
    
    
    
    </center>
    </body>
</html>
