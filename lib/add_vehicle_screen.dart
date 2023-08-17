import 'package:image_picker/image_picker.dart';

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

  void _saveVehicle() {
    if (vehicleName.isNotEmpty && qrCodeImage != null) {
      // Save vehicle data to the list or database
      vehicles.add(Vehicle(vehicleName, qrCodeImage!.path));
      Navigator.pop(context); // Go back to the home screen
    }
  }

  // Widget build...
}