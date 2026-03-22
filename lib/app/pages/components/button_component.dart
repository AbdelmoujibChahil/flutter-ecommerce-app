import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  final String txt;
  final Color bgColor;
  final VoidCallback onPressed;
    final double width;
   Color textColor;
   double padding ;

   ButtonComponent({
    super.key,
    required this.txt,
    required this.bgColor,
    required this.onPressed,
     this.width=0.9 ,
    this.textColor =  Colors.white,
    this.padding =15,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding:  EdgeInsets.symmetric(vertical: padding),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
           side: const BorderSide(
             color:  Color(0xFF444fc0),
             width: 2,
  ),
          ),
      
        ),
        onPressed: onPressed,
        child: Text(
          txt,
          style: TextStyle(
            color:textColor,
           fontSize: 15,
           fontFamily: "Regular"
           ),
        ),
      ),
    );
  }
}