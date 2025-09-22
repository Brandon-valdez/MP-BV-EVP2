package modelDAO;

import db.Cn;
import model.Personajes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonajesDAO {
    private final Cn cn;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public PersonajesDAO() {
        cn = new Cn();
    }

    public List<Personajes> getPersonajes() {
        List<Personajes> personajes = new ArrayList<>();
        String sql = "select p.*, f.nombre as faccion_nombre " +
                     "from personajes p " +
                     "left join facciones f on p.id_faccion = f.id_faccion";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Personajes personaje = new Personajes();
                personaje.setId_personaje(rs.getInt("id_personaje"));
                personaje.setId_faccion(rs.getInt("id_faccion"));
                personaje.setNombre(rs.getString("nombre"));
                personaje.setImagen(rs.getString("imagen"));
                personaje.setFaccion(rs.getString("faccion_nombre")); // Cargar nombre de facción para la vista
                personajes.add(personaje);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return personajes;
    }

    public Personajes getPersonaje(int id_personaje) {
        Personajes personaje = new Personajes();
        String sql = "select p.*, f.nombre as faccion_nombre " +
                     "from personajes p " +
                     "left join facciones f on p.id_faccion = f.id_faccion " +
                     "where p.id_personaje = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_personaje);
            rs = ps.executeQuery();
            if (rs.next()) {
                personaje.setId_personaje(rs.getInt("id_personaje"));
                personaje.setId_faccion(rs.getInt("id_faccion"));
                personaje.setNombre(rs.getString("nombre"));
                personaje.setImagen(rs.getString("imagen"));
                personaje.setFaccion(rs.getString("faccion_nombre")); // Cargar nombre de facción para la vista
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return personaje;
    }

    public boolean addPersonaje(Personajes personaje) {
        String sql = "insert into personajes(id_faccion, nombre, imagen) values (?, ?, ?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, personaje.getId_faccion()); // Usar id_faccion para agregar
            ps.setString(2, personaje.getNombre());
            ps.setString(3, personaje.getImagen());
            int row = ps.executeUpdate();
            return row > 0;

        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updatePersonaje(Personajes personaje) {
        String sql = "update personajes set id_faccion = ?, nombre = ?, imagen = ? where id_personaje = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, personaje.getId_faccion()); // Usar id_faccion para editar
            ps.setString(2, personaje.getNombre());
            ps.setString(3, personaje.getImagen());
            ps.setInt(4, personaje.getId_personaje());
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deletePersonaje(int id_personaje) {
        String sql = "delete from personajes where id_personaje = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_personaje);
            int row = ps.executeUpdate();
            return row > 0;

        } catch (SQLException e) {
            return false;
        }
    }

    public List<Personajes> getPersonajesByFaccion(int id_faccion) {
        List<Personajes> personajes = new ArrayList<>();
        String sql = "select p.*, f.nombre as faccion_nombre " +
                     "from personajes p " +
                     "left join facciones f on p.id_faccion = f.id_faccion " +
                     "where p.id_faccion = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_faccion);
            rs = ps.executeQuery();

            while (rs.next()) {
                Personajes personaje = new Personajes();
                personaje.setId_personaje(rs.getInt("id_personaje"));
                personaje.setId_faccion(rs.getInt("id_faccion"));
                personaje.setNombre(rs.getString("nombre"));
                personaje.setImagen(rs.getString("imagen"));
                personaje.setFaccion(rs.getString("faccion_nombre")); // Cargar nombre de facción para la vista
                personajes.add(personaje);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return personajes;
    }
}