package modelDAO;

import db.Cn;
import jakarta.resource.cci.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class FaccionesDAO {
  private Cn cn;
  private Connection con;
  private PreparedStatement ps;
  private ResultSet rs;

  public FaccionesDAO() {
    cn = new Cn();
  }

  public
}
