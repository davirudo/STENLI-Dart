<?php
include '../connection.php';

$id = $_POST['id'];
$username = $_POST['username'];
$password = md5($_POST['password']);
$nama = $_POST['nama'];
$peran = $_POST['peran'];

$sql_check = "SELECT * FROM user
             WHERE
             nama = '$nama'
             ";

$result_check = $connect->query($sql_check);

if ($result_check->num_rows > 0) {
    echo json_encode(array(
        "success"=>false,
        "message"=>"nama",
    ));
}else{
    $sql =  "UPDATE user
            SET
            username = '$username',
            password = '$password',
            nama = '$nama',
            peran = '$peran'
            WHERE
            id = '$id'
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
}