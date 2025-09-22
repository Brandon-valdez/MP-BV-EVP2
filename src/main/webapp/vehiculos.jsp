<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22/9/2025
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>
      <meta charset="UTF-8" />
      <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
          ></script>
      
          <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
          ></script>
          <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
          />
      <title>vehiculos</title>
    </head>

    <body>
     
        <div class="container mb-3">
         
          
          <form action="ControllerVehiculos" method="post">
            <c:if test="${not empty vehiculoEditar}">
              <input type="hidden" name="id_vehiculo" value="${vehiculoEditar.id_vehiculo}" />
            </c:if>
              <div class="mb-3 row">
                <label for="inputName" class="col-4 col-form-label">Personaje</label>
                <div class="col-8">
                    <select class="form-select form-select-lg" name="personaje" id="">
                      <option>Select one</option>
                      <c:forEach var="personaje" items="${listaPersonajes}">
                        <option value="${personaje.id_personaje}" <c:if test="${not empty vehiculoEditar && vehiculoEditar.id_personaje == personaje.id_personaje}">selected</c:if>>${personaje.nombre}</option>
                      </c:forEach>
                    </select>
                </div>
              </div>
              <div class="mb-3 row">
                <label for="inputName" class="col-4 col-form-label">Tipo</label>
                <div class="col-8">
                    <select class="form-select form-select-lg" name="tipo" id="">
                      <option>Select one</option>
                      <option value="Auto" <c:if test="${not empty vehiculoEditar && vehiculoEditar.tipo == 'Auto'}">selected</c:if>>Auto</option>
                      <option value="Avion" <c:if test="${not empty vehiculoEditar && vehiculoEditar.tipo == 'Avion'}">selected</c:if>>Avion</option>
                      <option value="Moto" <c:if test="${not empty vehiculoEditar && vehiculoEditar.tipo == 'Moto'}">selected</c:if>>Moto</option>
                      <option value="Camion" <c:if test="${not empty vehiculoEditar && vehiculoEditar.tipo == 'Camion'}">selected</c:if>>Camion</option>
                    </select>
                </div>
              </div>
            <div class="mb-3 row">
              <label for="inputName" class="col-4 col-form-label">Modelo</label>
              <div class="col-8">
                <input type="text" class="form-control" name="modelo" id="inputName" placeholder="ingrese el modelo" value="${vehiculoEditar.modelo}" />
              </div>
            </div>
            <div class="mb-3 row">
              <div class="offset-sm-4 col-sm-8">
                <button type="submit" class="btn btn-primary">
                  <c:choose>
                    <c:when test="${not empty vehiculoEditar}">Actualizar Vehiculo</c:when>
                    <c:otherwise>Agregar Vehiculo</c:otherwise>
                  </c:choose>
                </button>
              </div>
            </div>
          </form>
          <form action="ControllerVehiculos" method="get" class="mb-3">
            <div class="row">
              <div class="col-4">
                <select class="form-select" name="filtroTipo">
                  <option value="">Todos los tipos</option>
                  <option value="Auto" ${param.filtroTipo == 'Auto' ? 'selected' : ''}>Auto</option>
                  <option value="Avion" ${param.filtroTipo == 'Avion' ? 'selected' : ''}>Avion</option>
                  <option value="Moto" ${param.filtroTipo == 'Moto' ? 'selected' : ''}>Moto</option>
                  <option value="Camion" ${param.filtroTipo == 'Camion' ? 'selected' : ''}>Camion</option>
                </select>
              </div>
              <div class="col-2">
                <button type="submit" class="btn btn-secondary">Filtrar</button>
              </div>
            </div>
          </form>
          <div
            class="table-responsive"
          >
            <table
              class="table table-primary"
            >
              <thead>
                <tr>
                  <th scope="col">Personaje</th>
                  <th scope="col">tipo</th>
                  <th scope="col">modelo</th>
                  <th scope="col">Acciones</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="vehiculo" items="${listarvehiculos}">
                  <tr>
                    <td>${vehiculo.nombre_personaje}</td>
                    <td>${vehiculo.tipo}</td>
                    <td>${vehiculo.modelo}</td>
                    <td>
                      <form action="ControllerVehiculos" method="post" style="display:inline;">
                        <input type="hidden" name="accion" value="editar" />

                        <input type="hidden" name="id_vehiculo" value="${vehiculo.id_vehiculo}" />
                        <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                      </form>
                      <form action="ControllerVehiculos" method="post" style="display:inline;">
                        <input type="hidden" name="accion" value="eliminar" />
                        <input type="hidden" name="id_vehiculo" value="${vehiculo.id_vehiculo}" />
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('¿Seguro que deseas eliminar este vehículo?');">Eliminar</button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          
        </div>


   
    </body>

    </html>
