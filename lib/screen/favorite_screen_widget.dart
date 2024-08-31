import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/doctor_model.dart';

class FavorteScreenWidget extends StatefulWidget {
  FavorteScreenWidget({super.key});

  @override
  State<FavorteScreenWidget> createState() => _FavorteScreenWidgetState();
}

class _FavorteScreenWidgetState extends State<FavorteScreenWidget> {
  final doctors = DoctorModel().listDoctors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorite',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
            leading: Container(
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(161, 126, 73, 1),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(doctor.image.toString()))),
            ),
            title: Text(doctor.name.toString()),
            subtitle: Text(doctor.position.toString()),
            trailing: CircleAvatar(
                child: IconButton(
              onPressed: () {
                setState(() {
                  doctor.isFavorite = !(doctor.isFavorite!);
                });
              },
              icon: Icon(
                Icons.favorite,
                color: doctor.isFavorite! ? Colors.red : Colors.white,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
