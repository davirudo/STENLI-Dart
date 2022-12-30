<?php
include "../connection.php";

$id_user = $_POST['username'];
$type = $_POST['nama'];
$type = $_POST['peran'];

$sql = "SELECT * FROM user
        ORDER BY nama ASC
        ";
$result = $connect->query($sql);

if ($result->num_rows > 0) {  
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    echo json_encode(array(   
        "success" => true,
        "data" => $data
    ));
}else{
    echo json_encode(array(   
        "success" => false        
    ));
}