import 'package:design_qpp/src/theme/theme.dart';
import 'package:design_qpp/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

class CircularGraphics extends StatefulWidget {
  @override
  _CircularGraphicsState createState() => _CircularGraphicsState();
}

class _CircularGraphicsState extends State<CircularGraphics> {

  double percent = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {

          setState(() {

            percent += 10; 

            if (percent > 100) {
              percent = 0;
            }
          });
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        
          CustomRadialProgress(percent: percent, color: Colors.blue, secondaryColor: Colors.white),
          CustomRadialProgress(percent: percent * 1.2, color: Colors.pink, secondaryColor: Colors.white)
        ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomRadialProgress(percent: percent *1.4, color: Colors.green, secondaryColor: Colors.white),
          CustomRadialProgress(percent: percent * 1.6, color: Colors.purple, secondaryColor: Colors.white)
        ]
        )
        ]
    ));
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;
  final Color secondaryColor;

  const CustomRadialProgress({
    @required this.percent,
    @required this.color,
    @required this.secondaryColor,

  });

  final double percent;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: 180,
      height: 180,
      padding: EdgeInsets.all(20),
      child: RadialProgress(
        percent: percent,
        primaryColor: color,
        secondaryColor: appTheme.textTheme.bodyText1.color,
      ));
  }
}

