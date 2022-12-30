<?php
include "../connection.php";

$id = $_POST['id'];

$sql = "SELECT * FROM user
        WHERE
        id='$id'";
$result = $connect->query($sql);

if ($result->num_rows > 0) {  
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    echo json_encode(array(   
        "success" => true,
        "data" => $data[0]
    ));
}else{
    echo json_encode(array(   
        "success" => false        
    ));
}