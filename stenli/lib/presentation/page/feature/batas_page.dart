import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';

import '../../../config/app_format.dart';
import '../../../config/widget/app_bar.dart';
import '../../controller/c_pengeluaran.dart';

class BatasPage extends StatefulWidget {
  const BatasPage({super.key});

  @override
  State<BatasPage> createState() => _BatasPageState();
}

class _BatasPageState extends State<BatasPage> {
  @override
  Widget build(BuildContext context) {
    final cPengeluaran = Get.put(CPengeluaran());
    void initState() {
    cPengeluaran.Batas();
    super.initState();
  }
    return Scaffold(
      appBar: CustomBar(judul: "Batas Pengeluaran", lineColor: AppColor.sblue),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 209,
            decoration: BoxDecoration(color: AppColor.sblue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Batas Pengeluaran Kamu",
                  style: AppFonts.card2,
                ),
                Obx((() {
                  return Text(AppFormat.currency(cPengeluaran.ppb.toString()),
                      style: AppFonts.card1);
                })),
              ],
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
                  Text(
                    "pengeluaran per minggu",
                    style: AppFonts.featureName,
                  ),
                  Obx((() {
                    return Text(AppFormat.currency(cPengeluaran.ppm.toString()),
                        style: AppFonts.featureNominal);
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
                  Text("dana darurat pengeluaran perbulan",
                      style: AppFonts.featureName),
                  Obx((() {
                    return Text(
                        AppFormat.currency(cPengeluaran.ddpb.toString()),
                        style: AppFonts.featureNominal);
                  })),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
