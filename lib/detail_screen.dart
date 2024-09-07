import 'package:app_ui/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailUSerScreen extends StatefulWidget {
  DetailUSerScreen({super.key, required this.doctor});
  DoctorModel? doctor;
  @override
  State<DetailUSerScreen> createState() => _DetailUSerScreenState();
}

class _DetailUSerScreenState extends State<DetailUSerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctor!.name.toString()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: widget.doctor!.id.toString(),
            child: Image(
              image: NetworkImage(
                widget.doctor!.image.toString(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Position : ${widget.doctor!.position}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.call),
              const SizedBox(
                width: 10,
              ),
              Text(widget.doctor!.contact.toString())
            ],
          )
        ],
      ),
    );
  }
}
