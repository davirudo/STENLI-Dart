<?php
include '../connection.php';

$nama_barang = $_POST['nama_barang'];
$merk_barang = $_POST['merk_barang'];
$deskripsi = $_POST['deskripsi'];
$qty = $_POST['qty'];
$harga = $_POST['harga'];
$id = $_POST['id'];

$sql_check = "SELECT * FROM barang
             WHERE
             nama_barang = '$nama_barang'
             ";

$result_check = $connect->query($sql_check);

if ($result_check->num_rows > 0) {
    echo json_encode(array(
        "success"=>false,
        "message"=>"barang sudah ada",
    ));
}else{
    $sql =  "INSERT INTO barang
            SET
            nama_barang = '$nama_barang',
            merk_barang = '$merk_barang',
            deskripsi = '$deskripsi',
            qty = '$qty',
            harga = '$harga',
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