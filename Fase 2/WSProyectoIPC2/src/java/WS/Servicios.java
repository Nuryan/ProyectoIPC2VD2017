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
import java.util.ArrayList;
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
            @WebParam(name = "nombres") String nombres,
            @WebParam(name = "apellidos") String apellidos,
            @WebParam(name = "contraseña") String contraseña,
            @WebParam(name = "apodo") String apodo,
            @WebParam(name = "llave") String llave) {
        int devolver = 0;

        try {
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();

            String query = "insert into usuario(nombres, apellidos, apodo, contraseña) values('"
                    + nombres + "', '" + apellidos + "', '" + apodo + "', AES_ENCRYPT('" + contraseña + "','" + llave + "'));";

            if (sentencia.executeUpdate(query) > 0) {
                devolver++;
            }

            return devolver;
        } catch (Exception e) {
            return -1;
        }
    }

    @WebMethod(operationName = "getNumSession")
    public int getNumSession(@WebParam(name = "apodo") String apodo) {
        try {
            int retornado = 0;

            Connection conexion = Conexion.conectar();

            Statement stmt = conexion.createStatement();

            String query = "select numSesion from usuario where apodo='" + apodo + "'";
            ResultSet resultado = stmt.executeQuery(query);

            if (resultado.next() == true) {
                return resultado.getInt("numSesion");
            }
            return retornado;
        } catch (Exception e) {
            return -1;
        }
    }

    private int getIDUsuario(String apodo) {
        try {
            Connection conexion = Conexion.conectar();
            Statement sentencia = conexion.createStatement();
            String query = "select idUsuario from usuario where apodo = '" + apodo + "'";
            ResultSet resultado = sentencia.executeQuery(query);
            resultado.next();
            return resultado.getInt("idUsuario");
        } catch (Exception e) {
            return -1;
        }
    }

    private int getIDConocimiento(String nombre) {
        try {
            Connection conexion = Conexion.conectar();
            Statement sentencia = conexion.createStatement();
            String query = "select idConocimiento from conocimiento where nombre = '" + nombre + "'";
            ResultSet resultado = sentencia.executeQuery(query);
            resultado.next();
            return resultado.getInt("idConocimiento");
        } catch (Exception e) {
            return -1;
        }
    }

    @WebMethod(operationName = "getContactos")
    public String[] getContactos(@WebParam(name = "apodo") String apodo) {
        try {
            ArrayList<String> auxiliar = new ArrayList();
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();

            String query = "select usuario.apodo from contactos inner join usuario on contactos.usuarioDos = usuario.idUsuario where contactos.usuarioUno = " + getIDUsuario(apodo);
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                auxiliar.add(resultado.getString("apodo"));
            }
            String[] devolver = auxiliar.toArray(new String[0]);

            return devolver;
        } catch (Exception e) {
            String[] devolverSiFalla = {e.toString()};
            return devolverSiFalla;
        }
    }

    @WebMethod(operationName = "getConocimientos")
    public String[] getConocimientos() {
        try {
            ArrayList<String> auxiliar = new ArrayList();
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();

            String query = "select nombre from conocimiento";
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                auxiliar.add(resultado.getString("nombre"));
            }
            String[] devolver = auxiliar.toArray(new String[0]);

            return devolver;

        } catch (Exception e) {
            String[] devolver = {e.toString()};
            return devolver;
        }
    }

    @WebMethod(operationName = "getConocimientosDeUsuario")
    public String[] getConocimientosDeUsuario(@WebParam(name = "apodo") String apodo) {
        try {
            ArrayList<String> auxiliar = new ArrayList();
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();

            String query = "select nombre from conocimientoadquirido inner join conocimiento on conocimientoadquirido.idConocimiento = Conocimiento.idConocimiento where idUsuario = " + getIDUsuario(apodo);
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                auxiliar.add(resultado.getString("nombre"));
            }
            String[] devolver = auxiliar.toArray(new String[0]);

            return devolver;
        } catch (Exception e) {
            String[] aee = {};
            return aee;
        }
    }

    @WebMethod(operationName = "agregarConocimiento")
    public int agregarConocimiento(
            @WebParam(name = "nombreConocimiento") String nombreConocimiento,
            @WebParam(name = "apodo") String apodo,
            @WebParam(name = "dominio") int dominio,
            @WebParam(name = "formaAprendido") String formaAprendido,
            @WebParam(name = "comentario") String comentario) {
        try {
            int devolver = 0;
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();

            String query = "insert into conocimientoadquirido(idConocimiento, idUsuario, dominio, formaAprendido, comentario) "
                    + "values(" + getIDConocimiento(nombreConocimiento) + "," + getIDUsuario(apodo) + "," + dominio + ",' " + formaAprendido + "','" + comentario + "')";

            if (sentencia.executeUpdate(query) > 0) {
                devolver++;
            }

            return devolver;
        } catch (Exception e) {
            return -1;
        }
    }

    @WebMethod(operationName = "getKarmaTotal")
    public double getKarmaTotal(@WebParam(name = "apodo") String apodo) {
        try {
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();

            String query = "select avg(karma) as 'karma' from conocimientoadquirido where idUsuario = " + getIDUsuario(apodo);
            ResultSet resultado = sentencia.executeQuery(query);
            resultado.next();
            return resultado.getDouble("karma");
        } catch (Exception e) {
            return 0.0;
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

    @WebMethod(operationName = "añadirContacto")
    public int añadirContacto(@WebParam(name = "usuario") String usuario,
            @WebParam(name = "contacto") String contacto) {
        try {
            int devolver = 0;
            Connection conexion = Conexion.conectar();

            Statement sentencia = conexion.createStatement();

            String query = "insert into contactos (usuarioUno, usuarioDos) values ("+getIDUsuario(usuario)+","+getIDUsuario(contacto)+")";

            if (sentencia.executeUpdate(query) > 0) {
                devolver++;
            }
            return devolver;
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
