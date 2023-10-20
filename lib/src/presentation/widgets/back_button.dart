import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final void Function() onPressed;

  const BackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 5,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
