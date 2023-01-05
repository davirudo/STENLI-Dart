import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';

import '../../config/session.dart';
import 'auth/login_page.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("BRI - 3412 2321 3213"), value: "bri"),
      DropdownMenuItem(child: Text("Gopay - 0821 3434 5517"), value: "gopay"),
      DropdownMenuItem(child: Text("Shopee - 0821 3434 5517"), value: "shopee"),
    ];
    return menuItems;
  }

  String selectedValue = "bri";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DView.nothing(),
              Form(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                DView.spaceHeight(),
                                Image.asset(
                                  AppAsset.logo,
                                  width: 38,
                                ),
                                Text(
                                  "STENLI",
                                  style: AppFonts.top,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        AppAsset.donasi,
                      ),
                      DView.spaceHeight(20),
                      Text(
                        "SUPPORT US",
                        style: AppFonts.card1.copyWith(
                            color: AppColor.primary, letterSpacing: 5),
                      ),
                      DView.spaceHeight(40),
                      Text(
                          "Bantuan anda akan sangat berarti bagi kami sebagai seorang mahasiswa!",
                          style: AppFonts.card2
                              .copyWith(color: AppColor.primary)),
                      DView.spaceHeight(20),
                      Text(
                          "Anda bisa membantu kami untuk terus berinovasi dan "
                          "mengoptimalkan aplikasi kami dengan cara berdonasi.",
                          style:
                              AppFonts.card3.copyWith(color: Colors.black54)),
                    ],
                  ),
                ),
              ),
              DView.spaceHeight(30),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Berikut metode donasi yang kami sediakan',
                        textAlign: TextAlign.center,
                        style: AppFonts.card3
                            .copyWith(color: Colors.black54, fontSize: 15)),
                    DView.spaceHeight(10),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: selectedValue,
                      onChanged: (String? newvalue) {
                        setState(() {
                          selectedValue = newvalue!;
                        });
                      },
                      items: dropdownItems,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
