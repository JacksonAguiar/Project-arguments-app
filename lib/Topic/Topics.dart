import 'package:flutter/cupertino.dart';

class Topic {
  final String id;
  final String title;
  final String image;
  final double information;
  const Topic({this.id, this.title, this.image, this.information});
}

List<Topic> Topics = [
   const Topic(
    id: "1",
    title: "Ciência",
    image: "science-img.png",
    information: 25,
  ),
  const Topic(
    id: "2",
    title: "Religião",
    image: "science-img.png",
    information: 10,
 
  ),
  const Topic(
    id: "3",
    title: "Religião",
    image: "science-img.png",
    information: 1000,
 
  ),
  const Topic(
    id: "4",
    title: "Religião",
    image: "science-img.png",
    information: 1000,
 
  ),
];