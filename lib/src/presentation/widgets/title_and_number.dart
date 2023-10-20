import 'package:flutter/material.dart';

class TitleAndNumber extends StatelessWidget {
  final String name;
  final String num;

  const TitleAndNumber({required this.name, required this.num});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "#" + num,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
