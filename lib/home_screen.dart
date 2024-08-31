import 'package:app_ui/model/doctor_model.dart';
import 'package:app_ui/screen/favorite_screen_widget.dart';
import 'package:app_ui/screen/home_screen_widget.dart';
import 'package:app_ui/screen/profile_screen_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int onSelectBottonIndex = 0;

  void onTapBottonbar(int index) {
    setState(() {
      onSelectBottonIndex = index;
    });
  }

  List<Widget> pageView = [
    FavorteScreenWidget(),
    const HomeScreenWidget(),
    const ProfileScreenWidget()
  ];

  List<String> tabList = ['Adults', 'Childrens', 'omens', 'Mens'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pageView[onSelectBottonIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        currentIndex: onSelectBottonIndex,
        onTap: onTapBottonbar,
      ),
    );
  }
}
