import 'package:design_qpp/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class CustomAppBarIcons extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final currentTheme = appTheme.currentTheme;


    return SafeArea(
      child: Container(
        margin: EdgeInsets.only( top: 0 ),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        child: Row(
          children: <Widget>[
          

            IconButton(icon: Icon( 
              Icons.arrow_drop_down_circle, 
              color: Colors.white,
              ),
              onPressed: () { 

                 Scaffold.of(context).openEndDrawer();
                //globalKey.currentState.openEndDrawer(); 
              },
              
            ), 
            Spacer(),
            IconButton(icon: Icon( 
              Icons.more_vert, 
              size: 35,
              color: Colors.white,
              ),
              onPressed: () { 

                 Scaffold.of(context).openEndDrawer();
                //globalKey.currentState.openEndDrawer(); 
              },
              
            ), 

          ],
        )
      ),
    );
  }
}