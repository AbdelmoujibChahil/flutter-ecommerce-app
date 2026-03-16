import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  final String txt;
  final Color bgColor;
  final VoidCallback onPressed;

  const ButtonComponent({
    super.key,
    required this.txt,
    required this.bgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          txt,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}