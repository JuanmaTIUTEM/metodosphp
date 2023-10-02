<?php 

include "conection.php";


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	if(isset($_POST['btnEdit'])){
		if($_POST['btnEdit'] == 'usrType'){
			print_r($_POST);
		}
	}
} else {
    echo "Error de metodos...";
}


?>