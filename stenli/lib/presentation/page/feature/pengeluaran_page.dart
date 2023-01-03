import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';

import '../../../config/widget/app_bar.dart';

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
      appBar: CustomBar(judul: "Pengeluaran", lineColor: AppColor.sblue),
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
