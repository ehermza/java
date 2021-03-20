<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="empre.Conexion" %>
<%@page import="empre.cargo.Lider" %>
<%@page import="empre.basedatos.LiderBD" %>
<%@page import="java.util.Vector" %>
<%@page import="empre.cargo.Empleado" %>
<%@page import="java.util.GregorianCalendar" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body bgcolor="lightgray">
    <CENTER>
        <FONT FACE="Arial" SIZE="2" >

    <%
    if(session.getAttribute("perfil") != null && session.getAttribute("perfil").equals("lider")) {
        
    GregorianCalendar year = new GregorianCalendar();
%>
        <h3>MENU LIDER</h3>
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <thead>
                <tr>
                    <th><a href="../index.jsp">LOG OUT</a></th>
                    <th><a href="menu.jsp?idMsj=0">MENU</a></th>
                    <th><a href="Agenda.jsp?valor=0">AGENDA</a></th>
                    
                     </tr>
            </thead>
            
        </table>
        <BR/>
            <form name="carga" method="POST" action="cargaCita.jsp">
            
            <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
                <thead>
                    <tr>
                        <th colspan="6" >TITULO DE LA CITA</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6" align="center">
                        <input type="text" name="titulo" value="" /></td>
                    </tr>
                    <tr>
                        <th colspan="6">MENSAJE</th>
                    </tr>
                    <tr>
                        <th colspan="6"><textarea name="msj" rows="4" cols="50" maxlength ="255">
                        </textarea></th>
                    </tr>
                    <tr>
                        <th colspan="6">FECHA DE PRESENTACION</th>
                    </tr>
                    <tr>
                        <th>AÑO</th><th>MES</th><th>DIA</th><th>--</th><th>HORA</th><th>MINUTOS</th>
                    </tr>
                    <th><input type="text" name="year" value="<%= year.get(GregorianCalendar.YEAR)%>" maxlength ="4"/></th>
                    <th>
                            <select name="mes">
                                <option value="1">ENERO</option>
                                <option value="2">FEBRERO</option>
                                <option value="3">MARZO</option>
                                <option value="4">ABRIL</option>
                                <option value="5">MAYO</option>
                                <option value="6">JUNIO</option>
                                <option value="7">JULIO</option>
                                <option value="8">AGOSTO</option>
                                <option value="9">SEPTIEMBRE</option>
                                <option value="10">OCTUBRE</option>
                                <option value="11">NOVIEMBRE</option>
                                <option value="12">DICIEMBRE</option>
                            </select>
                    </th>
                    <TH>
                        <select name="dia">
                            <%for(int i=1 ; i <32; i++){%>
                            <option value=<%= i%>><%= i%></option>
                            <%}%>
                    </TH>
                    <th>--</th>
                    <TH>
                        <select name="hora">
                            <%for(int i=8 ; i <21; i++){%>
                            <option value=<%= i%>><%= i%></option>
                            <%}%>
                    </TH>
                    <TH>
                        <select name="min">
                            <%for(int i=0 ; i <60; i++){%>
                            <option value=<%= i%>><%= i%></option>
                            <%}%>
                    </TH>
                    <tr>
                        <th colspan="6">DESTINO [ empleados ]</th>
                    </tr>
                    <tr>
                       <th colspan="6" align="left">
                <%
                   String empresa = (String)session.getAttribute("empresa");  
                   
                Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","gaston","1234");
                LiderBD lider = new LiderBD();
                lider.setConexion(conexion);
                Vector misEmp = lider.misEmpleados(empresa);
                if(misEmp != null  &&  !misEmp.isEmpty()){
                    for (int i=0; i < misEmp.size();i++){
                        Empleado empleado=(Empleado)misEmp.elementAt(i); %>
                        <input type="checkbox" name="emp" value=<%=empleado.getNick()%> /> <%=empleado.getNick()%>
                        <br>
                      <%}
                }
                else{ 
                    out.println("SIN REGISTROS");
                }%>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="6">DESTINO [ lider(es) ]</th>
                    </tr>
                    <tr >
                        
                        <th colspan="6" align="left">
                        
                      <%
                        LiderBD lider2 = new LiderBD();
                        lider2.setConexion(conexion);
                        
                        Vector lideres = lider2.getLideres(empresa);
                        if(lideres != null  &&  !lideres.isEmpty()){
                            for (int j=0; j < lideres.size();j++){
                            Empleado colegas=(Empleado)lideres.elementAt(j);
%>
                            <input type="checkbox" name="emp" value=<%=colegas.getNick()%> /> <%=colegas.getNick()%>
                            <br>
                      <%}
                }
                else{ 
                    out.println("SIN REGISTROS");
                }%>
                        </th>
                        
                    </tr>
                    <tr>
                        <th colspan="6"><input type="submit" value="CARGAR" name="CARGAR" /></th>
                    </tr>
                </tbody>
            </table>
            </form>

<%}
    else{
        response.sendRedirect("../index.jsp");
    }
%>
        </FONT>
    </CENTER>
    </body>
</html>
