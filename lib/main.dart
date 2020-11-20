import 'package:design_qpp/src/models/notifi_model.dart';
import 'package:design_qpp/src/pages/home_page.dart';
import 'package:design_qpp/src/pages/slive_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:design_qpp/src/models/layout_model.dart';
import 'package:design_qpp/src/models/shoes_model.dart';
import 'package:design_qpp/src/theme/theme.dart';

import 'package:design_qpp/src/pages/launcher_tablet_page.dart';



void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new LayoutModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => new ThemeChanger(2),
        ),
        ChangeNotifierProvider(
          create: (_) => new ShoesModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => new NotificationModel(),
        ),
      ],
       child: MyApp()
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
        theme: currentTheme,
        debugShowCheckedModeBanner: false,
        
        title: 'Design App',
        home: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return SliveListPage();
          }
        }));
  }
}
