import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

import 'AnimationGradient.dart';
import 'package:flutter/material.dart';
import 'ContainerTopic.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedBackground(),
          Scaffold(
            appBar: appBar(),
            body: ListQuestions(),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
    );

    /* Container(
      color: Colors.cyan,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.pink, Colors.pinkAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: ListQuestions(),*/
    //);
  }

  Widget appBar() {
    return AppBar(
      actions: <Widget>[],
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => {
                Navigator.of(context).pop(false),
              }),
      title: Text(
        "Esportes",
        style: GoogleFonts.roboto(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget ListQuestions() {
    return ListWheelScrollView(
      itemExtent: 210,
      useMagnifier: false,
      children: items,
      squeeze: 1.2,
    );
  }
}

List<Widget> items = [
  ContainerTopic("Coisas possiveis para argumentar", "Sophie Turner", true),
  ContainerTopic("Coisas possiveis para argumentar", "Sophie Turner", false),
  ContainerTopic("Coisas possiveis para argumentar", "Sophie Turner", false),
];
