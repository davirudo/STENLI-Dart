import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/session.dart';
import 'package:stenli/data/model/user.dart';
import 'package:stenli/presentation/page/auth/login_page.dart';
import 'package:stenli/presentation/page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID', null).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: AppColor.primary,
          colorScheme: const ColorScheme.light(
              primary: AppColor.primary, secondary: AppColor.secondary),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
          )),
      home: FutureBuilder(
        future: Session.getUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.data != null && snapshot.data!.idUser != null) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
