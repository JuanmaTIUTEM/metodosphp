<?php 

	include "conection.php";	
	
	if(isset($_GET['eIdUser'])){
		$id =$_GET['eIdUser'];
		$user = getUser($mysqli,$id);
		print_r(json_encode($user));
	}else if(isset($_GET['usersType'])){
		$opt = $_GET['usersType'];
		if($opt){
			$userTypes = getUsersType($mysqli);
			print_r(json_encode($userTypes));
		}
		
	}else{
		echo "error";
	}


	function getUser($con,$id){
		$query = "SELECT * FROM vwallusersdata WHERE user_id = $id";
		if($result = $con->query($query)){
				$row = $result->fetch_assoc();
				return $row;
		}else{
			return false;
		}

	}

	function getUsersType($con){
		$query = "SELECT userTypeId,userType FROM catusertypes";
		$result = $con->query($query);
		if($result){
			$data= array();
			$i = 0;
			while ($row = $result->fetch_assoc()) {
			    $data[$i] = $row;
			    $i++;
			}
			return $data;
		}else{
			return false;
		}
	}

?>