package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Facciones;
import model.Personajes;
import modelDAO.FaccionesDAO;
import modelDAO.PersonajesDAO;


@WebServlet(name = "CotrollerPersonajes", value = "/CotrollerPersonajes")
public class CotrollerPersonajes extends HttpServlet {

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

    String accion = request.getParameter("accion");

    if (accion != null) {
      switch (accion) {
        case "editar": {
          // EDITAR
          int id = Integer.parseInt(request.getParameter("id"));
          PersonajesDAO personajesDAO = new PersonajesDAO();
          Personajes personaje = personajesDAO.getPersonajeById(id);

          // Obtener también las facciones para el select
          FaccionesDAO faccionesDAO = new FaccionesDAO();
          List<Facciones> listaFacciones = faccionesDAO.getFacciones();

          // Obtener la lista de personajes para la tabla
          List<Personajes> listaPersonajes = personajesDAO.getPersonajes();

          request.setAttribute("personaje", personaje);
          request.setAttribute("facciones", listaFacciones);
          request.setAttribute("personajes", listaPersonajes);
          System.out.println("Editando personaje: " + personaje.getNombre());
          request.getRequestDispatcher("personajes.jsp").forward(request, response);
          return;
        }
        case "eliminar": {
          // ELIMINAR
          System.out.println("Eliminar personaje");
          int id = Integer.parseInt(request.getParameter("id"));
          PersonajesDAO personajesDAO = new PersonajesDAO();
          boolean eliminado = personajesDAO.deletePersonaje(id);
          if (eliminado) {
            System.out.println("Personaje eliminado exitosamente con ID: " + id);
          } else {
            System.out.println("No se pudo eliminar el personaje con ID: " + id);
          }
          response.sendRedirect("CotrollerPersonajes");
          return;
        }
      }
    }

    // Comportamiento por defecto - mostrar lista
    PersonajesDAO personajesDAO = new PersonajesDAO();
    FaccionesDAO faccionesDAO = new FaccionesDAO();

    List<Personajes> listaPersonajes = personajesDAO.getPersonajes();
    List<Facciones> listaFacciones = faccionesDAO.getFacciones();

    request.setAttribute("personajes", listaPersonajes);
    request.setAttribute("facciones", listaFacciones);
    request.getRequestDispatcher("personajes.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombrePersonaje");
    int id_faccion = Integer.parseInt(request.getParameter("faccion"));
    String imagen = request.getParameter("imagen");

    PersonajesDAO personajesDAO = new PersonajesDAO();

    if ("actualizar".equals(accion)) {
      // ACTUALIZAR PERSONAJE EXISTENTE
      int id = Integer.parseInt(request.getParameter("id"));
      Personajes personaje = new Personajes();
      personaje.setId_personaje(id);
      personaje.setNombre(nombre);
      personaje.setImagen(imagen);
      personaje.setId_faccion(id_faccion);

      boolean actualizado = personajesDAO.updatePersonaje(personaje);
      if (actualizado) {
        System.out.println("Personaje actualizado exitosamente con ID: " + id);
      } else {
        System.out.println("No se pudo actualizar el personaje con ID: " + id);
      }
    } else {
      // CREAR NUEVO PERSONAJE
      Personajes personaje = new Personajes();
      personaje.setNombre(nombre);
      personaje.setImagen(imagen);
      personaje.setId_faccion(id_faccion);

      personajesDAO.addPersonaje(personaje);
      System.out.println("Nuevo personaje agregado: " + nombre);
    }

    response.sendRedirect("CotrollerPersonajes");
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
