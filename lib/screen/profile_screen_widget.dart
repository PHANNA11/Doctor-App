// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenWidget extends StatefulWidget {
  ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  File? pickImageData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              openCamera();
                            },
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Camera'),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              openGallary();
                            },
                            leading: const Icon(Icons.image),
                            title: const Text('Gallary'),
                          ),
                        ),
                        // CupertinoButton(
                        //   color: Colors.red,
                        //   child: const Text('Cancel'),
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        // )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                  image: pickImageData == null
                      ? null
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(pickImageData!.path)))),
              child: pickImageData != null
                  ? const SizedBox()
                  : const Center(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 50,
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }

  void openGallary() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      pickImageData = File(image!.path);
    });
    Navigator.pop(context);
  }

  void openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      pickImageData = File(image!.path);
    });
    Navigator.pop(context);
  }
}
