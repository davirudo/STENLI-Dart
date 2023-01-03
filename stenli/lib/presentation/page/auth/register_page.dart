import 'package:stenli/config/app_color.dart';
import 'package:stenli/presentation/controller/c_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stenli/presentation/page/auth/login_page.dart';

import '../../../config/widget/app_bar.dart';
import '../../../data/source/source_user.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final cUser = Get.put(Cuser());

  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  register() async {
    if (formKey.currentState!.validate()) {
      await SourceUser.register(
          controllerName.text, controllerEmail.text, controllerPassword.text);
      Get.offAll(() => const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(judul: "REGISTER", lineColor: AppColor.sblue),
      body: LayoutBuilder(
        builder: (Context, Constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: Constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: controllerName,
                          validator: (value) =>
                              value == '' ? 'Jangan kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(color: AppColor.sblue),
                          decoration: InputDecoration(
                            fillColor: AppColor.sblue.withOpacity(0.5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Nama Lengkap',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: controllerEmail,
                          validator: (value) =>
                              value == '' ? 'Jangan kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(color: AppColor.sblue),
                          decoration: InputDecoration(
                            fillColor: AppColor.sblue.withOpacity(0.5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Email Address',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: controllerPassword,
                          validator: (value) =>
                              value == '' ? 'Jangan kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          style: const TextStyle(color: AppColor.sblue),
                          decoration: InputDecoration(
                            fillColor: AppColor.sblue.withOpacity(0.5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Password',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Material(
                            //button//
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(40),
                              onTap: () => register(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 16),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
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
        },
      ),
    );
  }
}
