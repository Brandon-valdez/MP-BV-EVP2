<%-- Created by IntelliJ IDEA. 
User: admin Date: 22/9/2025 
Time: 13:43 
To change this template use File | Settings |
File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <!-- Font Awesome para los iconos -->
          <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
          />
      <title>Personajes</title>
    </head>

    <body>
        <!-- Navbar de Navegación -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <div class="container">
            <a class="navbar-brand" href="#">
              <i class="fas fa-gamepad me-2"></i>
              Sistema de Gestión
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav me-auto">
                <li class="nav-item">
                  <a class="nav-link active" href="CotrollerPersonajes">
                    <i class="fas fa-users me-1"></i>
                    Personajes
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="ControllerFacciones">
                    <i class="fas fa-flag me-1"></i>
                    Facciones
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="ControllerVehiculos">
                    <i class="fas fa-car me-1"></i>
                    Vehículos
                  </a>
                </li>
              </ul>

              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-cog me-1"></i>
                    Opciones
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-chart-bar me-2"></i>Reportes</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-database me-2"></i>Base de Datos</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt me-2"></i>Salir</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>

        <!-- Contenido Principal -->
        <div class="container mb-3 mt-4">
          <jsp:useBean id="personaje" scope="request" type="model.Personajes" class="model.Personajes"/>

          <h2>
            <c:choose>
              <c:when test="${not empty personaje.nombre}">
                Editar Personaje
              </c:when>
              <c:otherwise>
                Agregar Personaje
              </c:otherwise>
            </c:choose>
          </h2>

          <form action="CotrollerPersonajes" method="post">
            <!-- Campo oculto para la acción y el ID en caso de edición -->
            <c:if test="${not empty personaje.nombre}">
              <input type="hidden" name="accion" value="actualizar">
              <input type="hidden" name="id" value="${personaje.id_personaje}">
            </c:if>

            <div class="mb-3 row">
              <label for="inputName" class="col-4 col-form-label">Nombre del personaje </label>
              <div class="col-8">
                <input type="text" class="form-control" name="nombrePersonaje" id="inputName"
                       placeholder="Name" value="${personaje.nombre}" />
              </div>
            </div>

            <div class="mb-3 row">
              <jsp:useBean id="facciones" scope="request" type="java.util.List<model.Facciones>"/>
              <label for="selectFaccion" class="col-4 col-form-label">Faccion</label>
              <div class="col-8">
                <select class="form-select" aria-label="Default select example" name="faccion" id="selectFaccion">
                  <c:forEach var="faccion" items="${facciones}">
                    <option value="${faccion.id_faccion}"
                            <c:if test="${faccion.id_faccion == personaje.id_faccion}">selected</c:if>>
                      ${faccion.nombre}
                    </option>
                  </c:forEach>
                </select>
              </div>
            </div>

            <div class="mb-3 row">
              <div class="col-12">
                <label for="inputImagen" class="form-label">URL imagen</label>
                <input
                  type="text"
                  class="form-control"
                  name="imagen"
                  id="inputImagen"
                  placeholder="URL de la imagen"
                  aria-describedby="fileHelpId"
                  value="${personaje.imagen}"
                />
                <div id="fileHelpId" class="form-text">Introduce la URL de la imagen del personaje</div>
              </div>
            </div>

            <div class="mb-3 row">
              <div class="offset-sm-4 col-sm-8">
                <button type="submit" class="btn btn-primary">
                  <c:choose>
                    <c:when test="${not empty personaje.nombre}">
                      Actualizar Personaje
                    </c:when>
                    <c:otherwise>
                      Agregar Personaje
                    </c:otherwise>
                  </c:choose>
                </button>
                <c:if test="${not empty personaje.nombre}">
                  <a href="CotrollerPersonajes" class="btn btn-secondary ms-2">Cancelar</a>
                </c:if>
              </div>
            </div>
          </form>
        </div>

        <!-- Tabla de Personajes -->
        <div class="container mt-5">
          <h2>Lista de Personajes</h2>

          <!-- Filtro por Facción -->
          <div class="row mb-3">
            <div class="col-md-4">
              <label for="filtroFaccion" class="form-label">Filtrar por Facción:</label>
              <select class="form-select" id="filtroFaccion" onchange="filtrarPorFaccion()">
                <option value="">Todas las facciones</option>
                <c:forEach var="faccion" items="${facciones}">
                  <option value="${faccion.nombre}">${faccion.nombre}</option>
                </c:forEach>
              </select>
            </div>
            <div class="col-md-4">
              <label for="buscarPersonaje" class="form-label">Buscar por nombre:</label>
              <input type="text" class="form-control" id="buscarPersonaje" 
                     placeholder="Escribe el nombre del personaje..." 
                     onkeyup="filtrarPersonajes()">
            </div>
            <div class="col-md-4 d-flex align-items-end">
              <button type="button" class="btn btn-outline-secondary" onclick="limpiarFiltros()">
                <i class="fas fa-times me-1"></i>Limpiar filtros
              </button>
            </div>
          </div>

          <jsp:useBean id="personajes" scope="request" type="java.util.List<model.Personajes>"/>

          <div class="table-responsive">
            <table class="table table-striped table-hover" id="tablaPersonajes">
              <thead class="table-dark">
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Nombre</th>
                  <th scope="col">Facción</th>
                  <th scope="col">Imagen</th>
                  <th scope="col">Acciones</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="personaje" items="${personajes}">
                  <tr>
                    <td>${personaje.id_personaje}</td>
                    <td>${personaje.nombre}</td>
                    <td>${personaje.faccion}</td>
                    <td>
                      <c:if test="${not empty personaje.imagen}">
                        <img src="${personaje.imagen}" alt="${personaje.nombre}"
                             class="img-thumbnail" style="max-width: 60px; max-height: 60px;">
                      </c:if>
                      <c:if test="${empty personaje.imagen}">
                        <span class="text-muted">Sin imagen</span>
                      </c:if>
                    </td>
                    <td>
                      <a href="CotrollerPersonajes?accion=editar&&id=${personaje.id_personaje}" class="btn btn-sm btn-warning me-1">
                        <i class="fas fa-edit me-1"></i>Editar
                      </a>
                      <a href="CotrollerPersonajes?accion=eliminar&&id=${personaje.id_personaje}"
                         class="btn btn-sm btn-danger"
                         onclick="return confirm('¿Estás seguro de que deseas eliminar el personaje ${personaje.nombre}?\n\nEsta acción no se puede deshacer.');">
                        <i class="fas fa-trash me-1"></i>Eliminar
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

          <!-- Mensaje cuando no hay personajes registrados -->
          <c:if test="${empty personajes}">
            <div class="alert alert-info text-center" role="alert">
              <h4 class="alert-heading">No hay personajes registrados</h4>
              <p>Agrega el primer personaje usando el formulario de arriba.</p>
            </div>
          </c:if>

          <!-- Mensaje cuando no hay resultados del filtro -->
          <div id="mensajeSinResultados" class="alert alert-warning text-center" role="alert" style="display: none;">
            <h4 class="alert-heading">No se encontraron personajes</h4>
            <p>No hay personajes que coincidan con los filtros aplicados.</p>
          </div>
        </div>

        <!-- JavaScript para filtrado -->
        <script>
          function filtrarPorFaccion() {
            const filtroFaccion = document.getElementById('filtroFaccion').value.toLowerCase();
            const buscarPersonaje = document.getElementById('buscarPersonaje').value.toLowerCase();
            
            filtrarTabla(filtroFaccion, buscarPersonaje);
          }

          function filtrarPersonajes() {
            const filtroFaccion = document.getElementById('filtroFaccion').value.toLowerCase();
            const buscarPersonaje = document.getElementById('buscarPersonaje').value.toLowerCase();
            
            filtrarTabla(filtroFaccion, buscarPersonaje);
          }

          function filtrarTabla(filtroFaccion, buscarPersonaje) {
            const tabla = document.getElementById('tablaPersonajes');
            const filas = tabla.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            let filasVisibles = 0;

            for (let i = 0; i < filas.length; i++) {
              const fila = filas[i];
              const celdas = fila.getElementsByTagName('td');
              
              if (celdas.length > 0) {
                const nombrePersonaje = celdas[1].textContent.toLowerCase(); // Columna del nombre
                const faccionPersonaje = celdas[2].textContent.toLowerCase(); // Columna de la facción
                
                // Verificar si la fila coincide con los filtros
                const coincideFaccion = filtroFaccion === '' || faccionPersonaje.includes(filtroFaccion);
                const coincideNombre = buscarPersonaje === '' || nombrePersonaje.includes(buscarPersonaje);
                
                if (coincideFaccion && coincideNombre) {
                  fila.style.display = '';
                  filasVisibles++;
                } else {
                  fila.style.display = 'none';
                }
              }
            }

            // Mostrar/ocultar mensaje de sin resultados
            const mensajeSinResultados = document.getElementById('mensajeSinResultados');
            if (filasVisibles === 0 && (filtroFaccion !== '' || buscarPersonaje !== '')) {
              mensajeSinResultados.style.display = 'block';
            } else {
              mensajeSinResultados.style.display = 'none';
            }
          }

          function limpiarFiltros() {
            // Limpiar los campos de filtro
            document.getElementById('filtroFaccion').value = '';
            document.getElementById('buscarPersonaje').value = '';
            
            // Mostrar todas las filas
            const tabla = document.getElementById('tablaPersonajes');
            const filas = tabla.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            
            for (let i = 0; i < filas.length; i++) {
              filas[i].style.display = '';
            }

            // Ocultar mensaje de sin resultados
            document.getElementById('mensajeSinResultados').style.display = 'none';
          }

          // Agregar efecto de resaltado en tiempo real
          function resaltarTexto(texto, busqueda) {
            if (!busqueda) return texto;
            
            const regex = new RegExp(`(${busqueda})`, 'gi');
            return texto.replace(regex, '<mark>$1</mark>');
          }

          // Mejorar la experiencia de usuario con animaciones suaves
          document.addEventListener('DOMContentLoaded', function() {
            const filtros = document.querySelectorAll('#filtroFaccion, #buscarPersonaje');
            filtros.forEach(filtro => {
              filtro.addEventListener('input', function() {
                // Agregar clase para animación suave
                const tabla = document.getElementById('tablaPersonajes');
                tabla.style.transition = 'opacity 0.3s ease';
              });
            });
          });
        </script>

    </body>

    </html>
