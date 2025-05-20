package proyectopostgresql;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class ConexionPostgreSQL {

    static final String url = "jdbc:postgresql://localhost:5432/empleados1"; // static final
    static final String usuario = "postgres"; // static final
    static final String contraseña = "123"; // static final

    public static Connection conectar(){
        Connection con=null;
        try{
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection(url, usuario, contraseña);
            System.out.println("Conexión a la base de datos exitosa desde conectar()");
        }catch(ClassNotFoundException e){
            System.err.println("Error: Driver JDBC de PostgreSQL no encontrado: " + e.getMessage());
            e.printStackTrace();
        }
        catch(SQLException e)
        {
            System.err.println("Error de conexión SQL en conectar(): " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }

}