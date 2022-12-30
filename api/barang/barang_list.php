<?php
include "../connection.php";

$sql = "SELECT * FROM barang
        ORDER BY nama_barang ASC
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