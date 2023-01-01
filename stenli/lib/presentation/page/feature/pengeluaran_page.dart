import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';

class PengeluaranPage extends StatefulWidget {
  PengeluaranPage({super.key});

  @override
  State<PengeluaranPage> createState() => _PengeluaranPageState();
}

class _PengeluaranPageState extends State<PengeluaranPage> {
  final controllerPengeluaran = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        foregroundColor: AppColor.red,
        shape: Border(bottom: BorderSide(color: AppColor.sred, width: 5)),
        elevation: 4,
        title: Text("catat pengeluaran"),
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
                  "DOJA",
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
          Text("masukan jumlah pengeluaran"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('biaya tempat tinggal'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('biaya listrik dan air'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('biaya perawatan'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('makan'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('internet'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          Text('kebutuhan sekunder lainnya'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '10000',
            ),
          ),
          InkWell(
            child: TextButton(
              onPressed: () {},
              child: Text("tambahkan", style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: AppColor.sred),
            ),
          )
        ],
      )),
    );
  }
}
