import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Viewer3d extends StatefulWidget {
  final Flutter3DController controller;
  final Function(String) onLoad;
  final String modelPath;

  const Viewer3d({
    super.key,
    required this.modelPath,
    required this.controller,
    required this.onLoad,
  });

  @override
  State<Viewer3d> createState() => _Viewer3dState();
}

class _Viewer3dState extends State<Viewer3d> {
  @override
  Widget build(BuildContext context) {
    return Flutter3DViewer(
      src: widget.modelPath,
      controller: widget.controller,
      progressBarColor: Colors.purple,
      onLoad: widget.onLoad,
      onError: (String error) {
        debugPrint('model failed to load : $error');
      },
    );
  }
}
