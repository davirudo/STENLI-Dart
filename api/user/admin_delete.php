<?php
include '../connection.php';

$id = $_POST['id'];

$sql = "DELETE FROM user
        WHERE
        id = '$id'";

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