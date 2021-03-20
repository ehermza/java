/*
 * Lider.java
 *
 * Created on 15 de febrero de 2007, 22:09
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package empre.cargo;

/**
 *
 * @author ezequielher
 */
public class Lider extends Empleado {
    private int id_proy;
    /** Creates a new instance of Lider */
    public Lider() {
    }
    public int getProyecto(){        
        return id_proy;
    }
    public void setProyecto(int proy){
        this.id_proy= proy;
    }
}
