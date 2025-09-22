package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Personajes;
import model.Vehiculos;
import modelDAO.PersonajesDAO;
import modelDAO.VehiculosDAO;


@WebServlet(name = "ControllerVehiculos", value = "/ControllerVehiculos")
public class ControllerVehiculos extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet NewServlet</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
      out.println("</body>");
      out.println("</html>");
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    VehiculosDAO vehiculos = null;
    PersonajesDAO personajes = null;
    try {
      vehiculos = new VehiculosDAO();
      personajes = new PersonajesDAO();
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    List<Personajes> listaPersonajes = personajes.getPersonajes();
    request.setAttribute("listaPersonajes", listaPersonajes);
    String filtroTipo = request.getParameter("filtroTipo");
    List<Vehiculos> listarvehiculos;
    if (filtroTipo != null && !filtroTipo.isEmpty()) {
      listarvehiculos = vehiculos.getVehiculosPorTipo(filtroTipo);
      request.setAttribute("filtroTipo", filtroTipo);
    } else {
      listarvehiculos = vehiculos.getVehiculos();
    }
    request.setAttribute("listarvehiculos", listarvehiculos);
    request.getRequestDispatcher("vehiculos.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");

    String accion = request.getParameter("accion");
    VehiculosDAO vehiculosDAO = new VehiculosDAO();
    PersonajesDAO personajesDAO = new PersonajesDAO();

    if ("eliminar".equals(accion)) {
      String id_vehiculo = request.getParameter("id_vehiculo");
      if (id_vehiculo != null && !id_vehiculo.isEmpty()) {
        vehiculosDAO.deleteVehiculo(Integer.parseInt(id_vehiculo));
      }
    } else if ("editar".equals(accion)) {
      String id_vehiculo = request.getParameter("id_vehiculo");
      if (id_vehiculo != null && !id_vehiculo.isEmpty()) {
  Vehiculos vehiculoEditar = vehiculosDAO.filtrarPorId(Integer.parseInt(id_vehiculo));
        request.setAttribute("vehiculoEditar", vehiculoEditar);
      }
    } else {
      // Guardar o actualizar
      String id_vehiculo = request.getParameter("id_vehiculo");
      String id_personaje = request.getParameter("personaje");
      String tipo = request.getParameter("tipo");
      String modelo = request.getParameter("modelo");
      if (id_personaje != null && tipo != null && modelo != null && !id_personaje.isEmpty() && !tipo.isEmpty() && !modelo.isEmpty()) {
        Vehiculos v = new Vehiculos();
        v.setId_personaje(id_personaje);
        v.setTipo(tipo);
        v.setModelo(modelo);
        if (id_vehiculo != null && !id_vehiculo.isEmpty()) {
          v.setId_vehiculo(id_vehiculo);
          vehiculosDAO.updateVehiculo(v);
        } else {
          vehiculosDAO.addVehiculo(v);
        }
      }
    }

    // Recargar datos para mostrar en la vista
    List<Personajes> listaPersonajes = personajesDAO.getPersonajes();
    request.setAttribute("listaPersonajes", listaPersonajes);
    List<Vehiculos> listarvehiculos = vehiculosDAO.getVehiculos();
    request.setAttribute("listarvehiculos", listarvehiculos);
    request.getRequestDispatcher("vehiculos.jsp").forward(request, response);
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
