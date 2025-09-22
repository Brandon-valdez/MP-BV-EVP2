package model;

public class Vehiculos {
    private String id_vehiculo;
    private String id_personaje;
    private String tipo;
    private String modelo;
    private String nombre_personaje; // Nuevo campo

    public Vehiculos() {
    }

    public Vehiculos(String id_vehiculo, String id_personaje, String tipo, String modelo) {
        this.id_vehiculo = id_vehiculo;
        this.id_personaje = id_personaje;
        this.tipo = tipo;
        this.modelo = modelo;
    }

    public String getId_vehiculo() {
        return id_vehiculo;
    }

    public void setId_vehiculo(String id_vehiculo) {
        this.id_vehiculo = id_vehiculo;
    }

    public String getId_personaje() {
        return id_personaje;
    }

    public void setId_personaje(String id_personaje) {
        this.id_personaje = id_personaje;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getNombre_personaje() {
        return nombre_personaje;
    }

    public void setNombre_personaje(String nombre_personaje) {
        this.nombre_personaje = nombre_personaje;
    }
}
