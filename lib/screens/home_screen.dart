import 'package:flutter/material.dart';
import 'package:qr_manager/screens/view_qr_code_screen.dart';
import 'add_vehicle_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Vehicle> vehicles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicle List')),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vehicles[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ViewQRCodeScreen(vehicle: vehicles[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newVehicle = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddVehicleScreen()),
          );
          if (newVehicle != null) {
            setState(() {
              vehicles.add(newVehicle);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}