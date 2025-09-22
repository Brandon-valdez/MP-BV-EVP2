package modelDAO;

import db.Cn;
import model.Vehiculos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//prueba
public class VehiculosDAO {

    private final Cn cn;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public VehiculosDAO() {
        cn = new Cn();
    }

    public List<Vehiculos> getVehiculos() {
        List<Vehiculos> vehiculos = new ArrayList<>();
        String sql = "SELECT * FROM Vehiculos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vehiculos v = new Vehiculos();
                v.setId_vehiculo(String.valueOf(rs.getInt("id_vehiculo")));
                v.setId_personaje(String.valueOf(rs.getInt("id_personaje")));
                v.setTipo(rs.getString("tipo"));
                v.setModelo(rs.getString("modelo"));
                vehiculos.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vehiculos;
    }

    public Vehiculos filtrarPorId(int id_vehiculo) {
        Vehiculos v = null;
        String sql = "SELECT * FROM Vehiculos WHERE id_vehiculo = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_vehiculo);
            rs = ps.executeQuery();
            if (rs.next()) {
                v = new Vehiculos();
                v.setId_vehiculo(String.valueOf(rs.getInt("id_vehiculo")));
                v.setId_personaje(String.valueOf(rs.getInt("id_personaje")));
                v.setTipo(rs.getString("tipo"));
                v.setModelo(rs.getString("modelo"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return v;
    }

    public boolean addVehiculo(Vehiculos v) {
        String sql = "INSERT INTO Vehiculos (id_personaje, tipo, modelo) VALUES (?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(v.getId_personaje()));
            ps.setString(2, v.getTipo());
            ps.setString(3, v.getModelo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean updateVehiculo(Vehiculos v) {
        String sql = "UPDATE Vehiculos SET id_personaje = ?, tipo = ?, modelo = ? WHERE id_vehiculo = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(v.getId_personaje()));
            ps.setString(2, v.getTipo());
            ps.setString(3, v.getModelo());
            ps.setInt(4, Integer.parseInt(v.getId_vehiculo()));
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteVehiculo(int id_vehiculo) {
        String sql = "DELETE FROM Vehiculos WHERE id_vehiculo = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_vehiculo);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
