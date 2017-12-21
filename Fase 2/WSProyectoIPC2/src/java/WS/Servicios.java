/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Nuryan
 */
@WebService(serviceName = "Servicios")
public class Servicios {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    @WebMethod(operationName = "insertarUsuario")
    public String insertarUsuario(@WebParam(name = "nombre") String nombre) {
        try {
            Connection con = Conexion.conectar();
            if (con != null) {
                String query = "insert into pruebas(id) values(?);";

                PreparedStatement ejecutar = con.prepareCall(query);

                ejecutar.setString(1, nombre);
                
                int devolver = ejecutar.executeUpdate();
                
                return devolver+"";
            } else {
                return "Conexion a DB fallida!";
            }
        } catch (Exception e) {
            return 0+"";
        }
    }
}
