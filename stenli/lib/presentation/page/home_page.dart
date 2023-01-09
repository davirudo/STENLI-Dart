import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';
import 'package:stenli/config/app_theme.dart';
import 'package:stenli/presentation/controller/c_pemasukan.dart';
import 'package:stenli/presentation/controller/c_pengeluaran.dart';
import 'package:stenli/presentation/controller/c_user.dart';
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
  var cPemasukan = Get.put(CPemasukan());
  var cPengeluaran = Get.put(CPengeluaran());
  @override
  void initState() {
    cPemasukan.getAnalysis();
    cPengeluaran.getAnalysis();
    cPengeluaran.Batas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          cPemasukan.getAnalysis();
          cPengeluaran.getAnalysis();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20.0, top: 5),
              child: Row(
                children: [
                  Row(
                    children: [
                      DView.spaceHeight(),
                      Image.asset(
                        AppAsset.logo,
                        width: 38,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "STENLI",
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
///////////////////////////////////////////////////////////////////////////////////////////
            DView.spaceHeight(),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(
                            cUser.data.name ?? '',
                            style: peepee,
                          );
                        }),
                        Obx(() {
                          return Text(
                            cUser.data.email ?? '',
                            style: poopoo,
                          );
                        }),
                      ],
                    ),
                  ),
                ]),
              ),
              decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(10)),
            ),
///////////////////////////////////////////////////////////////////////////////////////////
            DView.spaceHeight(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              Text('pemasukan', style: peepeegrey),
                              Obx((() {
                                return Text(
                                    AppFormat.currency(
                                        cPemasukan.today.toString()),
                                    style: peepeeblack);
                              })),
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
                                style: peepeegrey,
                              ),
                              Obx((() {
                                return Text(
                                    AppFormat.currency(
                                        cPengeluaran.total.toString()),
                                    style: peepeeblack);
                              })),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
///////////////////////////////////////////////////////////////////////////////////////////
            DView.spaceHeight(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Recommendation For You", style: peepeeblack),
                    ],
                  ),
                  DView.spaceHeight(),
                  Row(
                    children: [
                      InkWell(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FaqPage()));
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
                                    style: details,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text('FAQ', style: peepeeblack)
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
                                      shape: BoxShape.circle,
                                      color: AppColor.sred),
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
                                  style: details,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text('Dana Darurat', style: peepeeblack)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BatasPage()));
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
                                  style: details,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text('Batas Pengeluaran', style: peepeeblack)
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
                                      color: AppColor.syellow),
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
                                  style: details,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text('Lama Menabung', style: peepeeblack)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
