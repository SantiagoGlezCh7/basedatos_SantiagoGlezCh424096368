
package practica1cvs;
import java.util.List;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;


public class Practica1Cvs {

    
    public static List<String[]> leerCSV(String nombreArchivoCSV) {
        List<String[]> filas = new ArrayList<>();
        File archivo = new File(nombreArchivoCSV);
        if (!archivo.exists()) {
            return filas; // Retorna lista vacía si el archivo no existe
        }

        try (Scanner scanner = new Scanner(archivo)) {
            while (scanner.hasNextLine()) {
                String linea = scanner.nextLine();
                String[] valores = linea.split(","); // Asume que las comas son separadores
                filas.add(valores);
            }
        } catch (FileNotFoundException e) {
            JOptionPane.showMessageDialog(null, "Archivo CSV no encontrado: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE); // Usamos null como parentComponent al ser método estático
            e.printStackTrace();
        }
        return filas;
    }


    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            crud_cvs ventanaCrudCvs = new crud_cvs();
            ventanaCrudCvs.setVisible(true);
        });
    }
    
}
