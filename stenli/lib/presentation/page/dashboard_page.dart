import 'package:flutter/material.dart';
import 'package:stenli/config/app_color.dart';
import 'package:stenli/config/app_fonts.dart';
import 'package:stenli/presentation/page/home_page.dart';

void main() => runApp(const DashboardPage());

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'in development',
      style: AppFonts.optionStyle,
    ),
    Text(
      'in development',
      style: AppFonts.optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
