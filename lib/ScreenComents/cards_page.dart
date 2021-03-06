import 'dart:math';
import 'dart:ui';

import 'package:argument_app/ScreenComents/ScreenComents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import './constant.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

final List<Card> cards = [
  Card(
    size: Size(Get.width * 0.95, 200),
    colors: [Colors.lightBlue, Colors.blue[900]],
    title: "Esportes",
  ),
  Card(
    size: Size(Get.width * 0.95, 200),
    colors: [Colors.green[300], Colors.green[900]],
    title: "Ciência",
  ),
  Card(
    size: Size(Get.width * 0.95, 200),
    colors: [Colors.red[300], Colors.red[900]],
    title: "Tecnologia",
  ),
  Card(
    size: Size(Get.width * 0.95, 200),
    colors: [Colors.yellow[300], Colors.yellow[900]],
    title: "Filosofia",
  ),
  Card(
    size: Size(Get.width * 0.95, 200),
    colors: [Colors.deepOrange[300], Colors.deepOrange[900]],
    title: "Politica",
  ),
];

class _CardsPageState extends State<CardsPage> {
  final _controller = PageController(viewportFraction: 0.8);
  final _valueNotifier = ValueNotifier(0.0);

  @override
  void initState() {
    _controller.addListener(listener);
    super.initState();
  }

  void listener() {
    _valueNotifier.value = _controller.page;
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: _controller,
        itemCount: cards.length,
        itemBuilder: (context, int index) {
          final t = (index - _valueNotifier.value);
          final rotationY = lerpDouble(0, pi / 12, t);
          final translateX = lerpDouble(0, -50, t);
          final transform = Matrix4.identity();
          transform.setEntry(3, 2, 0.01);
          transform.translate(translateX);
          transform.rotateY(rotationY);
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Align(
                child: Container(
                  margin: EdgeInsets.only(top: Get.height * 0.06),
                  child: Transform(
                    transform: transform,
                    child: cards[index],
                    alignment: Alignment.center,
                  ),
                ),
                alignment: Alignment.topCenter,
              )
            ],
          );
        },
      ),
    );
  }
}

class Card extends StatefulWidget {
  final String title;
  final List<Color> colors;

  final Size size;
  Card({
    Key key,
    @required this.size,
    this.title,
    this.colors,
  }) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _xAnimation;
  Animation<double> _yAnimation;

  double x = 0;
  double y = 0;
  @override
  initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {
              x = _xAnimation.value;
              y = _yAnimation.value;
            });
          });
    super.initState();
  }

  void runAnimation() {
    _xAnimation = _controller.drive(Tween<double>(begin: x, end: 0));
    _yAnimation = _controller.drive(Tween<double>(begin: y, end: 0));
    _controller.reset();
    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transform = Matrix4.identity();
    transform.setEntry(3, 2, 0.001);
    transform.rotateX(x);
    transform.rotateY(y);
    return Transform(
        transform: transform,
        alignment: Alignment.center,
        child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                x += details.delta.dy / 100;
                y += details.delta.dx / 100;
              });
            },
            onPanEnd: (details) {
              runAnimation();
            },
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CommentsScreen()));
            },
            child: ShaderMask(
                shaderCallback: (rect) =>
                    LinearGradient(colors: widget.colors).createShader(rect),
                blendMode: BlendMode.color,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: widget.size.width * 0.95,

                  // height: widget.size.height,
                  height: 450,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: widget.colors),
                    image: DecorationImage(
                      image: AssetImage("assets/images/science-img.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          widget.title,
                          style: GoogleFonts.ubuntu(
                              shadows: [
                                Shadow(
                                  blurRadius: 15.0,
                                  color: Colors.black,
                                  offset: Offset(3.0, 3.0),
                                ),
                              ],
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ))));
  }
}
