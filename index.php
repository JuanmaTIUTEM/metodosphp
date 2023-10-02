<?php 
	include "conection.php";

	$allUsers = getAllUsers($mysqli);

	?>

<!DOCTYPE html>
	<html>
		<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Practica Métodos HTTP/PHP</title>

		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<style type="text/css">
		.w-20{
			width: 19%;
			margin: .5%;
		}
		.w-80{
			width: 79%;
			margin: .5%;
		}
		.text-strong{
			font-weight: bold;
		}
	</style>
	<body>
		<main>
			<!-- Grey with black text -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			  <div class="container-fluid">
			    <ul class="navbar-nav">
			      <li class="nav-item">
			        <a class="nav-link active" href="#">Home</a>
			      </li>
			     <li class="nav-item">
			        <a class="nav-link" href="#">Contact</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Log Out</a>
			      </li>
			      
			    </ul>
			  </div>
			</nav>
		</main>
		<?php 	
			if ($_SERVER['REQUEST_METHOD'] === 'GET') {
				if(isset($_GET['msg'])){
					$msg = $_GET['msg'];
					if($_GET['err'] == 0){


		?>

			<div class="alert alert-success alert-dismissible">
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			    <strong>Correcto!</strong> <?php echo $msg;  ?>.
			 </div>

		<?php 
						
					}else{
		?>
			<div class="alert alert-danger alert-dismissible">
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			    <strong>ERROR!</strong> <?php  echo $msg;  ?>.
			  </div>
		<?php 
					}

				}
			} else {
			    echo "Error de metodos...";
			}

		 ?>
		<br>
		<div class="d-flex flex-wrap ">
			<section class="w-20">
				<nav class="navbar bg-secondary ">
				  <div class="container-fluid">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link text-white text-strong" onclick="nwUser()">Agregar usuario</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link text-white text-strong" onclick="uList()">Listado Usuarios</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link text-white text-strong" href="#">Cerrar Sesión</a>
				      </li>
				    </ul>
				  </div>
				</nav>
			</section>

			<section class="container bg-white w-80 border rounded">
				<div class="shadow p-4 mb-4 bg-light" id="newUser">
					<form action="metodosInsert.php" method="POST">
						<h3>Datos generales: <hr></h3>
						<div class="input-group mb-3">
						  <span class="input-group-text">Usuario:</span>
						  <input type="text" class="form-control" placeholder="Nombre" name="txtName">
						  <input type="text" class="form-control" placeholder="Apellidos" name="txtLastName">
						</div>
						<div class="input-group mb-3">
						    <span class="input-group-text">Em@il:</span>
						    <input type="text" class="form-control" placeholder="Email" name="txtEmail">
						</div>
						<div class="input-group mb-3">
						    <span class="input-group-text">Teléfono:</span>
						    <input type="text" class="form-control" placeholder="Telefono" name="txtPhone">
						</div>
						<h3>Datos laborales: <hr></h3>
						<div class="mb-3">
							<label for="userType" class="form-label">Tipo de usuario:</label>
						    <select class="form-select" id="userType" name="userType"> </select>
						</div>
						<div class="input-group mb-3">
						    <span class="input-group-text">Dependencia:</span>
						    <input type="text" class="form-control" placeholder="Ej. Recursos Humanos" name="txtDependence">
						</div>
						<div class="input-group mb-3">
						    <span class="input-group-text">Departamento:</span>
						    <input type="text" class="form-control" placeholder="Ej. Académico" name="txtDepartament">
						</div>
						<div class="input-group mb-3">
						    <span class="input-group-text">Carrera:</span>
						    <input type="text" class="form-control" placeholder="Ej. TSU en TI o puede ser NO APLICA (NA)" name="txtCarrer">
						</div>
						<div class="input-group mb-3">
						    <span class="input-group-text">Grupo:</span>
						    <input type="text" class="form-control" placeholder="Ej. 1TID1 o puede ser NO APLICA (NA)" name="txtGroup">
						</div>

						
						<hr>
						<div class="text-center">
							<button type="submit" class="btn btn-outline-dark" name="btnEnv" value="usr">Enviar</button>
						</div>


						
					</form>
				</div>

				<div class="shadow p-4 mb-4 bg-light" id="usersList">
					<div class="container mt-3">
					  	<h2>Listado de Usuarios <hr> </h2>
					    <div class="table table-responsive">
					    	<table class="table table-dark table-hover">
					    	  <thead>
					    	    <tr>
					    	      <th>#</th>
					    	      <th>Código</th>
					    	      <th>Nombre Completo</th>
					    	      <th>Email</th>
					    	      <th>Tipo Usuario</th>
					    	      <th>Acciones</th>
					    	    </tr>
					    	  </thead>
					    	  <tbody>
					    	  	<?php 
					    	  		foreach ($allUsers as $user){
					    	  			//print_r($user);
					    	  			//echo "<br>";?>

					    	  		<tr>
					    	  		  <td data-bs-toggle="collapse" data-bs-target="#generalData"><?php echo $user[0]; ?>
					    	  		  	<div id="generalData" class="collapse">
					    	  		  		<ul>
					    	  		  			<li>Nombre:</li>
					    	  		  			<li>Apellidos:</li>
					    	  		  			<li>Dirección:</li>
					    	  		  			<li>Teléfono:</li>
					    	  		  			<li>Email:</li>
					    	  		  		</ul>
					    	  		  	</div>
					    	  		  </td>
					    	  		  <td><?php echo $user[1]; ?></td>
					    	  		  <td><?php echo $user[7]; ?></td>
					    	  		  <td><?php echo $user[9]; ?></td>
					    	  		  <td><?php echo $user[12]; ?></td>
					    	  		  <td>
					    	  		  	<button type="button" class="btn btn-outline-warning" onclick="editRow(<?php echo $user[0]; ?>);">Editar</button>
					    	  		  	<form action="metodos.php" method="POST">
					    	  		  		<button type="submit" class="btn btn-outline-danger" id="btnDesactivar" name="btnDesactivar" value="<?php echo $user[0]; ?>">Desactivar</button>
					    	  		  	</form>
					    	  		  	
					    	  		  	<button type="button" class="btn btn-outline-primary" onclick="changeType(<?php echo $user[0]; ?>);">Cambiar Tipo Usuario</button>
					    	  		  </td>
					    	  		  
					    	  		</tr>
					    	  	
					    	  	<?php }   	?>
					    	    
					    	  </tbody>
					    	</table>
					    </div>         
					  
					</div>

				</div>

				
			</section>
		</div>
	</body>
	
	<script type="text/javascript">
		let newUser = document.getElementById('newUser');
		let usersList = document.getElementById('usersList');

		newUser.style.display = 'none';

		function nwUser(){
			if(newUser.style.display ='none'){
				usersList.style.display ='none';
				newUser.style.display ='block';
				fillUsersType();
			}
		}
		function uList(){
			if(usersList.style.display ='none'){
				usersList.style.display ='block';
				newUser.style.display ='none';
			}
		}
		function editRow(id){
			let url = 'metodos.php?eIdUser='+ id;
			let uName = document.getElementById('userName');
			axios.get(url)
	        .then(function (response) {
	            var data = response.data;
	            console.log(data);
	            uName.innerHTML = data.first_name + ' ' + data.last_name;
	            $("#editUser").modal("show");
	        })
	        .catch(function (error) {
	            console.error(error);
	        });

			
		}
		function changeType(id){
			let url = 'metodos.php?eIdUser='+ id;
			let uName = document.getElementById('userName1');
			let userId = document.getElementById('UserId');
			let usrOldType = document.getElementById('usrOldType');
			

			axios.get(url)
	        .then(function (response) {
	            var data = response.data;
	            console.log(data);
	            uName.innerHTML = data.first_name + ' ' + data.last_name;
	            userId.value = data.user_id;
	            usrOldType.value = data.userType;
	            $("#editType").modal("show");
	        })
	        .catch(function (error) {
	            console.error(error);
	        });

		}

		function fillUsersType(){
			let url = 'metodos.php?usersType=true';
			let userType = document.getElementById('userType');

			axios.get(url)
	        .then(function (response) {
	            var data = response.data;
	            let cad = '';
	            for(var type of data) {
	            	cad += '<option value ="'+type.userTypeId +'">'+type.userType+'</option>';
	            }
	            userType.innerHTML = cad;
	        })
	        .catch(function (error) {
	            console.error(error);
	        });
		}
	</script>

	<div class="modal" id="editUser">
	  <div class="modal-dialog">
	    <div class="modal-content">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Editar Usuario <label id="userName"> </label></h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">
	       Agregar campos a editar, de acuerdo a los datos recuperados de la consola
	      </div>

	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>

	    </div>
	  </div>
	</div>


	<div class="modal" id="editType">
	  <div class="modal-dialog">
	    <div class="modal-content">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Editar Tipo Usuario <label id="userName1"></label></h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>

	      <!-- Modal body -->
	      <form action="metodosUpdate.php" method="POST">
		      <div class="modal-body">
		       	<input type="hidden" name="UserId" id="UserId">
		       	<input type="text" id="usrOldType">
		       	<select name="userTypeNw">
		       		<option value="1">Tipo 1</option>
		       		<option value="2">Tipo 2</option>
		       		<option value="3">Tipo 3</option>
		       		<option value="4">Tipo 4</option>
		       	</select>
		      </div>

		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-success" data-bs-dismiss="modal" name ="btnEdit" value="usrType">Guardar</button >
	      </form>
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>


	      </div>

	    </div>
	  </div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	</html>	