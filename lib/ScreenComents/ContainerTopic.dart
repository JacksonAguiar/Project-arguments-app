import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerTopic extends StatelessWidget {
  String title = '';
  String name;
  bool premium;
  ContainerTopic(this.title, this.name, this.premium);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {

      },

      
      child: Container(
      height: 150,
      margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(3)),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(3)),
          ),
          nameBox(),
          textBox(),
          photo(),
          informationBox()
        ],
      ),
    ));
  }

  Container nameBox() {
    return Container(
      padding: EdgeInsets.only(left: 5),
      height: 27,
      width: 375,
      decoration: BoxDecoration(
          boxShadow: [],
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(3)),
      child: Opacity(
          opacity: 0.75,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 17,
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
                    name,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Container textBox() {
    return Container(
      //color: Colors.black12,
      height: 90,
      width: 300,
      margin: EdgeInsets.only(top: 30, left: 85),
      alignment: Alignment.centerLeft,

      child: Text(
        title,
        style: GoogleFonts.roboto(
          shadows: [
            Shadow(
              blurRadius: 20.0,
              color: Colors.black,
              offset: Offset(3.0, 3.0),
            ),
          ],
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }

  Container photo() {
    return Container(
      //color: Colors.black12,
      height: 63,
      width: 63,

      margin: EdgeInsets.only(top: 43, left: 9),
      padding: EdgeInsets.only(left: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://a-static.besthdwallpaper.com/muito-simples-atriz-sophie-turner-papel-de-parede-1080x1920-52179_165.jpg"),
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 6,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
          color: Colors.blue,
          borderRadius: BorderRadius.circular(60)),
    );
  }

  Container informationBox() {
    return Container(
      padding: EdgeInsets.all(0),
      height: 26,
      width: 375,
      margin: EdgeInsets.only(top: 124),
      decoration: BoxDecoration(
          boxShadow: [],
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(3)),
      child: Opacity(
          opacity: 0.75,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 17,
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
                    "Participações: 47",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
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
