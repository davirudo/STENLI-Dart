<?php
include "../connection.php";

$sql = "SELECT * FROM pengeluaran";
$result = $connect->query($sql);

if ($result->num_rows > 0) {  
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $tinggal = floatval($row['tinggal']);
        $air = floatval($row['air']);
        $internet = floatval($row['internet']);
        $keluarga = floatval($row['keluarga']);
        $makan = floatval($row['makan']);
        $bensin = floatval($row['bensin']);
        $peliharaan = floatval($row['peliharaan']);
        $donasi = floatval($row['donasi']);
        $belanja = floatval($row['belanja']);
        $hiburan = floatval($row['hiburan']);
        $olahraga = floatval($row['olahraga']);
        $edukasi = floatval($row['edukasi']);
        $lainnya = floatval($row['lainnya']);
    }

}
echo json_encode(array(   
    "tinggal" => $tinggal,
    "air" => $air,
    "internet" => $internet,
    "keluarga" => $keluarga,
    "makan" => $makan,
    "bensin" => $bensin,
    "peliharaan" => $peliharaan,
    "donasi" => $donasi,
    "belanja" => $belanja,
    "hiburan" => $hiburan,
    "olahraga" => $olahraga,
    "edukasi" => $edukasi,
    "lainnya" => $lainnya


));