import 'package:design_qpp/src/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {

  Widget _currentPage = NavigationPage();

  int _numbercurrentPage = 0;

  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;

  set numbercurrentPage(int number) {
    this._numbercurrentPage = number;
    notifyListeners();
  }

  int get numbercurrentPage => this._numbercurrentPage;
  
}