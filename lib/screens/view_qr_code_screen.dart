import 'package:flutter/material.dart';
import 'package:qr_manager/models/vehicle.dart'; // Import your Vehicle class or wherever you defined it

class ViewQRCodeScreen extends StatelessWidget {
  final Vehicle vehicle;

  ViewQRCodeScreen({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View QR Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(vehicle.name),
            SizedBox(height: 20),
            // Replace with an Image widget that loads the QR code image
            // For example:
            // Image.network(vehicle.qrCodeImageUrl),
          ],
        ),
      ),
    );
  }
}