import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_fonts.dart';
import 'package:stenli/presentation/page/dashboard_page.dart';
import '../../../config/session.dart';

class TentangPage extends StatefulWidget {
  TentangPage({Key? key}) : super(key: key);

  @override
  State<TentangPage> createState() => _TentangPageState();
}

class _TentangPageState extends State<TentangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masih dalam masa pengembangan.",
              style: AppFonts.top,
            ),
            Text(
              "ditunggu untuk updatenya ya~",
              style: AppFonts.top.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  Session.clearUser;
                  Get.off(() => DashboardPage());
                },
                child: Text("klik disini untuk kembali")),
          ],
        ),
      ),
    );
  }
}
