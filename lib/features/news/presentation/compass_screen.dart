
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

import 'package:quran_app/assets_helper/app_image.dart';


class CompassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Compass")),
      body: Center(
        child:

        StreamBuilder<CompassEvent?>(
          stream: FlutterCompass.events,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Compass not available");
            }

            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            double? direction = snapshot.data!.heading;

            return Transform.rotate(
              angle: ((direction ?? 0) * (math.pi / 180) * -1),
              child: Image.asset(AppImages.compassImage, width: 200),
            );
          },
        ),


      ),
    );
  }
}