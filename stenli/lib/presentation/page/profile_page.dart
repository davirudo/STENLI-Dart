import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_theme.dart';
import 'package:stenli/presentation/page/profile/akun_page.dart';
import '../../config/app_assets.dart';
import '../../config/app_color.dart';
import '../../config/app_fonts.dart';
import '../../config/session.dart';
import '../controller/c_user.dart';
import 'auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final cUser = Get.put(Cuser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      body: Column(
        children: [
          Container(
            height: 191,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 11, right: 20.0, bottom: 10, top: 16),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAsset.logo,
                            width: 24,
                          ),
                          SizedBox(width: 13),
                          Text(
                            "Profile",
                            style: AppFonts.title,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(children: [
                  SizedBox(width: 30),
                  Image.asset(
                    AppAsset.profile,
                    width: 60,
                  ),
                  SizedBox(width: 25),
                  Column(
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
                ]),
              ],
            ),
            decoration: BoxDecoration(
              color: AppColor.secondary,
            ),
          ),
          //
          SizedBox(height: 8),
          //
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          AppAsset.profile,
                          width: 30,
                        ),
                        SizedBox(width: 25),
                        Text(
                          "Akun Saya",
                          style:
                              AppFonts.peepee.copyWith(color: AppColor.primary),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Session.clearUser;
                      Get.off(() => AkunPage());
                    },
                    icon:
                        Icon(Icons.arrow_right_sharp, color: AppColor.primary),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
            ),
          ),
          //
          SizedBox(height: 8),
          //
          Expanded(
            child: Container(
              child: Container(
                margin: EdgeInsets.only(top:16.0, left: 16.0, right: 16.0, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 25, color: AppColor.primary,
                                ),
                                SizedBox(width: 25),
                                Text(
                                  "Tentang Stenli",
                                  style: AppFonts.peepee
                                      .copyWith(color: AppColor.primary),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                Session.clearUser;
                                Get.off(() => const LoginPage());
                              },
                              icon: Icon(Icons.arrow_right_sharp,
                                  size: 25, color: AppColor.primary),
                            ),
                          ],
                        ),
                        DView.spaceHeight(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.note_alt,
                                  size: 25, color: AppColor.primary,
                                ),
                                SizedBox(width: 25),
                                Text(
                                  "Kritik dan Saran",
                                  style: AppFonts.peepee
                                      .copyWith(color: AppColor.primary),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                Session.clearUser;
                                Get.off(() => const LoginPage());
                              },
                              icon: Icon(Icons.arrow_right_sharp,
                                  size: 25, color: AppColor.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Keluar",
                            style: AppFonts.peepee
                                .copyWith(color: kRedColor),),
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
