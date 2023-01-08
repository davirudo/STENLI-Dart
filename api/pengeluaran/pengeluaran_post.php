<?php
include '../connection.php';

$tinggal = $_POST['tinggal'];
$air = $_POST['air'];
$internet  = $_POST['internet'];
$keluarga  = $_POST['keluarga'];
$makan  = $_POST['makan'];
$bensin  = $_POST['bensin'];
$peliharaan  = $_POST['peliharaan'];
$donasi  = $_POST['donasi'];
$belanja  = $_POST['belanja'];
$hiburan  = $_POST['hiburan'];
$olahraga  = $_POST['olahraga'];
$edukasi  = $_POST['edukasi'];
$lainnya  = $_POST['lainnya'];

    $sql =  "UPDATE pengeluaran
            SET
            tinggal = '$tinggal',
            air= '$air',
            internet= '$internet',
            keluarga= '$keluarga',
            makan= '$makan',
            bensin= '$bensin',
            peliharaan= '$peliharaan',
            donasi= '$donasi',
            belanja= '$belanja',
            hiburan= '$hiburan',
            olahraga= '$olahraga',
            edukasi= '$edukasi',
            lainnya= '$lainnya',
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