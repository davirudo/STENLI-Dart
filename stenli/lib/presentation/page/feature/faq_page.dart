import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_theme.dart';

import '../../../config/app_fonts.dart';
import '../../../config/app_format.dart';
import '../../../config/widget/app_bar.dart';
import '../../controller/c_pengeluaran.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final cPengeluaran = Get.put(CPengeluaran());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "FAQ", lineColor: AppColor.green),
      body: SafeArea(
          child: Column(
        children: [
          Text(
            "Frequently Asked Questions",
            style: blackTextStyle,
          ),
          Text(
            "Masih dalam masa pengembangan",
            style: blackTextStyle,
          ),
        ],
      )),
    );
  }
}
