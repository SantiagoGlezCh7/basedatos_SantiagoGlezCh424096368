/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectopostgresql;

import java.sql.Connection;
import java.sql.SQLException;
import static proyectopostgresql.ConexionPostgreSQL.conectar;


public class ProyectoPostgresql {

    /**s
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try (Connection conexion = ConexionPostgreSQL.conectar()) { // try-with-resources
            if (conexion != null) {
                System.out.println("¡Conexión a la base de datos PostgreSQL exitosa desde main()!"); // Mensaje de éxito en main
                System.out.println("Conexión cerrada desde main()."); // Connection will be automatically closed by try-with-resources
            } else {
                System.out.println("¡Fallo al conectar a la base de datos desde main()!"); // Mensaje de fallo en main
            }

            prueba ventana = new prueba();
            ventana.setVisible(true);

        } catch (Exception e) { // Catch any exceptions during connection or closing
            System.err.println("Error al conectar o cerrar la conexión en main(): " + e.getMessage());
            e.printStackTrace();
        }
    }
   
}
