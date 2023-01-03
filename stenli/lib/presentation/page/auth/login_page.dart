import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/config/app_assets.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/data/source/source_user.dart';
import 'package:stenli/presentation/page/auth/register_page.dart';
import 'package:stenli/presentation/page/dashboard_page.dart';
import 'package:stenli/config/app_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  login() async {
    if (formKey.currentState!.validate()) {
      bool success = await SourceUser.login(
        controllerEmail.text,
        controllerPassword.text,
      );
      if (success) {
        DInfo.dialogSuccess('berhasil Login');
        DInfo.closeDialog(actionAfterClose: () {
          Get.off(() => const DashboardPage());
        });
      } else {
        DInfo.dialogSuccess('gagal Login');
        DInfo.closeDialog();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DView.nothing(),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAsset.logo,
                        ),
                        DView.spaceHeight(10),
                        Text(
                          "STENLI",
                          style: AppFonts.card1.copyWith(
                              color: AppColor.primary, letterSpacing: 10),
                        ),
                        DView.spaceHeight(40),
                        TextFormField(
                          controller: controllerEmail,
                          validator: (value) =>
                              value == '' ? 'jangan kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              fillColor: AppColor.chart.withOpacity(0.5),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'email',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16)),
                        ),
                        DView.spaceHeight(),
                        TextFormField(
                          validator: (value) =>
                              value == '' ? 'jangan kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controllerPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: AppColor.chart.withOpacity(0.5),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'password',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16)),
                        ),
                        DView.spaceHeight(30),
                        Material(
                          //button//
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(17),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => login(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 75, vertical: 12),
                              child: Text('LOGIN',
                                  style: AppFonts.desc.copyWith(
                                      color: Colors.white, fontSize: 16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('belum punya akun? '),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterPage());
                        },
                        child: const Text(
                          'klik disini',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
