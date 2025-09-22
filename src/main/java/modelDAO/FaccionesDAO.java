package modelDAO;

import db.Cn;
import model.Facciones;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FaccionesDAO {
    private final Cn cn;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public FaccionesDAO() {
        cn = new Cn();
    }

    public List<Facciones> getFacciones() {
        List<Facciones> facciones = new ArrayList<>();
        String sql = "select * from facciones";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Facciones faccion = new Facciones();
                faccion.setId_faccion(rs.getInt("id_faccion"));
                faccion.setNombre(rs.getString("nombre"));
                faccion.setDescripcion(rs.getString("descripcion"));
                facciones.add(faccion);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return facciones;
    }

    public Facciones getFaccion(int id_faccion) {
        Facciones faccion = new Facciones();
        String sql = "select * from facciones where id_faccion = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_faccion);
            rs = ps.executeQuery();
            if (rs.next()) {
                faccion.setId_faccion(rs.getInt("id_faccion"));
                faccion.setNombre(rs.getString("nombre"));
                faccion.setDescripcion(rs.getString("descripcion"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return faccion;
    }

    public boolean addFaccion(Facciones faccion) {
        String sql = "insert into facciones(nombre, descripcion) values (?, ?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, faccion.getNombre());
            ps.setString(2, faccion.getDescripcion());
            int row = ps.executeUpdate();
            return row > 0;

        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateFaccion(Facciones faccion) {
        String sql = "update facciones set nombre = ?, descripcion = ? where id_faccion = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, faccion.getNombre());
            ps.setString(2, faccion.getDescripcion());
            ps.setInt(3, faccion.getId_faccion());
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deleteFaccion(int id_faccion) {
        String sql = "delete from facciones where id_faccion = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_faccion);
            int row = ps.executeUpdate();
            return row > 0;

        } catch (SQLException e) {
            return false;
        }
    }
}
