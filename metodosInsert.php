<?php 

	include "conection.php";

	//udtType

	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		if(isset($_POST['btnEnv'])){
			if($_POST['btnEnv'] == 'usr'){
				$result = envUserData($mysqli);
			}
		}
	} else {
	    echo "Error de metodos...";
	}

	function envUserData($con){
		$date = date("ym");
		$personName = $_POST['txtName'];
		$personLName = $_POST['txtLastName'];
		$personEmail = $_POST['txtEmail'];
		$personPhone = $_POST['txtPhone'];
		$userTypeId = $_POST['userType'];
		$cveUser = strtoupper(substr($personLName, 0, 2)) . strtoupper(substr($personName, 0, 2)) . $date;
		$departament = $_POST['txtDepartament'];
		$groupStdnt = $_POST['txtGroup'];
		$career = $_POST['txtCarrer'];
		$dependence = $_POST['txtDependence'];
		$query = "CALL insertUser('$personName', '$personLName', '$personEmail', '$personPhone', $userTypeId,'$cveUser', '$departament', '$groupStdnt', '$career', '$dependence')";
		$result = $con->query($query);
		if($result){
			$msg = "USUARIO AGREGADO CON ÉXITO";
			$t = 0;
			
		}else{
			$msg = "USUARIO NO AGREGADO!!";
			$t = 1;
		}
		header("Location: index.php?msg=$msg&err=$t");
		exit;


	}

?>