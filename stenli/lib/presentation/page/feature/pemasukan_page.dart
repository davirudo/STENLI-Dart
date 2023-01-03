import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/data/source/source_pemasukan.dart';

import '../../../config/widget/app_bar.dart';

class PemasukanPage extends StatefulWidget {
  PemasukanPage({super.key});

  @override
  State<PemasukanPage> createState() => _PemasukanPageState();
}

class _PemasukanPageState extends State<PemasukanPage> {
  final controllerPemasukan = TextEditingController();

  tambah() async {
    await SourcePemasukan.post(
      controllerPemasukan.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "Pemasukan", lineColor: AppColor.sblue),
      body: SafeArea(
          child: Column(
        children: [
          Text("masukan jumlah pemasukan"),
          TextField(
            controller: controllerPemasukan,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          InkWell(
            child: TextButton(
              onPressed: (() => tambah()),
              child: Text("tambahkan", style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: AppColor.sgreen),
            ),
          )
        ],
      )),
    );
  }
}
