import 'package:stenli/config/app_fonts.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBox extends StatefulWidget {
  final String judul;
  final String des;
  final Color bgColor;
  final Widget pages;

  const CustomBox({
    required this.judul,
    required this.des,
    required this.bgColor,
    required this.pages,
  });

  @override
  State<CustomBox> createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  late bool _isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 168,
        height: 185,
        decoration: BoxDecoration(
            color: widget.bgColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                widget.judul,
                style: AppFonts.title,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Text(
                widget.des,
                style: AppFonts.desc,
              ),
            ),
            SizedBox(height: 65),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () {
                  Get.to(widget.pages);
                },
                child: Container(
                  width: 125,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LIHAT",
                        style: TextStyle(
                            color: widget.bgColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
