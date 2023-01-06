import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/app_assets.dart';
import '../../config/app_fonts.dart';
import '../../config/session.dart';
import 'auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        "STENLI",
                        style: AppFonts.top,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Session.clearUser;
                    Get.off(() => const LoginPage());
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}
