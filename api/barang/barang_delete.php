<?php
include '../connection.php';

$id_barang = $_POST['id_barang'];

$sql = "DELETE FROM barang
        WHERE
        id_barang = '$id_barang'";

$result = $connect->query($sql);

if ($result) {
    echo json_encode(array(
        "success" => true  
    ));
    } else {
    echo json_encode(array(
        "success" => false
    ));
}