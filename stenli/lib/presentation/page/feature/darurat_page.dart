import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';

import '../../../config/app_format.dart';
import '../../../config/widget/app_bar.dart';
import '../../controller/c_pengeluaran.dart';

class DaruratPage extends StatefulWidget {
  const DaruratPage({super.key});

  @override
  State<DaruratPage> createState() => _DaruratPageState();
}

class _DaruratPageState extends State<DaruratPage> {
  final cPengeluaran = Get.put(CPengeluaran());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "Dana Darurat", lineColor: AppColor.sred),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 209,
            decoration: BoxDecoration(color: AppColor.sred),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dana Darurat Yang Kamu Perlukan",
                  style: AppFonts.card2,
                ),
                Obx((() {
                  return Text(
                      AppFormat.currency(cPengeluaran.totaldarurat.toString()),
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
                    "Fixed Dana Darurat",
                    style: AppFonts.featureName,
                  ),
                  Obx((() {
                    return Text(
                        AppFormat.currency(
                            cPengeluaran.fixeddarurat.toString()),
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
                  Text(
                    "Variable Dana Darurat",
                    style: AppFonts.featureName,
                  ),
                  Obx((() {
                    return Text(
                        AppFormat.currency(
                            cPengeluaran.variabledarurat.toString()),
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
