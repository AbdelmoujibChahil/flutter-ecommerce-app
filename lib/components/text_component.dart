
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
final String txt;
final double? sizeFont;
final Color color;
final FontWeight fw;
final TextAlign? align;
final String family;
   const  TextComponent({super.key, required this.txt, this.sizeFont,
      this.color = Colors.black, this.fw = FontWeight.normal, this.align, this.family="Regular"});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
    textAlign: align
    ,style: TextStyle(
      fontFamily: family,
      color: color,
      fontSize: sizeFont,
      fontWeight: fw,
      ),);
  }
}