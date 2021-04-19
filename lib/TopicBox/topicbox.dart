import 'dart:ui';
import 'package:argument_app/ScreenComents/ScreenComents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicBoxScreen extends StatelessWidget {
  String image = '';
  String title = '';
  int information;

  TopicBoxScreen(this.image, this.title, this.information);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: bodyBox(),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommentsScreen())
        );
      },
    );
  }

  Widget bodyBox() {
    return Container(
      height: 150,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.8),
            //   spreadRadius: 5,
            //   blurRadius: 7,
            //   offset: Offset(0, 3), // changes position of shadow
            // ),
            BoxShadow(
              color: Colors.black54,
              offset: new Offset(7, 7),
              blurRadius: 7,
            ),
          ],
          color: Colors.lightGreen,
          image: DecorationImage(
            image: AssetImage("assets/images/" + image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(11)),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(11)),
          ),
          titleBox(),
          informationBox()
        ],
      ),
    );
  }

  Container titleBox() {
    return Container(
      //color: Colors.black12,
      height: 70,
      width: 250,
      margin: EdgeInsets.only(top: 42),
      alignment: Alignment.center,
      child: Text(
        title,
        style: GoogleFonts.roboto(
          shadows: [
            Shadow(
              blurRadius: 3.0,
              color: Colors.pink,
              offset: Offset(3.0, 3.0),
            ),
            Shadow(
              blurRadius: 15.0,
              color: Colors.black,
              offset: Offset(3.0, 3.0),
            ),
          ],
          fontWeight: FontWeight.w800,
          fontSize: 55,
          color: Colors.white,
        ),
      ),
    );
  }

  Container informationBox() {
    return Container(
      padding: EdgeInsets.all(0),
      height: 30,
      width: 85,
      margin: EdgeInsets.only(top: 110, left: 280),
      child: Opacity(
          opacity: 0.75,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.question_answer,
                    color: Colors.white,
                    size: 19,
                  )
                ],
              ),
              new Container(
                width: 6,
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    information.toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
