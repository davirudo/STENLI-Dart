import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';
import 'package:stenli/config/session.dart';
import 'package:stenli/presentation/controller/c_pemasukan.dart';
import 'package:stenli/presentation/controller/c_user.dart';
import 'package:stenli/presentation/page/auth/login_page.dart';
import 'package:stenli/presentation/page/feature/batas_page.dart';
import 'package:stenli/presentation/page/feature/darurat_page.dart';
import 'package:stenli/presentation/page/feature/pemasukan_page.dart';
import 'package:stenli/presentation/page/feature/pengeluaran_page.dart';
import 'package:stenli/presentation/page/feature/faq_page.dart';

import '../../config/app_format.dart';
import 'feature/menabung_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(Cuser());
  final cPemasukan = Get.put(CPemasukan());
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20.0, bottom: 10, top: 5),
              child: Row(
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
                          'STENLI',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColor.sblue),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Session.clearUser;
                        Get.off(() => const LoginPage());
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
            ),
            Container(
              width: 358,
              height: 102,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(children: [
                  Image.asset(
                    AppAsset.profile,
                    width: 49,
                  ),
                  SizedBox(width: 9),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return Text(
                              cUser.data.name ?? '',
                              style: AppFonts.desc,
                            );
                          }),
                          Obx(() {
                            return Text(
                              cUser.data.email ?? '',
                              style: AppFonts.poopoo,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10)),
            ),
            DView.spaceHeight(),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Row(
                children: [
                  InkWell(
                    onTap: ((() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PemasukanPage()));
                    })),
                    child: Material(
                      elevation: 5,
                      child: Container(
                        width: 175,
                        height: 104,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('pemasukan', style: AppFonts.peepee),
                            Text(AppFormat.currency("3000000"),
                                style: AppFonts.featureName),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PengeluaranPage()));
                    }),
                    child: Material(
                      elevation: 5,
                      child: Container(
                        width: 175,
                        height: 104,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'pengeluaran',
                              style: AppFonts.peepee,
                            ),
                            Text(
                              AppFormat.currency("2500000"),
                              style: AppFonts.featureName,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text("Recommendation For You", style: AppFonts.featureName),
                ],
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PemasukanPage()));
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FaqPage()));
                      },
                      child: Container(
                        width: 165,
                        height: 165,
                        decoration: BoxDecoration(
                            color: AppColor.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.sgreen),
                                child: Image.asset(
                                  AppAsset.pengeluaran,
                                  height: 38,
                                  width: 38,
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                'improve your financial knowledge',
                                style: AppFonts.details,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text('FAQ', style: AppFonts.featureName)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DaruratPage()));
                    },
                    child: Container(
                      width: 165,
                      height: 165,
                      decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: AppColor.sred),
                              child: Image.asset(
                                AppAsset.darurat,
                                height: 38,
                                width: 38,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'lets start calculating your monthly expenses',
                              style: AppFonts.details,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text('Dana Darurat', style: AppFonts.featureName)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BatasPage()));
                    },
                    child: Container(
                      width: 165,
                      height: 165,
                      decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.sblue),
                              child: Image.asset(
                                AppAsset.batas,
                                height: 38,
                                width: 38,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'lets set a limit for your spending',
                              style: AppFonts.details,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text('Batas Pengeluaran',
                                style: AppFonts.featureName)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenabungPage()));
                    },
                    child: Container(
                      width: 165,
                      height: 165,
                      decoration: BoxDecoration(
                          color: AppColor.yellow,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.orange),
                              child: Image.asset(
                                AppAsset.menabung,
                                height: 38,
                                width: 38,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'lets start setting your saving plan and target',
                              style: AppFonts.details,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text('Lama Menabung', style: AppFonts.featureName)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
