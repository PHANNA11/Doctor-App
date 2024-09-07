import 'package:app_ui/model/doctor_model.dart';
import 'package:app_ui/screen/favorite_screen_widget.dart';
import 'package:app_ui/screen/home_screen_widget.dart';
import 'package:app_ui/screen/maps_screen.dart';
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
    ProfileScreenWidget(),
    const MapSample()
  ];

  List<String> tabList = ['Adults', 'Childrens', 'omens', 'Mens'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pageView[onSelectBottonIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps')
        ],
        currentIndex: onSelectBottonIndex,
        onTap: onTapBottonbar,
      ),
    );
  }
}
