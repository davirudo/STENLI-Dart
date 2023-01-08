<?php
include "../connection.php";

$sql = "SELECT * FROM pemasukan";
$result = $connect->query($sql);

if ($result->num_rows > 0) {  
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $pemasukan = floatval($row['pemasukan']);
    }

}
echo json_encode(array(   
    "pemasukan" => $pemasukan
));