import 'package:design_qpp/src/pages/cuadrado_animado_page.dart';
import 'package:design_qpp/src/pages/demo_page.dart';
import 'package:design_qpp/src/pages/graph_circular_page.dart';
import 'package:design_qpp/src/pages/grid_layout_page.dart';
import 'package:design_qpp/src/pages/header_page.dart';
import 'package:design_qpp/src/pages/home_page.dart';
import 'package:design_qpp/src/pages/home_screen_page.dart';
import 'package:design_qpp/src/pages/settings_page.dart';
import 'package:design_qpp/src/pages/slideshow_page.dart';
import 'package:design_qpp/src/pages/slive_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final pageRouter = <_Route> [




    _Route(
  FontAwesomeIcons.slideshare, 
  'Home', HomePage()),

 /*    _Route(
  FontAwesomeIcons.slideshare, 
  'Settings', SettingsPage()), */

/*   _Route(
  FontAwesomeIcons.slideshare, 
  'SlideShow', SlideShowPage()), */

  _Route(
  FontAwesomeIcons.heading, 
  'Headers', HeadersPage()),
  _Route(
  FontAwesomeIcons.ambulance, 
  'HomeScreen', HomeScreean()),
  _Route(
  FontAwesomeIcons.peopleCarry, 
  'Cuadrado Animado', CuadradoAnimadoPage()),

  _Route(
  FontAwesomeIcons.circleNotch, 
  'Circular progress', CircularGraphics()),

    _Route(
  FontAwesomeIcons.pinterest, 
  'Grid Layout', GridLayoutPage()),
  _Route(
  FontAwesomeIcons.mobile, 
  'Slives List', SliveListPage()),

  _Route(
  FontAwesomeIcons.fighterJet, 
  'Demo Animations', DemoPage())
];

class _Route {

  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);

  

}