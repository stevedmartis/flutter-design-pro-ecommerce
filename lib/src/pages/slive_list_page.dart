import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:design_qpp/src/models/layout_model.dart';
import 'package:design_qpp/src/pages/home_page.dart';
import 'package:design_qpp/src/theme/theme.dart';
import 'package:design_qpp/src/widgets/customHeaderCurved.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliveListPage extends StatefulWidget {
  @override
  _SliveListPageState createState() => _SliveListPageState();
}

class _SliveListPageState extends State<SliveListPage> {
  bool _isVisible = true;

  double get randHeight => Random().nextInt(100).toDouble();

  List<Widget> _randomChildren;

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery
  List<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren ??= List.generate(3, (index) {
      final height = randHeight.clamp(
        50.0,
        MediaQuery.of(context).size.width, // simply using MediaQuery to demonstrate usage of context
      );
      return Container(
        color: Colors.primaries[index],
        height: height,
        child: Text('Random Height Child ${index + 1}'),
      );
    });

    return _randomChildren;
  }
  

  @override
  Widget build(BuildContext context) {


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
                child: _MainScroll(),
              ),
            ),

             
/*           Positioned(
            bottom: 0,
            right: 0,
            child: _BtnNewList()
          ) */
          ],
        ),
        bottomNavigationBar:
            BottomNavigationCurvedAnimated(isVisible: _isVisible));
  }
}

class _BtnNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.7,
      height: 100,
      child: RaisedButton(
          onPressed: () {},
          color: (appTheme.darkTheme)
              ? appTheme.currentTheme.accentColor
              : Color(0xffED6762),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          child: Text(
            'Create new List',
            style: TextStyle(
                color: appTheme.currentTheme.scaffoldBackgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          )),
    );
  }
}

// InstaProfilePage
class InstaProfilePage extends StatefulWidget {
  @override
  _InstaProfilePageState createState() => _InstaProfilePageState();
}

class _InstaProfilePageState extends State<InstaProfilePage> {
  double get randHeight => Random().nextInt(100).toDouble();

  List<Widget> _randomChildren;

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery
  List<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren ??= List.generate(3, (index) {
      final height = randHeight.clamp(
        50.0,
        MediaQuery.of(context).size.width, // simply using MediaQuery to demonstrate usage of context
      );
      return Container(
        color: Colors.primaries[index],
        height: height,
        child: Text('Random Height Child ${index + 1}'),
      );
    });

    return _randomChildren;
  }

  @override
  Widget build(BuildContext context) {
    return 
      DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  _randomHeightWidgets(context),
                ),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(text: 'A'),
                  Tab(text: 'B'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    
    );
  }
}

class _MainScroll extends StatelessWidget {


  final itemsHome = [
    FadeInLeft(
      delay: Duration(milliseconds: 250),
      child: BannerSlide()),
    OptionsCircular(),
    SizedBox(height: 15),
    FadeInRight(
      delay: Duration(milliseconds: 600),
      child: PromotionSlide()),
    SizedBox(height: 30),
    

        _ListItem('Item 1', Colors.white),
        _ListItem('Item 2', Colors.white),
                _ListItem('Item 3', Colors.white),

        _ListItem('Item 4', Colors.white),




/*     _ListItem('Orange', Color(0xffF08F66)),
 */
  ];



    final itemsProfile = [
   

    InstaProfilePage(),
          _ListItem('Item 1', Colors.white),
        _ListItem('Item 2', Colors.white),
                _ListItem('Item 3', Colors.white),

        _ListItem('Item 4', Colors.white),
 

  ];

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;


    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final layoutModel = Provider.of<LayoutModel>(context);

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              minHeight: (layoutModel.numbercurrentPage == 0)? 130 : 80,
              maxHeight: (layoutModel.numbercurrentPage == 0)? 130 : 80,
              child: Container(
               
                color: appTheme.scaffoldBackgroundColor,
                child:      (layoutModel.numbercurrentPage == 0)?
     CustomAppBarHeader(showContent: true)
     : CustomAppBarHeader(showContent: false),
              )),
        ),
        SliverList(
          delegate: 
          
          (layoutModel.numbercurrentPage == 0)?
          SliverChildListDelegate([...itemsHome, SizedBox(height: 100)])

          :SliverChildListDelegate([...itemsProfile, SizedBox(height: 100)])
         
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _ListItems extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}



class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: appTheme.currentTheme.accentColor,
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
