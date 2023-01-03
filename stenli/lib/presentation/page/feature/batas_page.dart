import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';

import '../../../config/app_format.dart';
import '../../../config/widget/app_bar.dart';

class BatasPage extends StatelessWidget {
  const BatasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "REGISTER", lineColor: AppColor.sblue),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 209,
            decoration: BoxDecoration(color: AppColor.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Batas Pengeluaran Kamu",
                  style: AppFonts.card2,
                ),
                Text(
                  AppFormat.currency("2000000"),
                  style: AppFonts.card1,
                )
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
                    "PBB",
                    style: AppFonts.featureName,
                  ),
                  Text(
                    AppFormat.currency("500000"),
                    style: AppFonts.featureNominal,
                  ),
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
                  Text("Batas Pengeluaran Perminggu",
                      style: AppFonts.featureName),
                  Text(AppFormat.currency("375000"),
                      style: AppFonts.featureNominal),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
