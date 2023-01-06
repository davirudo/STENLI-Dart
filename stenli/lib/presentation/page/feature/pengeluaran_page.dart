import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';

import '../../../config/widget/app_bar.dart';

class PengeluaranPage extends StatefulWidget {
  PengeluaranPage({super.key});

  @override
  State<PengeluaranPage> createState() => _PengeluaranPageState();
}

class _PengeluaranPageState extends State<PengeluaranPage> {
  final controllerTinggal = TextEditingController();
  final controllerAir = TextEditingController();
  final controllerInternet = TextEditingController();
  final controllerKeluarga = TextEditingController();
  final controllerMakan = TextEditingController();
  final controllerBensin = TextEditingController();
  final controllerPeliharaan = TextEditingController();
  final controllerDonasi = TextEditingController();
  final controllerBelanja = TextEditingController();
  final controllerHiburan = TextEditingController();
  final controllerOlahraga = TextEditingController();
  final controllerEdukasi = TextEditingController();
  final controllerLainya = TextEditingController();

  tambah() async {
    // // await SourcePemasukan.post(
    // //   controllerPemasukan.text,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "Pengeluaran", lineColor: AppColor.sblue),
      body: SafeArea(
          child: ListView(
        children: [
          Text("masukan jumlah pengeluaran"),
          Text("Biaya tempat tinggal"),
          TextField(
            controller: controllerTinggal,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Air'),
          TextField(
            controller: controllerAir,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Internet'),
          TextField(
            controller: controllerInternet,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Keluarga'),
          TextField(
            controller: controllerKeluarga,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Makan dan minum'),
          TextField(
            controller: controllerMakan,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('bensin'),
          TextField(
            controller: controllerBensin,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('peliharaan'),
          TextField(
            controller: controllerPeliharaan,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Donasi'),
          TextField(
            controller: controllerDonasi,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Belanja Bulanan'),
          TextField(
            controller: controllerBelanja,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Hiburan dan liburan'),
          TextField(
            controller: controllerHiburan,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Kesehatan'),
          TextField(
            controller: controllerOlahraga,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('Edukasi'),
          TextField(
            controller: controllerEdukasi,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('lainya'),
          TextField(
            controller: controllerLainya,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          InkWell(
            child: TextButton(
              onPressed: () {},
              child: Text("tambahkan", style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: AppColor.sred),
            ),
          )
        ],
      )),
    );
  }
}
