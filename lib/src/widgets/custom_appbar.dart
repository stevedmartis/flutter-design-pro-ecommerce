import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

    final String text;

    CustomAppBar({
      @required this.text
    });

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              child: Row(
                children: [

                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.red
                      
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
