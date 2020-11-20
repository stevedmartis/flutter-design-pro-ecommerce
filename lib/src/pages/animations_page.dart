import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: CuadradoAnimado(),
        ),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> moveRight;
  Animation<double> enlarge;


  @override
  void initState() {

      super.initState();

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(
          parent: controller, curve: Curves.easeOut));

    opacity = Tween(begin: 0.1, end: 1.0)
        .animate(CurvedAnimation(
          parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacityOut = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
          parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    moveRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
          parent: controller, curve: Curves.easeOut)
    );

    enlarge = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
          parent: controller, curve: Curves.easeOut)
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                opacity: opacity.value - opacityOut.value,
                child: Transform.scale(
                  scale: enlarge.value,
                  child: childRectangulo),
              )),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
