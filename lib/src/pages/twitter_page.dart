import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool active = false;
  Timer _timer;
  
_TwitterPageState() {
    _timer = new Timer(const Duration(milliseconds: 600), () {
      setState(() {
        this.active = true;
      });
      
    });
  }
  @override
  void dispose() {
    _timer.cancel();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1DA1F2),
        body: Center(child: 
      ZoomOut(
        animate: this.active,
        from: 30,
        duration: Duration(seconds: 1),
        child: FaIcon( 
          FontAwesomeIcons.twitter, 
          color: Colors.white, 
          size: 50)
      )
      ),
      
    );
  }
}