import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
            QrImage(
              data: vehicle.qrCodeImageUrl,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}