import 'dart:math' as Math;

import 'package:flutter/material.dart';
 
import 'dart:ui';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState 
extends State<CircularProgressPage>  
with SingleTickerProviderStateMixin {


  AnimationController controller;

  double percent = 0.0;
  double newPercent = 0.0;

  
  @override
  void initState() { 

    controller = new AnimationController(
      vsync:  this, 
      duration:  Duration(milliseconds: 800
      ));

    controller.addListener( () {

      setState(() {
        percent = lerpDouble(percent, newPercent, controller.value);      
      });

    });

    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh),
        onPressed: (){

          percent = newPercent;
          newPercent += 10;
          if(newPercent > 100 ){

            newPercent = 0;
            percent = 0;
          }

          controller.forward( from: 0.0 );

          setState(() {});
        },
      ),
      
          body: Center(
            child: Container(
            width: 300,
            padding: EdgeInsets.all(5),
            height: 300,
            // color: Colors.red,
            child: CustomPaint(
              painter: _MyRadialProgressPainter(percent)),
        
      ),
          ),
    );
  }
}

class _MyRadialProgressPainter extends CustomPainter  {

final percent;

_MyRadialProgressPainter( this.percent);
  // Circulo Paint
  @override
  void paint(Canvas canvas, Size size) {
     

     final paint = new Paint()
        ..strokeWidth = 15
        ..color = Color(0xfff1f3f4)
        ..style = PaintingStyle.stroke;

        final center = new Offset(size.width * 0.5, size.height / 2);
        final radius = Math.min(size.width * 0.5, size.height * 0.5);

        canvas.drawCircle(center, radius, paint);

        //Arco 
        final paintArco = new Paint()
        ..strokeWidth = 15
        ..color = Colors.blueAccent
        ..style = PaintingStyle.stroke;

        // Progress 
        double arcAngle = 2 * Math.pi * ( percent / 100 );

        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius), 
        - Math.pi / 2, 
        arcAngle, 
        false, 
        paintArco);
    }

    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

} 
