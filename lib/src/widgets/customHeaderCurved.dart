import 'package:animate_do/animate_do.dart';
import 'package:design_qpp/src/theme/theme.dart';
import 'package:design_qpp/src/widgets/custom_appbar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomAppBarHeader extends StatelessWidget {
  final bool showContent;

  @override
  CustomAppBarHeader({this.showContent = true});

  @override
  Widget build(BuildContext context) {

  final screenSize = MediaQuery.of(context).size;


    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      color: appTheme.accentColor,
      child: Column(
        children: [
          CustomAppBarIcons(),
          (showContent)
              ? FadeIn(
                  child: Center(
                    child: Container(
                      width: 360,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              spreadRadius: -5,
                              blurRadius: 10,
                              offset: Offset(0, 5))
                        ],
                      ),
                      child: (showContent) ? _SearchContent() : Container(),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class _SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Icon( FontAwesomeIcons.chevronLeft, color: Colors.black54 ),

            Icon(FontAwesomeIcons.search, color: Colors.black),
            SizedBox(width: 20),
            Container(
                margin: EdgeInsets.only(top: 0),
                child: Text('Que quieres hoy?',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500))),
          ],
        ));
  }
}
