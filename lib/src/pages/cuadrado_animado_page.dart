import 'package:flutter/material.dart';
 
 
class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado())
    );

  }
}

class _CuadradoAnimado extends StatefulWidget {


  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>  with SingleTickerProviderStateMixin{

  AnimationController controller;

  Animation<double> moveRight;
  Animation<double> moveUp;
  Animation<double> moveLeft;
  Animation<double> moveDown;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4500));

    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut))
    );

    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25, 0.50, curve: Curves.bounceInOut))
    );

   moveLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceInOut))
    );

       moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceInOut))
    );

    controller.addListener(() {

      if(controller.status == AnimationStatus.completed){

        controller.reset();
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

    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext contect, Widget child) {
        return Transform.translate(
          offset: Offset(moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: child
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
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}