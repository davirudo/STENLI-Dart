import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';

import '../../../config/app_format.dart';

class DaruratPage extends StatelessWidget {
  const DaruratPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  AppFormat.currency("18000000"),
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
                    "Fixed Dana Darurat",
                    style: AppFonts.featureName,
                  ),
                  Text(
                    AppFormat.currency("12000000"),
                    style: AppFonts.featureNominal,
                  )
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
                  Text(AppFormat.currency("6000000"),
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
