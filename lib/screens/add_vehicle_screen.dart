import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/vehicle.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  String vehicleName = '';
  PickedFile? qrCodeImage;

  void _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        qrCodeImage = pickedImage;
      });
    }
  }

  void _saveVehicle() {
    if (vehicleName.isNotEmpty && qrCodeImage != null) {
      final newVehicle = Vehicle(vehicleName, qrCodeImage!.path);
      Navigator.pop(context, newVehicle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Vehicle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  vehicleName = value;
                });
              },
              decoration: InputDecoration(labelText: 'Vehicle Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick QR Code Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveVehicle,
              child: Text('Save Vehicle'),
            ),
          ],
        ),
      ),
    );
  }
}