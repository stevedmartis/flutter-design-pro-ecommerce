import 'package:animate_do/animate_do.dart';
import 'package:design_qpp/src/widgets/button_big.dart';
import 'package:flutter/material.dart';
import 'package:design_qpp/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  _ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class HomeScreean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    bool islarge;

    if ( MediaQuery.of(context).size.height > 550) {
      islarge = true;
    } else {
      islarge = false;
    }

  final items = <_ItemBoton>[
    new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
];

List<Widget> itemMap = items.map(

  (item) => FadeInLeft(
      
        child: ButtonBig(
        icon: item.icon,
        title: item.texto,
        color1: item.color1,
        color2: item.color2,
        onPress: (){},

),
  )).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: (islarge)? 180: 10),
            child: SafeArea(
                child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  
                  if( islarge )
                  SizedBox(height: 80),
                  ...itemMap

                ],
              ),
            ),
          ),
          if( islarge )
          IconHeaderPage()

        ],

      )
    );
  }
}

class ButtonBigTemp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ButtonBig(
    icon: FontAwesomeIcons.pizzaSlice,
    title: 'Todo Piza',
    color1: Colors.blue,
    color2: Colors.blueGrey,
    onPress: () {},
  );
  }
}

class IconHeaderPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return _Header();
  }
}

class _Header extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.plusCircle,
          title: 'Haz solicitado',
          subTitle: 'Asistencia medica',
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),

      ),
      Positioned(
        right: 0,
        top: 30,
        child: RawMaterialButton(
          onPressed: (){},
          shape: CircleBorder(),
          padding: EdgeInsets.all(15.0),
          child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,))
      )
      ]

    );
  }
}