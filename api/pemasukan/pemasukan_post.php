<?php
include '../connection.php';

$pemasukan = $_POST['pemasukan'];

    $sql =  "UPDATE pemasukan
            SET
            pemasukan = '$pemasukan'
            WHERE
            id = 1
            ";

    $result = $connect->query($sql);

    if ($result) {
        echo json_encode(array(
            "success"=>true,
        ));
    }else{
        echo json_encode(array(
            "success"=>false,
            "message"=>"Gagal",
        ));
    }