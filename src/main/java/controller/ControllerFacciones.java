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
import modelDAO.FaccionesDAO;

@WebServlet(name = "ControllerFacciones", value = "/ControllerFacciones")
public class ControllerFacciones extends HttpServlet {

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
          FaccionesDAO faccionesDAO = new FaccionesDAO();
          Facciones faccion = faccionesDAO.getFaccion(id);

          // Obtener la lista de facciones para la tabla
          List<Facciones> listaFacciones = faccionesDAO.getFacciones();

          request.setAttribute("faccion", faccion);
          request.setAttribute("facciones", listaFacciones);
          System.out.println("Editando facción: " + faccion.getNombre());
          request.getRequestDispatcher("facciones.jsp").forward(request, response);
          return;
        }
        case "eliminar": {
          // ELIMINAR
          System.out.println("Eliminar facción");
          int id = Integer.parseInt(request.getParameter("id"));
          FaccionesDAO faccionesDAO = new FaccionesDAO();
          boolean eliminado = faccionesDAO.deleteFaccion(id);
          if (eliminado) {
            System.out.println("Facción eliminada exitosamente con ID: " + id);
          } else {
            System.out.println("No se pudo eliminar la facción con ID: " + id);
          }
          response.sendRedirect("ControllerFacciones");
          return;
        }
      }
    }

    // Comportamiento por defecto - mostrar lista
    FaccionesDAO faccionesDAO = new FaccionesDAO();
    List<Facciones> listaFacciones = faccionesDAO.getFacciones();

    request.setAttribute("facciones", listaFacciones);
    request.getRequestDispatcher("facciones.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombreFaccion");
    String descripcion = request.getParameter("descripcion");

    FaccionesDAO faccionesDAO = new FaccionesDAO();

    if ("actualizar".equals(accion)) {
      // ACTUALIZAR FACCIÓN EXISTENTE
      int id = Integer.parseInt(request.getParameter("id"));
      Facciones faccion = new Facciones();
      faccion.setId_faccion(id);
      faccion.setNombre(nombre);
      faccion.setDescripcion(descripcion);

      boolean actualizado = faccionesDAO.updateFaccion(faccion);
      if (actualizado) {
        System.out.println("Facción actualizada exitosamente con ID: " + id);
      } else {
        System.out.println("No se pudo actualizar la facción con ID: " + id);
      }
    } else {
      // CREAR NUEVA FACCIÓN
      Facciones faccion = new Facciones();
      faccion.setNombre(nombre);
      faccion.setDescripcion(descripcion);

      faccionesDAO.addFaccion(faccion);
      System.out.println("Nueva facción agregada: " + nombre);
    }

    response.sendRedirect("ControllerFacciones");
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }
}
