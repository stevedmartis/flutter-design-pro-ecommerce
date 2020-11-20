import 'package:animate_do/animate_do.dart';
import 'package:design_qpp/src/models/shoes_model.dart';
import 'package:design_qpp/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoesDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Hero(
              tag: 'shoes-1',
              child: ShoesSizePreview(fullScreen: true)),

            Positioned(
              top: 80,
              child: FloatingActionButton(
                child: Icon(Icons.chevron_left, 
                color: Colors.white, 
                size: 60
                ),
                onPressed: () => {
                  Navigator.pop(context)
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                highlightElevation: 0,
              ),
            )
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoesDescriptionPage(
                    titile: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNow(),
                  _ColorsDesign(),
                  _ButtonsOption(),
                   SizedBox(height: 30)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonsOption extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
        _BtnShadow(Icon(Icons.favorite, color: Colors.red, size: 25)),
        _BtnShadow(Icon(Icons.add_shopping_cart, color: Colors.green.withOpacity(0.4), size: 25)),
        _BtnShadow(Icon(Icons.settings, color: Colors.green.withOpacity(0.4), size: 25))


      ],),
    );
  }
}

class _BtnShadow extends StatelessWidget {

  final Icon icon;
  const _BtnShadow(
    this.icon
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.black54, spreadRadius: -5,
        blurRadius: 20,
        offset: Offset(0, 10)
      )
      ]
      ),
    );
  }
}

class _ColorsDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left: 90, child: _BtnColor(Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(left: 60, child:  _BtnColor(Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png') ),
                Positioned(left: 30, child: _BtnColor(Color(0xff2099F1), 2, 'assets/imgs/azul.png')  ),
                _BtnColor(Color(0xff364D56), 1, 'assets/imgs/negro.png')
                ,
              ],
            ),
          ),
         
          BtnRounded(
              text: 'More releated items',
              height: 30,
              width: 170,
              color: Color(0xffFFC675)),
             
        ],
      ),
      
    );
  }
}

class _BtnColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImage;


  const _BtnColor(this.color, this.index, this.urlImage);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: () {
            final shoesModel = Provider.of<ShoesModel>(context, listen: false);
            shoesModel.assetImage = this.urlImage;
          },
                  child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
        ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 0, bottom: 20),
        child: Row(
          children: [
            Text('\$180.0',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BtnRounded(text: 'Buy now', width: 120, height: 40))
          ],
        ),
      ),
    );
  }
}
