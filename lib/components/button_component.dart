import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  final String route;
  final String txt;

  const ButtonComponent({
    super.key,
    required this.route,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Text(
          txt,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}