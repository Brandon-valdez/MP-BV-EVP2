<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Estadísticas de Vehículos</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
	<h2>Estadísticas de Vehículos</h2>
	<div class="row mb-4">
		<div class="col-md-4">
			<div class="card text-bg-primary mb-3">
				<div class="card-body">
					<h5 class="card-title">Total de Vehículos</h5>
					<p class="card-text display-6">${totalVehiculos}</p>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="card mb-3">
				<div class="card-body">
					<h5 class="card-title">Cantidad de Vehículos por Tipo</h5>
					<table class="table table-bordered">
						<thead>
						<tr>
							<th>Tipo</th>
							<th>Cantidad</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="tipo" items="${tiposVehiculo}">
							<tr>
								<td>${tipo}</td>
								<td>${cantidadPorTipo[tipo]}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 offset-md-2">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Porcentaje de Vehículos por Tipo</h5>
					<canvas id="chartPorcentaje"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	const tipos = [
		<c:forEach var="tipo" items="${tiposVehiculo}">
			'<c:out value="${tipo}"/>',
		</c:forEach>
	];
	const porcentajes = [
		<c:forEach var="tipo" items="${tiposVehiculo}">
			${porcentajePorTipo[tipo]},
		</c:forEach>
	];
	const ctx = document.getElementById('chartPorcentaje').getContext('2d');
	new Chart(ctx, {
		type: 'pie',
		data: {
			labels: tipos,
			datasets: [{
				label: 'Porcentaje',
				data: porcentajes,
				backgroundColor: [
					'#007bff', '#28a745', '#ffc107', '#dc3545', '#6f42c1', '#17a2b8', '#fd7e14', '#20c997'
				],
			}]
		},
		options: {
			plugins: {
				legend: { position: 'bottom' },
				tooltip: {
					callbacks: {
						label: function(context) {
							return context.label + ': ' + context.parsed.toFixed(2) + '%';
						}
					}
				}
			}
		}
	});
</script>
</body>
</html>
