package model;

public class Personajes {
    private int id_personaje;
    private int id_faccion;
    private String nombre;
    private String imagen;
    private String faccion;

    public Personajes() {
    }

    public Personajes(int id_personaje, int id_faccion, String nombre, String imagen) {
        this.id_personaje = id_personaje;
        this.id_faccion = id_faccion;
        this.nombre = nombre;
        this.imagen = imagen;
    }

    public Personajes(int id_personaje, int id_faccion, String nombre, String imagen, String faccion) {
        this.id_personaje = id_personaje;
        this.id_faccion = id_faccion;
        this.nombre = nombre;
        this.imagen = imagen;
        this.faccion = faccion;
    }

    public int getId_personaje() {
        return id_personaje;
    }

    public void setId_personaje(int id_personaje) {
        this.id_personaje = id_personaje;
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

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getFaccion() {
        return faccion;
    }

    public void setFaccion(String faccion) {
        this.faccion = faccion;
    }
}
