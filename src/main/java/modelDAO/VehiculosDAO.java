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


    public List<Vehiculos> getVehiculosPorTipo(String tipo) {
        List<Vehiculos> vehiculos = new ArrayList<>();
        String sql = "SELECT v.*, p.nombre AS nombre_personaje FROM Vehiculos v JOIN Personajes p ON v.id_personaje = p.id_personaje WHERE v.tipo = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipo);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vehiculos v = new Vehiculos();
                v.setId_vehiculo(String.valueOf(rs.getInt("id_vehiculo")));
                v.setId_personaje(String.valueOf(rs.getInt("id_personaje")));
                v.setTipo(rs.getString("tipo"));
                v.setModelo(rs.getString("modelo"));
                v.setNombre_personaje(rs.getString("nombre_personaje"));
                vehiculos.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vehiculos;
    }

    public List<Vehiculos> getVehiculos() {
        List<Vehiculos> vehiculos = new ArrayList<>();
        String sql = "SELECT v.*, p.nombre AS nombre_personaje FROM Vehiculos v JOIN Personajes p ON v.id_personaje = p.id_personaje";
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
                v.setNombre_personaje(rs.getString("nombre_personaje")); // Nuevo campo
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
    // --- Métodos de estadísticas ---
    public int getCantidadTotalVehiculos() {
        String sql = "SELECT COUNT(*) FROM Vehiculos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public java.util.List<String> getTiposVehiculo() {
        java.util.List<String> tipos = new java.util.ArrayList<>();
        String sql = "SELECT DISTINCT tipo FROM Vehiculos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                tipos.add(rs.getString("tipo"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tipos;
    }

    public int getCantidadPorTipo(String tipo) {
        String sql = "SELECT COUNT(*) FROM Vehiculos WHERE tipo = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipo);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
}
