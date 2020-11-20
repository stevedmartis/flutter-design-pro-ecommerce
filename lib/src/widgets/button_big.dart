import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ButtonBig extends StatelessWidget {

  final IconData icon;
  final String title;
  final Color color1;
  final Color color2;
  final Function onPress;

  ButtonBig({ 
    this.icon = FontAwesomeIcons.circle,
    @required this.title,
    this.color1 = Colors.grey,
    this.color2 =Colors.black,
    @required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
        child: Stack(
          children: <Widget>[
            _ButtonBigBackGround(this.icon, this.color1, this.color2),
            Row(
              children: <Widget>[
                SizedBox( height: 150, width: 50 ),
                FaIcon(this.icon, color: Colors.white, size: 40),
                SizedBox( width: 20 ),
                Expanded(child: Text(this.title,style: TextStyle(color: Colors.white, fontSize: 18))),
                FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
                SizedBox( width: 50 ),

              ],
            )
          ],
        ),
    );
  }
}

class _ButtonBigBackGround extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  _ButtonBigBackGround(this.icon,this.color1, this.color2);


  @override
  Widget build(BuildContext context) {
    return Container(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
          child: Stack(children: <Widget>[
          Positioned(
            right: -20,
            top: -10,
            child: FaIcon(this.icon, size: 130, color: Colors.white.withOpacity(0.2)))
        ]),
      ),
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow( color: Colors.black.withOpacity(0.3),
            offset: Offset(4,6),
            blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: <Color>[
                this.color1,
                this.color2
              ]
          )
        ),
      
    );
  }
}