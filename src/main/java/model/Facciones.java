package model;

public class Facciones {
  private int id_faccion;
  private String nombre;
  private String Descripcion;

  public Facciones() {
  }

  public Facciones(int id_faccion, String nombre, String descripcion) {
    this.id_faccion = id_faccion;
    this.nombre = nombre;
    Descripcion = descripcion;
  }

  public int getId_faccion() {
    return id_faccion;
  }

  public void setId_faccion(int id_faccion) {
    this.id_faccion = id_faccion;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public String getDescripcion() {
    return Descripcion;
  }

  public void setDescripcion(String descripcion) {
    Descripcion = descripcion;
  }
}
