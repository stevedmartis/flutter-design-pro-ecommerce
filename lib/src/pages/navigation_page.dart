import 'package:animate_do/animate_do.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:design_qpp/src/models/notifi_model.dart';
import 'package:design_qpp/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:design_qpp/src/routes/routes.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Scaffold(
        floatingActionButton: ButtomFloating(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  pageRouter[currentIndex].page));
    });
  }

  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<NotificationModel>(context).number;

    final appTheme = Provider.of<ThemeChanger>(context);

  
    return CurvedNavigationBar(

              height: 50, 
        buttonBackgroundColor: appTheme.currentTheme.accentColor,
        backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
        color: appTheme.currentTheme.accentColor,
        animationCurve: Curves.linearToEaseOut,
    
      onTap: _onItemTapped,
      items: [

                  Icon(
                    
            Icons.home,
            size: (currentIndex == 0)? 35 :25 ,
            color: appTheme.currentTheme.scaffoldBackgroundColor,
          ),

                            Icon(
                    
            Icons.add,
            size: (currentIndex == 0)? 35 :30 ,
            color: appTheme.currentTheme.scaffoldBackgroundColor,
          ),

        IconButton(
            onPressed: () {

  
            },
            icon: Stack(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.shoppingCart),
                Positioned(
                  top: 0.0,
                  right: 4.0,
                  child: BounceInDown(
                    from: 10,
                    animate: (number > 0) ? true : false,
                    child: Bounce(
                      from: 15,
                      controller: (controller) =>
                          Provider.of<NotificationModel>(context)
                              .bounceController = controller,
                      child: Container(
                        child: Text(
                          '$number',
                          style: TextStyle(
                              color: (appTheme.customTheme)
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.center,
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: (appTheme.customTheme)
                                ? Colors.white
                                : Colors.black,
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                )
              ],
            )),

      ],
    );
  }
}

class ButtomFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return FloatingActionButton(
      backgroundColor: appTheme.currentTheme.accentColor,
      onPressed: () {
        final notifiModel =
            Provider.of<NotificationModel>(context, listen: false);
        int number = notifiModel.number;
        number++;
        notifiModel.number = number;

        if (number >= 2) {
          final controller = notifiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(
        FontAwesomeIcons.plus,
        color: (appTheme.darkTheme)
            ? Colors.black
            : appTheme.currentTheme.primaryColorLight,
      ),
    );
  }
}
