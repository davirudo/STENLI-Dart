import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/presentation/page/dashboard_page.dart';
import '../../../config/app_fonts.dart';
import '../../../config/session.dart';

class AkunPage extends StatefulWidget {
  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 20.0, bottom: 10, top: 5),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Session.clearUser;
                          Get.off(() => DashboardPage());
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: AppColor.primary,
                        ),
                      ),
                      Text(
                        "Akun Saya",
                        style: AppFonts.top,
                      ),
                      Icon(Icons.more_vert, color: Colors.transparent),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Column(
          //   children: [
          //     Text(
          //       "Data Akun",
          //       style: AppFonts.top,
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         color: AppColor.secondary,
          //       ),
          //       child: Column(
          //         children: [
          //           Text(
          //             "Nama Lengkap",
          //             style: AppFonts.title.copyWith(
          //               color: AppColor.primary,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
