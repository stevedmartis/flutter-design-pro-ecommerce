import 'package:animate_do/animate_do.dart';
import 'package:design_qpp/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navigation_page.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Animations')),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => TwitterPage()));
            },
          ),
          SlideInLeft(
            from: 50,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronRight),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => DemoPage()));
              },
            ),
          )
        ],
      ),
      floatingActionButton: ElasticInUp(
        child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => NavigationPage()
                  )
              );
            },
            child: FaIcon(FontAwesomeIcons.play)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeIn(
              delay: Duration(milliseconds: 400),
              child: Text(
                'Title',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text('Sub Title',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
