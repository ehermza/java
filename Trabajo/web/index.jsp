<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%  session.invalidate(); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web de empresa X: Lider en implementar proyectos</title>
    </head>
    <body bgcolor="lightgray">

    <center>
        <font face='arial' size=4><br>
            <b>Servidor web de empresa YPF</b><br><br>
        
    <form action="./validar" method="POST">
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <thead>
                <tr>
                    <th align="right">Usuario</th>
                    <th><input type="text" name="usr" value="eze"  /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align="right">Contraseña</td>
                    <td><input type="password" name="pass" value="fuel"/></td>
                </tr>
                <tr>
                    <th colspan="2"><input type="submit" value="validar" /></th>
                </tr>
            </tbody>
        </table>

    </form>
        </font>
    </center>
   
    
    </body>
</html>
