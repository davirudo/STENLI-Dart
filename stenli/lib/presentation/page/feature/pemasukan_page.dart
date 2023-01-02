import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/data/source/source_pemasukan.dart';

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
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        foregroundColor: AppColor.green,
        shape: Border(bottom: BorderSide(color: AppColor.sgreen, width: 5)),
        elevation: 4,
        title: Text("catat pemasukan"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  AppAsset.logo,
                  width: 28,
                  height: 30,
                ),
                Text(
                  "STENLI",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
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
