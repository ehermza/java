<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">
    <br>
    <center>
        <font face="arial" size="2">   
        <table border="1" align="center" cellpadding="2" width="100" bordercolor="#000000">
            <tr><th colspan="2" align="center">
                ¿Desea eliminar la empresa <%= request.getParameter("empr")%>?
            </th></tr>
            <tr>
            <td>
            <form action="../borrar_empre?" method="get">
                <input type="hidden" name="id" value="<%= request.getParameter("id")%>">
                <input type="hidden" name="nombre" value="<%= request.getParameter("empr")%>">                
                <input type="submit" value="Aceptar">
            </form>
            </td>
            <td>
            <form action="./lista_empre.jsp" method="get">
                <input type="submit" value="Cancela">
            </form>
            </td>
        </table>
        </font>
    </body>
</html>
