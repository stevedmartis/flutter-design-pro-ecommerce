import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 1
class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRadius extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

// 2
class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    // properties
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; // .stroke = bordes, .fill = relleno
    pencil.strokeWidth = 2;

    final path = new Path();

    // Dibujar con path y el pencil

    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// 3
class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderTrinagularPainter()),
    );
  }
}

class _HeaderTrinagularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    // properties
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; // .stroke = bordes, .fill = relleno
    pencil.strokeWidth = 2;

    final path = new Path();

    // Dibujar con path y el pencil

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// 4
class HeaderHexagono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderHexagonoBottomPainter()),
    );
  }
}

class _HeaderHexagonoBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    // properties
    pencil.color = Color(0xff09044a);
    pencil.style = PaintingStyle.fill; // .stroke = bordes, .fill = relleno
    pencil.strokeWidth = 20;

    final path = new Path();

    // Dibujar con path y el pencil

    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// 5
class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvoPainter()),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    // properties
    pencil.color = Color(0xff09044a);
    pencil.style = PaintingStyle.fill; // .stroke = bordes, .fill = relleno
    pencil.strokeWidth = 20;

    final path = new Path();

    // Dibujar con path y el pencil

    path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width, size.height * 0.25);

    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// 6
class HeaderTwoCurves extends StatelessWidget {
  final Color color;

  HeaderTwoCurves({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(painter: _HeaderTwoCurvesPainter(this.color)),
    );
  }
}

class HeaderTwoCurvesSearch extends StatelessWidget {
  final Color color;

  HeaderTwoCurvesSearch({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(painter: _HeaderTwoCurvesPainter(this.color)),
        ),

        
      ],
    );
  }
}

class _SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              // Icon( FontAwesomeIcons.chevronLeft, color: Colors.black54 ),

              Icon(FontAwesomeIcons.search, color: Colors.black),
              SizedBox(width: 20),
              Container(
                margin: EdgeInsets.only(top: 0),
               
                child: Text(
                  'Que quieres hoy?', 
                  style: TextStyle(color:Colors.black54, fontSize: 16, fontWeight: FontWeight.w500 )
                )
              ),
              Spacer(),

            ],
          )),
    );
  }
}

class _HeaderTwoCurvesPainter extends CustomPainter {
  final Color color;

  _HeaderTwoCurvesPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    // properties
    pencil.color = this.color; //Color(0xff09044a);
    pencil.style = PaintingStyle.fill; // .stroke = bordes, .fill = relleno
    pencil.strokeWidth = 20;

    final path = new Path();

    // Dibujar con path y el pencil

    path.lineTo(0, size.height * 0.90);
    //path.lineTo(size.width, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.30, size.height * 1.1,
        size.width * 0.5, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.80, size.height * 0.60, size.width, size.height * 0.90);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;

  IconHeader({
    @required this.icon,
    @required this.title,
    this.subTitle,
    this.color1 = Colors.blue,
    this.color2 = Colors.lightBlue,
  });

  @override
  Widget build(BuildContext context) {
    final Color whiteColor = Colors.white.withOpacity(0.7);
    return Stack(
      children: <Widget>[
        _IconHeaderBackGround(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: -40,
          left: -50,
          child: FaIcon(
            this.icon,
            size: 200,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 50, width: double.infinity),
            Text(this.title, style: TextStyle(fontSize: 20, color: whiteColor)),
            SizedBox(height: 20),
            Text(this.subTitle,
                style: TextStyle(
                    fontSize: 25,
                    color: whiteColor,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            FaIcon(
              this.icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackGround extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackGround({@required this.color1, @required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[this.color1, this.color2])),
    );
  }
}
