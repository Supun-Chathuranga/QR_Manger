import 'dart:io';

import 'package:flutter/material.dart';
import '../models/vehicle.dart';

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
            Image.file(
              File(vehicle.qrCodeImageUrl),
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
