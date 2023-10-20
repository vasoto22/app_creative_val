import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final Map<String, dynamic> pokemonDetail;
  final double width;
  final double height;

  const InfoSection(
      {required this.pokemonDetail, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.18,
      right: -30,
      child: Image.asset(
        '../../../../assets/images/pokeball.png',
        height: 200,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
