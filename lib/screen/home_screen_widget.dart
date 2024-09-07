import 'package:app_ui/detail_screen.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/doctor_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final doctors = DoctorModel().listDoctors;

  int onTabIndex = 0;

  void tabFun(int index) {
    setState(() {
      onTabIndex = index;
    });
  }

  List<String> tabList = ['Adults', 'Childrens', 'Womens', 'Mens'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find Your\nConsultation',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(),
            ),
            buildBannerSlid(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  tabList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      tabFun(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: onTabIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              tabList[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => categoryCard(),
              ),
            ),
            const Text(
              'Doctors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                //  List.generate(doctors.length,
                //   (index) => buildDoctorsCard(doctor: doctors[index]))
                for (int i = 0; i < doctors.length; i++)
                  buildDoctorsCard(doctor: doctors[i])
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget categoryCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 250,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.pinkAccent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Heart Specialist',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Heart Specialist',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Image(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/06/05/00/01/poppy-2372550_640.png')),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDoctorsCard({required DoctorModel doctor}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 166, 223, 234),
        ),
        child: Center(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailUSerScreen(doctor: doctor),
                  ));
            },
            leading: Hero(
              tag: doctor.id.toString(),
              child: Container(
                height: 80,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(161, 126, 73, 1),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(doctor.image.toString()))),
              ),
            ),
            title: Text(doctor.name.toString()),
            subtitle: Text(doctor.position.toString()),
            trailing: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 161, 126, 73),
              ),
              child: const Center(
                child: Text('Call'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBannerSlid() {
    return CarouselSlider(
        items: List.generate(
          imgList.length,
          (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imgList[index]),
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          height: 180,
          aspectRatio: 18 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
