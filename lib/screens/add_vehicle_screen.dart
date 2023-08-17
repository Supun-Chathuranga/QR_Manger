import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/vehicle.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  String vehicleName = "";
  PickedFile? qrCodeImage;

  void _pickImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        qrCodeImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Vehicle')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Vehicle Name'),
            onChanged: (value) {
              setState(() {
                vehicleName = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Upload QR Code Image'),
          ),
          if (qrCodeImage != null)
            Image.file(
              File(qrCodeImage!.path),
              height: 100,
            ),
          ElevatedButton(
            onPressed: () {
              if (vehicleName.isNotEmpty && qrCodeImage != null) {
                Navigator.pop(
                  context,
                  Vehicle(vehicleName, qrCodeImage!.path),
                );
              }
            },
            child: Text('Save Vehicle'),
          ),
        ],
      ),
    );
  }
}
