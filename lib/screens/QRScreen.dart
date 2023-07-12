import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  final String data;

  const QRScreen({required Key key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
          child: QrImageView(
        data: 'This is a QR code',
        version: QrVersions.auto,
        size: 200.0,
      )),
    );
  }
}
