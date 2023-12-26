import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/CameraScreen.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // Assuming you pass CameraValue to CameraPage
    properties.add(DiagnosticsProperty<Future<void>>('CameraValue', CameraValue as Future<void>?));
  }

  @override
  Widget build(BuildContext context) {
    // Assuming you pass CameraValue to CameraScreen
    return CameraScreen();
  }
}
