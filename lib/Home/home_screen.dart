import 'dart:ui';

import 'package:argument_app/TopicBox/topicbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:argument_app/ScreenComents/cards_page.dart';

class HomeScreenState extends StatefulWidget {
  @override
  _HomeScreenStateState createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,

            leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                  });
                }),
            //expandedHeight: 100,
            bottom: PreferredSize(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                height: 7.0,
              ),
              preferredSize: Size.fromHeight(50),
            ),

            elevation: 0,
            //forceElevated: true,
            flexibleSpace: FlexibleSpaceBar(
              title: new Text(
                "Argument",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    color: Colors.pink,
                    fontWeight: FontWeight.w500,
                    fontSize: 28),
              ),
              centerTitle: true,
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.fitness_center,
                  ),
                  onPressed: null)
            ],
          ),
          body: CardsPage(),

          //Container(
          //     child: ListView.builder(
          //   padding: EdgeInsets.only(bottom: 15),
          //   itemCount: Topics.length,
          //   itemBuilder: (context, index) {
          //     return TopicBoxScreen(Topics[index].image, Topics[index].title,
          //         Topics[index].information.toInt());
          //   },
          // )),
        ),
        Visibility(
            visible: _visible,
            child: AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              // The green box must be a child of the AnimatedOpacity widget.
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.3)),
                  padding: EdgeInsets.all(25),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            hoverColor: Colors.pink,
                            icon: Icon(
                              Icons.close,
                              color: Colors.black54,
                              size: 30,
                            ),
                            onPressed: () => {
                                  setState(() {
                                    _visible = !_visible;
                                  })
                                })),
                    Text("data"),
                    Text("dsssssssa")
                  ]),
                ),
              ),
            ))
      ],
    );
  }
}
