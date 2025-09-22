package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelDAO.VehiculosDAO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ControllerEstadisticas", value = "/ControllerEstadisticas")
public class ControllerEstadisticas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VehiculosDAO vehiculosDAO = new VehiculosDAO();
        int total = vehiculosDAO.getCantidadTotalVehiculos();
        List<String> tipos = vehiculosDAO.getTiposVehiculo();
        Map<String, Integer> cantidadPorTipo = new HashMap<>();
        Map<String, Double> porcentajePorTipo = new HashMap<>();
        for (String tipo : tipos) {
            int cantidad = vehiculosDAO.getCantidadPorTipo(tipo);
            cantidadPorTipo.put(tipo, cantidad);
            double porcentaje = total > 0 ? (cantidad * 100.0) / total : 0;
            porcentajePorTipo.put(tipo, porcentaje);
        }
        request.setAttribute("totalVehiculos", total);
        request.setAttribute("tiposVehiculo", tipos);
        request.setAttribute("cantidadPorTipo", cantidadPorTipo);
        request.setAttribute("porcentajePorTipo", porcentajePorTipo);
        request.getRequestDispatcher("estadisticas.jsp").forward(request, response);
    }
}
