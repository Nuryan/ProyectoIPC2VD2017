/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    /*
    Metodo para insertar
    @WebMethod(operationName = "crearUsuario")
    public int crearUsuario(){
        int devolver = 0;
        
        try{
            Connection conexion = Conexion.conectar();
            
            Statement sentencia = conexion.createStatement();
            
            String query = "";
            
            if(sentencia.executeUpdate(query)>0){
                devolver++;
            }
            
            return devolver;
        }catch(Exception e){
            return -1;
        }
    }
    
    //para consultas
    
    
    */
    @WebMethod(operationName = "crearUsuario")
    public int crearUsuarioAnonimo(
            @WebParam(name="nombres")String nombres,
            @WebParam(name="apellidos")String apellidos,
            @WebParam(name="contraseña")String contraseña,
            @WebParam(name="apodo")String apodo,
            @WebParam(name="llave")String llave){
        int devolver = 0;
        
        try{
            Connection conexion = Conexion.conectar();
            
            Statement sentencia = conexion.createStatement();
            
            String query = "insert into usuario(nombres, apellidos, apodo, contraseña) values('"+
                    nombres+"', '"+apellidos+"', '"+apodo+"', AES_ENCRYPT('"+contraseña+"','"+llave+"'));";
            
            if(sentencia.executeUpdate(query)>0){
                devolver++;
            }
            
            return devolver;
        }catch(Exception e){
            return -1;
        }
    }
    
    @WebMethod(operationName = "getNumSession")
        public int getNumSession(@WebParam(name = "apodo") String apodo){
         try {
            int retornado = 0;

            Connection conexion = Conexion.conectar();

            Statement stmt = conexion.createStatement();

            String query = "select numSesion from usuario where apodo='"+apodo+"'";
            ResultSet resultado = stmt.executeQuery(query);
            
            if(resultado.next()==true){
                return resultado.getInt("numSesion");
            }
            return retornado;
        } catch (Exception e) {
            return -1;
        }
    }
    
    @WebMethod(operationName = "insertNumSession")
    public boolean insertNumSession(@WebParam(name = "apodo") String apodo, @WebParam(name = "numSession") int numSession) {
        boolean devolver = false;

        try {
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();
            String query = "update usuario  set numSesion = " + numSession + " where apodo = '" + apodo + "'";
            if (sentencia.executeUpdate(query) > 0) {
                devolver = true;
                return devolver;
            } else {
                return false;
            }

        } catch (Exception e) {
            return false;
        }
    }

    @WebMethod(operationName = "getTipoUsuario")
    public int getTipoUsuario(@WebParam(name = "apodo") String apodo) {
        try {
            int retornado = 0;

            Connection conexion = Conexion.conectar();

            Statement stmt = conexion.createStatement();

            String query = "select tipoUsuario from usuario where apodo = '" + apodo + "'";
            ResultSet resultado = stmt.executeQuery(query);
            resultado.next();
            if (resultado.getString("tipoUsuario").equalsIgnoreCase("Administrador")) {
                return 1; 
            }

            return retornado;
        } catch (Exception e) {
            return -1;
        }
    }

    @WebMethod(operationName = "iniciarSesion")
    public boolean iniciarSesion(@WebParam(name = "Apodo") String apodo,
            @WebParam(name = "pass") String pass,
            @WebParam(name = "codigo") String codigo) {
        try {
            boolean devolver = false;
            Connection conexion = Conexion.conectar();

            Statement stmt = conexion.createStatement();

            String query = "select apodo from usuario where apodo = '" + apodo + "' and contraseña = AES_ENCRYPT('" + pass + "','" + codigo + "')";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                return true;
            }

            return devolver;
        } catch (Exception e) {
            return false;
        }

    }
}
