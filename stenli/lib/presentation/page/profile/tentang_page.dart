import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stenli/config/app_fonts.dart';

import '../../../config/session.dart';
import '../profile_page.dart';

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
                  Get.off(() => ProfilePage());
                },
                child: Text("klik disini untuk kembali")),
          ],
        ),
      ),
    );
  }
}
