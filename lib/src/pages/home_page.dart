import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:design_qpp/src/models/layout_model.dart';

import 'package:design_qpp/src/theme/theme.dart';
import 'package:design_qpp/src/widgets/custom_appbar2.dart';

import 'package:design_qpp/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  @override
  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);

    _onStartScroll(ScrollMetrics metrics) {
      setState(() {
        _isVisible = false;
      });
    }

    _onUpdateScroll(ScrollMetrics metrics) {
      setState(() {
        _isVisible = false;
      });
    }

    _onEndScroll(ScrollMetrics metrics) {
      setState(() {
        _isVisible = true;
      });
    }

    return Scaffold(
        appBar: (layoutModel.numbercurrentPage == 0)
            ? PreferredSize(
                preferredSize: Size.fromHeight(100), // here the desired height
                child: CustomAppBar(showContent: true),
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(100), // here the desired height
                child: CustomAppBar(showContent: false),
              ),
        endDrawer: PrincipalMenu(),
        body: Stack(
          children: <Widget>[
            Background(),
            Container(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollStartNotification &&
                      scrollNotification.metrics.pixels < 300000.0) {
                    _onStartScroll(scrollNotification.metrics);
                  } else if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.metrics.pixels < 300000.0) {
                    _onUpdateScroll(scrollNotification.metrics);
                  } else if (scrollNotification is ScrollEndNotification) {
                    _onEndScroll(scrollNotification.metrics);
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: (layoutModel.numbercurrentPage == 0)
                      ? FadeIn(
                          child: Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: <Widget>[
                                BannerSlide(),
                                OptionsCircular(),
                                SizedBox(height: 5),
                                PromotionSlide(),
                                SizedBox(height: 30),
                                PromotionCard()
                              ],
                            ),
                          ),
                        )
                      : Container(
                          child: Column(
                            children: <Widget>[],
                          ),
                        ),
                ),
              ),
            )
          ],
        ),

        //floatingActionButton: ButtomFloating(),
        bottomNavigationBar:
            BottomNavigationCurvedAnimated(isVisible: _isVisible));
  }
}

class BottomNavigationCurvedAnimated extends StatefulWidget {
  const BottomNavigationCurvedAnimated({
    Key key,
    @required bool isVisible,
  })  : _isVisible = isVisible,
        super(key: key);

  final bool _isVisible;

  @override
  _BottomNavigationCurvedAnimatedState createState() =>
      _BottomNavigationCurvedAnimatedState();
}

class _BottomNavigationCurvedAnimatedState
    extends State<BottomNavigationCurvedAnimated> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    int selectedpage = 0; //initial value

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: widget._isVisible ? 50 : 0,
      child: CurvedNavigationBar(
        height: 50,
        index: selectedpage,
        buttonBackgroundColor: appTheme.accentColor,
        backgroundColor: appTheme.scaffoldBackgroundColor,
        color: appTheme.accentColor,
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: appTheme.primaryColorLight,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: appTheme.primaryColorLight,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: appTheme.primaryColorLight,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: appTheme.primaryColorLight,
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundColor: appTheme.scaffoldBackgroundColor,
              child: Text(
                'DM',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index;

            final loyoutModel =
                Provider.of<LayoutModel>(context, listen: false);

            loyoutModel.numbercurrentPage = selectedpage;

/*             if (selectedpage == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          pageRouter[selectedpage].page));
            } */

            // changing selected page as per bar index selected by the user
          });
        },
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final bool showContent;

  @override
  CustomAppBar({this.showContent = true});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      color: appTheme.accentColor,
      child: Stack(
        children: [
          (showContent)
              ? FadeIn(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 15, left: 15, top: 80, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              spreadRadius: -5,
                              blurRadius: 10,
                              offset: Offset(0, 5))
                        ]),
                  ),
                )
              : Container(),
          (showContent) ? _SearchContent() : Container(),
          CustomAppBarIcons()
        ],
      ),
    );
  }
}

class PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'DM',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
/*               Expanded(
                child: _OptionsList(),
              ), */
            ListTile(
              leading: FaIcon(FontAwesomeIcons.moon, color: accentColor),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor),
                title: Text('Custom theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
      ),
      Container(
        width: double.infinity,
        height: 250,
        child: HeaderTwoCurvesSearch(color: appTheme.accentColor),
      )
    ]);
  }
}

/* 

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          
          Container(
            width: 200,
            height: 200,
            child: HeaderTwoCurvesSearch(color: appTheme.accentColor),
          ),
       
  
          _Card(),

        ],
      ),
      floatingActionButton: ButtomFloating(),
      bottomNavigationBar: BottomNavigation(),
    ) */
final List<String> imgList = [
  'assets/banners/banner1.jpg',
  'assets/banners/banner2.jpg',
  'assets/banners/banner3.jpg',
];

final List<String> imgPromoList = [
  'assets/banners/promo1.jpg',
  'assets/banners/promo2.jpg',
  'assets/banners/promo3.jpg',
];

class BannerSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  final screenSize = MediaQuery.of(context).size;

    return Container(
        child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: (screenSize.height > 500 )? 2.2: 2.6,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 5),
            ),
            items: imageSliders));
  }
}

class OptionsCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FadeIn(
                  duration: Duration(milliseconds: 850),
                  delay: Duration(milliseconds: 150),
                  child: _BtnShadow(
                      icon: FontAwesomeIcons.hamburger,
                      color: appTheme.accentColor,
                      text: 'Restaurantes',
                      left: 0)),
              FadeIn(
                  duration: Duration(milliseconds: 850),
                  delay: Duration(milliseconds: 250),
                  child: _BtnShadow(
                      icon: FontAwesomeIcons.store,
                      color: appTheme.accentColor,
                      text: 'Tiendas',
                      left: 15)),
              FadeIn(
                  duration: Duration(milliseconds: 850),
                  delay: Duration(milliseconds: 350),
                  child: _BtnShadow(
                      icon: FontAwesomeIcons.briefcaseMedical,
                      color: appTheme.accentColor,
                      text: 'Farmacias',
                      left: 10)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FadeIn(
                  duration: Duration(milliseconds: 850),
                  delay: Duration(milliseconds: 450),
                  child: _BtnShadow(
                      icon: FontAwesomeIcons.solidHeart,
                      color: appTheme.accentColor,
                      text: 'Mis Deseos',
                      left: 5)),
              FadeIn(
                  duration: Duration(milliseconds: 850),
                  delay: Duration(milliseconds: 550),
                  child: _BtnShadow(
                      icon: FontAwesomeIcons.gift,
                      color: appTheme.accentColor,
                      text: 'Regalos',
                      left: 15)),
              FadeIn(
                  duration: Duration(milliseconds: 850),
                  delay: Duration(milliseconds: 650),
                  child: _BtnShadow(
                      icon: FontAwesomeIcons.history,
                      color: appTheme.accentColor,
                      text: 'Historial',
                      left: 15)),
            ],
          ),
        ],
      ),
    );
  }
}

class _BtnShadow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final text;
  final double left;

  const _BtnShadow({this.icon, @required this.text, this.color, this.left});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Icon(this.icon, size: 30, color: Colors.white),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: this.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    spreadRadius: -5,
                    blurRadius: 20,
                    offset: Offset(0, 10))
              ]),
        ),
        Container(
            margin: EdgeInsets.only(top: 75, left: this.left),
            child: Text(this.text))
      ],
    );
  }
}

class PromotionSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      final screenSize = MediaQuery.of(context).size;

    return Container(
        child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: (screenSize.height > 500 )? 3.0 : 3.5,
              scrollDirection: Axis.horizontal,
            ),
            items: imagePromotionSlide));
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.blue;
    var path = Path();
    path.lineTo(0, 200 - 200 / 5);
    path.lineTo(size.width / 1.2, 200);
    //Added this line
    path.relativeQuadraticBezierTo(15, 3, 30, -5);
    path.lineTo(size.width, 200 - 200 / 5);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      height: 1000.0,
                      width: 1000.0,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

final List<Widget> imagePromotionSlide = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      height: 200,
                      width: 1000.0,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
/*               child: Text(
                'No. ${imgList.indexOf(item)} image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ), */
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class PromotionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 370,
      height: 110,
      child: RaisedButton(
          onPressed: () {},
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Text(
            'Create new List',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          )),
    );
  }
}

class _SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.only(top: 60, left: 5.0),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
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
          )),
    );
  }
}
