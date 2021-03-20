/*
 * FotoPredet.java
 *
 * Created on 6 de febrero de 2007, 18:35
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package foto;

import java.net.*; 
import java.io.*; 
/**
 *
 * @author ezequielher
 */
public class FotoPredet {
    
    /** Creates a new instance of FotoPredet */
    public FotoPredet() {
    }
    
    public File getFile(String direc){
        File archivo=new File("./predet.jpg");
        
        try {
            URL miUrl= new URL(direc);
            URLConnection conex= miUrl.openConnection();
            InputStream is = miUrl.openConnection().getInputStream(); 

            /* Abrimos el archivo para escritura */ 
            FileOutputStream fos = new FileOutputStream(archivo); 

            int dato; 
            /* Vamos leyendo bytes hasta que read() nos devuelva -1 */ 
            while ((dato=is.read()) != -1) 
             fos.write(dato); 

            /* Cerramos todos los streams */ 
            fos.close(); 
            is.close();   
        }
        catch(MalformedURLException e){            
        }
        catch(IOException e){
        }   
        return archivo;
    }
}
