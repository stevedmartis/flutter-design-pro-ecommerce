import 'package:flutter/material.dart';
import 'dart:math' as Math;
 

class RadialProgress extends StatefulWidget {

final percent;
final Color primaryColor;
final Color secondaryColor;


  const RadialProgress({
    @required this.percent,
              this.primaryColor = Colors.blueAccent,
              this.secondaryColor = Colors.white
              
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double previusPercent;

  @override
  void initState() {
    
    previusPercent = widget.percent;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    controller.forward(from: 0.0);

    final differenceAnimar = widget.percent - previusPercent;
    previusPercent = widget.percent;

    return AnimatedBuilder(
      animation: controller,
  
      builder: (BuildContext context, Widget child) {
      
      return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
        painter: _MyRadialProgressPainter(
          ( widget.percent - differenceAnimar) + (differenceAnimar * controller.value),
          
          widget.primaryColor,
          widget.secondaryColor
        ),
        child: Center(
          child: Text('${ widget.percent}%',style: TextStyle(fontSize: 20),),
        ),
      )
    );
      },
    );

  }
}

class _MyRadialProgressPainter extends CustomPainter  {

final percent;
final Color primaryColor;
final Color secondaryColor;

_MyRadialProgressPainter( this.percent, this.primaryColor, this.secondaryColor);
  // Circulo Paint
  @override
  void paint(Canvas canvas, Size size) {
     
    final Rect rect = new Rect.fromCircle(
      center: Offset(0,0),
      radius: 150
    );
    final Gradient gradient = new RadialGradient(
    colors: <Color>[
      Color(0xff6D05E8),
      Color(0xffC012FF),
      Colors.blueAccent
    ]);

     final paint = new Paint()
        ..strokeWidth = 15
        ..color = secondaryColor
        ..style = PaintingStyle.stroke;

        final center = new Offset(size.width * 0.5, size.height / 2);
        final radius = Math.min(size.width * 0.5, size.height * 0.5);

        canvas.drawCircle(center, radius, paint);

        //Arco 
        final paintArco = new Paint()
        ..strokeWidth = 15
        // ..color = primaryColor
        ..shader      = gradient.createShader(rect)
        ..strokeCap   = StrokeCap.round
        ..style       = PaintingStyle.stroke;

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



