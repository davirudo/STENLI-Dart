import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/data/source/source_pengeluaran.dart';
import 'package:stenli/presentation/controller/c_pengeluaran.dart';

import '../../../config/app_theme.dart';
import '../../../config/widget/app_bar.dart';

class PengeluaranPage extends StatefulWidget {
  PengeluaranPage({isLoading});

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
  var cPengeluaran = Get.put(CPengeluaran());

  RxBool? isLoading = true.obs;
  tambah() async {
    await SourcePengeluaran.post(
        controllerTinggal.text,
        controllerAir.text,
        controllerInternet.text,
        controllerKeluarga.text,
        controllerMakan.text,
        controllerBensin.text,
        controllerPeliharaan.text,
        controllerDonasi.text,
        controllerBelanja.text,
        controllerHiburan.text,
        controllerOlahraga.text,
        controllerEdukasi.text,
        controllerLainya.text,
        );
        isLoading!.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: CustomBar(
        judul: "Pengeluaran", lineColor: AppColor.sblue),
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
          Obx(() => isLoading!.value
              ? Center(
                  child: Material(
                    //button//
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        isLoading!.value = false;
                        tambah();
                        cPengeluaran.getAnalysis();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 16),
                        child: Text(
                          'SIMPAN',
                          style: whiteTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()))
        ],
      )),
    );
  }
}
