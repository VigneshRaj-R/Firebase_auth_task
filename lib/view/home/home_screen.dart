import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_task/controller/home/home_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    int minRange = 1000;
    int maxRange = 9999;
    int randomNumber = minRange + random.nextInt(maxRange - minRange + 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Plugin"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            QrImageView(
              data: randomNumber.toString(),
              version: QrVersions.auto,
              size: 200,
            ),
            const Text("Generated Number"),
            Text("$randomNumber"),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: uploadDataToFirebase, child: Text("Save")),
            )
          ],
        ),
      ),
    );
  }
}
