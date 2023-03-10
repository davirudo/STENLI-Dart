import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';
import 'package:stenli/config/app_theme.dart';
import 'package:stenli/data/source/source_pemasukan.dart';

import '../../../config/widget/app_bar.dart';
import '../../controller/c_pemasukan.dart';

class PemasukanPage extends StatefulWidget {
  PemasukanPage({isLoading});

  @override
  State<PemasukanPage> createState() => _PemasukanPageState();
}

class _PemasukanPageState extends State<PemasukanPage> {
  final controllerPemasukan = TextEditingController();
  var cPemasukan = Get.put(CPemasukan());

  RxBool? isLoading = true.obs;
  tambah() async {
    await SourcePemasukan.post(
      controllerPemasukan.text,
    );
    isLoading!.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(
        
        judul: "Pemasukan",
        lineColor: AppColor.sblue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "MASUKAN JUMLAH PEMASUKAN.",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pemasukan yang dimaksud disini adalah total dari pemasukan anda, entah itu berupa hasil dari bisnis, pekerjaan, sampai pemberian orang tua.",
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controllerPemasukan,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'masukan total pemasukan',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(()=> isLoading!.value
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
                        cPemasukan.getAnalysis();
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
      ),
    );
  }
}
