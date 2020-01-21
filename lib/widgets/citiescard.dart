import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class _CitiesCardStars extends StatelessWidget {
  final double score;

  _CitiesCardStars({
    Key key,
    @required this.score
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: List.generate(score.floorToDouble().toInt(), (i) => Icon(Icons.star, color: Colors.orange, size: 15.0)),
        ),
        Row(
          children: List.generate(5 - score.floorToDouble().toInt(), (i) => Icon(Icons.star, color: Colors.orange.withOpacity(.3), size: 15.0)),
        )
      ]
    );
  }
}

class _CitiesCardScoreClipper extends CustomClipper<Path> {
  final double height, width;

  _CitiesCardScoreClipper({
    Key key,
    @required this.width,
    @required this.height
  });

  @override
  Path getClip(Size size) {
    final clipper = Path()
      ..moveTo(0, 0)
      ..lineTo(this.width, 0)
      ..lineTo(this.width, this.height)
      ..lineTo(this.width / 2, this.height - (this.width / 2))
      ..lineTo(0, this.height)
      ..close();
    return clipper;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _CitiesCardScorePainter extends CustomPainter {
  final double width, height;

  _CitiesCardScorePainter({
    Key key,
    @required this.width,
    @required this.height,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final double left = 0.0;
    final double right = this.width;
    final double top = 0.0;
    final double bottom = this.height;

    final rect = Rect.fromLTRB(left, top, right, bottom);
    final paintRect = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paintRect);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _CitiesCardScore extends StatelessWidget {
  final double score;

  _CitiesCardScore({
    Key key,
    this.score
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 150,
      child: ClipPath(
        clipper: _CitiesCardScoreClipper(width: 30, height: 50),
        child: CustomPaint(
          painter: _CitiesCardScorePainter(width: 30, height: 50),
          child: Padding(
            padding: EdgeInsets.only(left: 3.9, top: 10.0),
            child: Text(
              '${this.score}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          )
        )
      ),
    );
  }
}

class CitiesCard extends StatelessWidget {
  final String title, description, image;
  final int price;
  final double score;

  CitiesCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.price,
    @required this.score
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = intl.NumberFormat.compactSimpleCurrency();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 2.0)
        ],
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: 200,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 250,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(this.image)
                    ),
                  ),
                  _CitiesCardScore(score: this.score)
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis),
                    Text(this.description, style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Text(currencyFormat.format(this.price), style: Theme.of(context).textTheme.title.apply(color: Colors.blue)),
                        _CitiesCardStars(score: this.score)
                      ]
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget compact({
    @required String title,
    @required String image
  }){
    return Container(
      child: Image.asset(image),
    );
  }
}