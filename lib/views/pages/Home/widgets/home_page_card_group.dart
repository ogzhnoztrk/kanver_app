// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kanver_app/views/pages/Home/widgets/home_page_card.dart';

// ignore: must_be_immutable
class HomePageCardsGroup extends StatelessWidget {
  Color color;
  IconData icon;
  String title;
  BuildContext context;
  Widget route;
  Color color2;
  IconData icon2;
  String title2;
  Widget route2;
  Animation<double> animation;
  Animation<double> animation2;
  HomePageCardsGroup({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.context,
    required this.route,
    required this.color2,
    required this.icon2,
    required this.title2,
    required this.route2,
    required this.animation,
    required this.animation2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: w / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomePageCard(
            color: color,
            icon: icon,
            title: title,
            route: route,
            animation: animation,
            animation2: animation2,
          ),
          HomePageCard(
            color: color2,
            icon: icon2,
            title: title2,
            route: route2,
            animation: animation,
            animation2: animation2,
          ),
        ],
      ),
    );
  }
}
