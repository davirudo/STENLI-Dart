import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAB extends StatefulWidget {
  final Color warna;
  final Widget pages;
  const FAB({required this.warna, required this.pages});

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => widget.pages));
        },
        backgroundColor: widget.warna,
        child: const Icon(Icons.add),
      ),
    );
  }
}
