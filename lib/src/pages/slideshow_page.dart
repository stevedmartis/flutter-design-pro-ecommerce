import 'package:design_qpp/src/theme/theme.dart';
import 'package:design_qpp/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;


    return Scaffold(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(child: MySlideShow()),
        ],
      )
      
    );
  }
}

class MySlideShow extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      //topDots: true,
      colorPrimario: ( appTheme.darkTheme ) ? accentColor : accentColor,
      bulletPrimario: 25,
      bulletSecundario: 15,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/ocation_search.svg'),
        SvgPicture.asset('assets/svgs/people_search.svg'),
        SvgPicture.asset('assets/svgs/music.svg'),
        SvgPicture.asset('assets/svgs/team_chat.svg'),
        SvgPicture.asset('assets/svgs/team_spirit.svg'),
        SvgPicture.asset('assets/svgs/compose_music.svg'),

      ]
    );
  }
}