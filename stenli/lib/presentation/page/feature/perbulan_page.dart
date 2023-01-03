import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:stenli/config/app_color.dart';

import '../../../config/app_fonts.dart';
import '../../../config/app_format.dart';
import '../../../config/widget/app_bar.dart';

class PerbulanPage extends StatelessWidget {
  const PerbulanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "FAQ", lineColor: AppColor.sblue),
      body: SafeArea(
          child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartPie(
              data: [
                {'domain': 'Flutter', 'measure': 200},
                {'domain': 'React Native', 'measure': 50}
              ],
              fillColor: (pieData, index) => AppColor.blue,
              donutWidth: 30,
              labelColor: Colors.white,
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
                  Text("Pengeluaran Fixed Kamu", style: AppFonts.featureName),
                  Text(AppFormat.currency("2000000"),
                      style: AppFonts.featureNominal),
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
      )),
    );
  }
}
