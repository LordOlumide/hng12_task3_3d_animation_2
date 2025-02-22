import 'package:attempt_3/src/widgets/3d_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Flutter3DController controller1 = Flutter3DController();
  final Flutter3DController controller2 = Flutter3DController();

  double theta1 = 10;
  double phi1 = 90;
  double radius1 = 100;
  double theta2 = 10;
  double phi2 = 90;
  double radius2 = 100;

  void setCamera1Orbit(Flutter3DController controller) {
    setState(() {
      controller.setCameraOrbit(theta1, phi1, radius1);
    });
  }

  void setCamera2Orbit(Flutter3DController controller) {
    setState(() {
      controller.setCameraOrbit(theta2, phi2, radius2);
    });
  }

  void rotateModel1(Flutter3DController controller, [bool left = true]) {
    theta1 = left ? theta1 + 20 : theta1 - 20;
    setCamera1Orbit(controller);
  }

  void rotateModel2(Flutter3DController controller, [bool left = true]) {
    theta2 = left ? theta2 + 20 : theta2 - 20;
    setCamera2Orbit(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text('3D Models'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Viewer3d(
                  modelPath: 'assets/3d_models/man1_model.glb',
                  controller: controller1,
                  onLoad: (String modelAddress) {
                    setCamera1Orbit(controller1);
                  },
                ),
                Positioned(
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => rotateModel1(controller1),
                        icon: Icon(Icons.rotate_left),
                      ),
                      IconButton(
                        onPressed: () => rotateModel1(controller1, false),
                        icon: Icon(Icons.rotate_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Viewer3d(
                  modelPath: 'assets/3d_models/woman1_model.glb',
                  controller: controller2,
                  onLoad: (String modelAddress) {
                    setCamera1Orbit(controller2);
                  },
                ),
                Positioned(
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => rotateModel2(controller2),
                        icon: Icon(Icons.rotate_left),
                      ),
                      IconButton(
                        onPressed: () => rotateModel2(controller2, false),
                        icon: Icon(Icons.rotate_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
