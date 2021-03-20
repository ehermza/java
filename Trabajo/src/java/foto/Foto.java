/*
 * Foto.java
 *
 * Created on 17 de enero de 2007, 18:57
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package foto;
import java.io.File;

/*
 * User interfaces and operating systems use system-dependent 
 * pathname strings to name files and directories.
 *  This class presents an abstract, 
 * system-independent view of hierarchical pathnames.
 */

/**
 *
 * @author Chiaramonte
 */
public class Foto {
    
    private String nick; 
    private int id;
    private String filename;
    private int size;
    private String mime;
    //este file es donde se almacena temporalmente el archivo cuando se hace el
    //submit del formulario.
    private File tmpFile;
    //esta por ahi no es la mejor forma si vas a trabajar con archivos grandes,
    //pero sirve para el ejemplo. Si trabajas con archivos grandes te conviene
    //usar archivos temporales.
    private byte[] contenido;
    
    /** Creates a new instance of Foto */
    public Foto() {
    }
    
    public void setNick(String nk){
        this.nick=nk;
    }
    
    public String getNick(){
        return nick;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    
    public void setFilename(String filename) {
        this.filename = filename;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getMime() {
        return mime;
    }

    public void setMime(String mime) {
        this.mime = mime;
    }

    public File getTmpFile() {
        return tmpFile;
    }

    public void setTmpFile(File tmpFile) {
        this.tmpFile = tmpFile;
    }

    public byte[] getContenido() {
        return contenido;
    }

    public void setContenido(byte[] contenido) {
        this.contenido = contenido;
    }
    
    //otra forma de cargar el contenido. Un poco mas amigable
    public void setContenido(String contenido){
        this.contenido=contenido.getBytes();
    }
}
