import 'package:flutter/material.dart';

import '../resources/style_manager.dart';

class ScanQRScreen extends StatelessWidget {
  const ScanQRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("QR Scanner", style: getSemiBoldStyle(fontSize: 30),),
      ),
    );
  }
}
