
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
final String txt;
final double? sizeFont;
final Color color;
final FontWeight fw;
final TextAlign? align;

     TextComponent({super.key, required this.txt, this.sizeFont,
      this.color = Colors.black, this.fw = FontWeight.normal, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
    textAlign: align
    ,style: TextStyle(
      color: color,
      fontSize: sizeFont,
      fontWeight: fw,
      ),);
  }
}