<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22/9/2025
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
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
      <title>Personajes</title>
    </head>

    <body>
     
        <div class="container mb-3">
          <form>
            
              <div class="mb-3 row">
                <label for="inputName" class="col-4 col-form-label">Personaje</label>
                <div class="col-8">
                  
                    <select
                      class="form-select form-select-lg"
                      name="personaje"
                      id=""
                    >
                      <option selected>Select one</option>
                                          
                    </select>
                </div>
              </div>

                <div class="mb-3 row">
                <label for="inputName" class="col-4 col-form-label">Tipo</label>
                <div class="col-8">
                  
                    <select
                      class="form-select form-select-lg"
                      name="tipo"
                      id=""
                    >
                      <option selected>Select one</option>
                      <option value="Auto">Auto</option>
                      <option value="Avion">Avion</option>
                      <option value="Moto">Moto</option>
                      <option value="Camion">Camion</option>                   
                    </select>
                </div>
              </div>

            <div class="mb-3 row">
              <label for="inputName" class="col-4 col-form-label">Modelo</label>
              <div class="col-8">
                <input type="text" class="form-control" name="modelo" id="inputName" placeholder="ingrese el modelo" />
              </div>
            </div>
            <div class="mb-3 row">
              <div class="offset-sm-4 col-sm-8">
                <button type="submit" class="btn btn-primary">
                  Agregar Faccion
                </button>
              </div>
            </div>
          </form>
        </div>


   
    </body>

    </html>
