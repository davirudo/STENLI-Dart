<?php
include "../connection.php";

$sql = "SELECT * FROM pemasukan";
$result = $connect->query($sql);

if ($result->num_rows > 0) {  
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

}
echo json_encode(array(   
    "pemasukan" => $data[]
));