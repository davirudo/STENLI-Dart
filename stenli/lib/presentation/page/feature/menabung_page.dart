import 'package:d_chart/d_chart.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/presentation/controller/c_pemasukan.dart';
import 'package:stenli/presentation/controller/c_pengeluaran.dart';

import '../../../config/app_fonts.dart';
import '../../../config/app_format.dart';
import '../../../config/widget/app_bar.dart';
import '../../controller/c_menabung.dart';

class MenabungPage extends StatefulWidget {
  const MenabungPage({super.key});

  @override
  State<MenabungPage> createState() => _MenabungPageState();
}

class _MenabungPageState extends State<MenabungPage> {
  final controllerTarget = TextEditingController();
  final cPemasukan = Get.put(CPemasukan());
  final cPengeluaran = Get.put(CPengeluaran());
  void initState() {
    cPemasukan.getAnalysis();
    cPengeluaran.getAnalysis();
    super.initState();
  }

  hitung() async {
    await cPengeluaran.HitungMenabung(
        double.parse(controllerTarget.text), cPemasukan.today);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "Lama Menabung", lineColor: AppColor.yellow),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
        children: [
          Text(
            "Tetapkan target menabung",
            style: AppFonts.featureName,
          ),
          Text(
            "masukan jumlah yang ingin ditargetkan",
            style: AppFonts.featureScreen,
          ),
          TextField(
            controller: controllerTarget,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          InkWell(
            onTap: (() => hitung()),
            child: Card(
            Card(
              color: Colors.grey[300],
              child: SizedBox(
                width: 363,
                height: 75,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("simpan", style: AppFonts.featureNominal),
                    Text("Pengeluaran Fixed Kamu", style: AppFonts.featureName),
                    Text(AppFormat.currency("2000000"),
                        style: AppFonts.featureNominal),
                  ],
                )),
              ),
            ),
          ),
          Card(
            color: Colors.grey[300],
            child: SizedBox(
              width: 363,
              height: 75,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("kamu harus menyisihkan"),
                  Obx((() {
                    return Text(
                        AppFormat.currency(cPengeluaran.sisihan.toString()),
                        style: AppFonts.featureName);
                  })),
                ],
              )),
            ),
          ),
          Card(
            color: Colors.grey[300],
            child: SizedBox(
              width: 363,
              height: 75,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("selama"),
                  Obx((() {
                    return Text(cPengeluaran.menabung.toString() + " bulan",
                        style: AppFonts.featureName);
                  })),
                ],
              )),
            ),
          ),
            Card(
              color: Colors.grey[300],
              child: SizedBox(
                width: 363,
                height: 75,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pengeluaran Variable Kamu",
                        style: AppFonts.featureName),
                    Text(AppFormat.currency("500000"),
                        style: AppFonts.featureNominal),
                  ],
                )),
              ),
            ),
        ],
      ),
          )),
    );
  }
}
