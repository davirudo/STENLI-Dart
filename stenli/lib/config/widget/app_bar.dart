import 'package:flutter/material.dart';
import '../app_assets.dart';
import '../app_color.dart';
import '../app_fonts.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  final String judul;
  final Color lineColor;
  const CustomBar({
    required this.judul,
    required this.lineColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      foregroundColor: AppColor.primary,
      shape: Border(bottom: BorderSide(color: lineColor, width: 5)),
      elevation: 4,
      title: Text(judul),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                AppAsset.logo,
                width: 28,
                height: 30,
              ),
              Text(
                "STENLI",
                style: AppFonts.top,
              )
            ],
          ),
        ),
      ],
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
