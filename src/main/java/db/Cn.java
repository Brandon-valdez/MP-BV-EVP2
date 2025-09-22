package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Cn {
  private final Connection con;

  public Cn() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      this.con = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/transformers_MP_BV?useSSL=false&serverTimezone=UTC",
          "root",
          "");
    } catch (ClassNotFoundException | SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public Connection getConnection() {
    return con;
  }

  public boolean isConnected() {
    try {
      return this.con != null && !this.con.isClosed();
    } catch (SQLException e) {
      System.err.println("Error checking connection status: " + e.getMessage());
      return false;
    }
  }
}
