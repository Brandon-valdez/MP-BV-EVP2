<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22/9/2025
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Facciones</title>
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
                        <a class="nav-link" href="CotrollerPersonajes">
                            <i class="fas fa-users me-1"></i>
                            Personajes
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ControllerFacciones">
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
        <jsp:useBean id="faccion" scope="request" type="model.Facciones" class="model.Facciones"/>

        <h2>
            <c:choose>
                <c:when test="${not empty faccion.nombre}">
                    <i class="fas fa-edit me-2"></i>Editar Facción
                </c:when>
                <c:otherwise>
                    <i class="fas fa-plus me-2"></i>Agregar Facción
                </c:otherwise>
            </c:choose>
        </h2>

        <form action="ControllerFacciones" method="post">
            <!-- Campo oculto para la acción y el ID en caso de edición -->
            <c:if test="${not empty faccion.nombre}">
                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="id" value="${faccion.id_faccion}">
            </c:if>

            <div class="mb-3 row">
                <label for="selectFaccion" class="col-4 col-form-label">Nombre de la facción</label>
                <div class="col-8">
                    <select class="form-select" name="nombreFaccion" id="selectFaccion" required>
                        <option value="">Selecciona una facción</option>
                        <option value="Autobots" <c:if test="${faccion.nombre == 'Autobots'}">selected</c:if>>Autobots</option>
                        <option value="Decepticons" <c:if test="${faccion.nombre == 'Decepticons'}">selected</c:if>>Decepticons</option>
                    </select>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="inputDescripcion" class="col-4 col-form-label">Descripción</label>
                <div class="col-8">
                    <textarea class="form-control" name="descripcion" id="inputDescripcion"
                              placeholder="Descripción de la facción" rows="3" required>${faccion.descripcion}</textarea>
                    <div class="form-text">Proporciona una descripción detallada de la facción</div>
                </div>
            </div>

            <div class="mb-3 row">
                <div class="offset-sm-4 col-sm-8">
                    <button type="submit" class="btn btn-primary">
                        <c:choose>
                            <c:when test="${not empty faccion.nombre}">
                                <i class="fas fa-save me-1"></i>Actualizar Facción
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-plus me-1"></i>Agregar Facción
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${not empty faccion.nombre}">
                        <a href="ControllerFacciones" class="btn btn-secondary ms-2">
                            <i class="fas fa-times me-1"></i>Cancelar
                        </a>
                    </c:if>
                </div>
            </div>
        </form>
    </div>

    <!-- Tabla de Facciones -->
    <div class="container mt-5">
        <h2><i class="fas fa-list me-2"></i>Lista de Facciones</h2>

        <!-- Filtro por Nombre -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="buscarFaccion" class="form-label">Buscar por nombre:</label>
                <input type="text" class="form-control" id="buscarFaccion" 
                       placeholder="Escribe el nombre de la facción..." 
                       onkeyup="filtrarFacciones()">
            </div>
            <div class="col-md-3 d-flex align-items-end">
                <button type="button" class="btn btn-outline-secondary" onclick="limpiarFiltros()">
                    <i class="fas fa-times me-1"></i>Limpiar filtros
                </button>
            </div>
            <div class="col-md-3 d-flex align-items-end justify-content-end">
                <button type="button" class="btn btn-success" onclick="window.location.href='ControllerFacciones'">
                    <i class="fas fa-plus me-1"></i>Nueva Facción
                </button>
            </div>
        </div>

        <jsp:useBean id="facciones" scope="request" type="java.util.List<model.Facciones>"/>

        <div class="table-responsive">
            <table class="table table-striped table-hover" id="tablaFacciones">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="faccion" items="${facciones}">
                        <tr>
                            <td>${faccion.id_faccion}</td>
                            <td>${faccion.nombre}</td>
                            <td>${faccion.descripcion}</td>
                            <td>
                                <a href="ControllerFacciones?accion=editar&id=${faccion.id_faccion}" 
                                   class="btn btn-sm btn-warning me-1">
                                    <i class="fas fa-edit me-1"></i>Editar
                                </a>
                                <a href="ControllerFacciones?accion=eliminar&id=${faccion.id_faccion}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('¿Estás seguro de que deseas eliminar la facción ${faccion.nombre}?\n\nEsta acción no se puede deshacer y puede afectar a los personajes asociados.');">
                                    <i class="fas fa-trash me-1"></i>Eliminar
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Mensaje cuando no hay facciones registradas -->
        <c:if test="${empty facciones}">
            <div class="alert alert-info text-center" role="alert">
                <h4 class="alert-heading">No hay facciones registradas</h4>
                <p>Agrega la primera facción usando el formulario de arriba.</p>
                <hr>
                <p class="mb-0">
                    <button class="btn btn-primary" onclick="window.scrollTo(0, 0)">
                        <i class="fas fa-arrow-up me-1"></i>Ir al formulario
                    </button>
                </p>
            </div>
        </c:if>

        <!-- Mensaje cuando no hay resultados del filtro -->
        <div id="mensajeSinResultados" class="alert alert-warning text-center" role="alert" style="display: none;">
            <h4 class="alert-heading">No se encontraron facciones</h4>
            <p>No hay facciones que coincidan con los filtros aplicados.</p>
        </div>
    </div>

    <!-- JavaScript para filtrado -->
    <script>
        function filtrarFacciones() {
            const buscarFaccion = document.getElementById('buscarFaccion').value.toLowerCase();
            filtrarTabla(buscarFaccion);
        }

        function filtrarTabla(buscarFaccion) {
            const tabla = document.getElementById('tablaFacciones');
            const filas = tabla.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            let filasVisibles = 0;

            for (let i = 0; i < filas.length; i++) {
                const fila = filas[i];
                const celdas = fila.getElementsByTagName('td');
                
                if (celdas.length > 0) {
                    const nombreFaccion = celdas[1].textContent.toLowerCase(); // Columna del nombre
                    const descripcionFaccion = celdas[2].textContent.toLowerCase(); // Columna de la descripción
                    
                    // Verificar si la fila coincide con los filtros
                    const coincideNombre = buscarFaccion === '' || nombreFaccion.includes(buscarFaccion);
                    const coincideDescripcion = buscarFaccion === '' || descripcionFaccion.includes(buscarFaccion);
                    
                    if (coincideNombre || coincideDescripcion) {
                        fila.style.display = '';
                        filasVisibles++;
                    } else {
                        fila.style.display = 'none';
                    }
                }
            }

            // Mostrar/ocultar mensaje de sin resultados
            const mensajeSinResultados = document.getElementById('mensajeSinResultados');
            if (filasVisibles === 0 && buscarFaccion !== '') {
                mensajeSinResultados.style.display = 'block';
            } else {
                mensajeSinResultados.style.display = 'none';
            }
        }

        function limpiarFiltros() {
            // Limpiar los campos de filtro
            document.getElementById('buscarFaccion').value = '';
            
            // Mostrar todas las filas
            const tabla = document.getElementById('tablaFacciones');
            const filas = tabla.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            
            for (let i = 0; i < filas.length; i++) {
                filas[i].style.display = '';
            }

            // Ocultar mensaje de sin resultados
            document.getElementById('mensajeSinResultados').style.display = 'none';
        }

        // Validación del formulario
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const faccionSelect = document.getElementById('selectFaccion');
            const descripcionInput = document.getElementById('inputDescripcion');

            if (form) {
                form.addEventListener('submit', function(e) {
                    let isValid = true;
                    let errorMessage = '';

                    // Validar facción seleccionada
                    if (!faccionSelect.value) {
                        isValid = false;
                        errorMessage += '- Debes seleccionar una facción (Autobots o Decepticons)\n';
                    }

                    // Validar descripción
                    if (!descripcionInput.value.trim()) {
                        isValid = false;
                        errorMessage += '- La descripción es obligatoria\n';
                    } else if (descripcionInput.value.trim().length < 10) {
                        isValid = false;
                        errorMessage += '- La descripción debe tener al menos 10 caracteres\n';
                    }

                    if (!isValid) {
                        e.preventDefault();
                        alert('Por favor corrige los siguientes errores:\n\n' + errorMessage);
                    }
                });
            }

            // Mejorar la experiencia de usuario con animaciones suaves
            const filtro = document.getElementById('buscarFaccion');
            if (filtro) {
                filtro.addEventListener('input', function() {
                    const tabla = document.getElementById('tablaFacciones');
                    tabla.style.transition = 'opacity 0.3s ease';
                });
            }
        });
    </script>

</body>

</html>