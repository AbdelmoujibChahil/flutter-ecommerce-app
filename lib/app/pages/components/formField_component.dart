import 'package:flutter/material.dart';

class FormfieldComponent extends StatelessWidget {
  final String? label;
  final TextInputType typeInput;
  final bool hide;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
     final Icon ? prefixIcon ;
      final InputBorder border ;

  // AJOUT
  final Widget? suffixIcon;

  const FormfieldComponent({
    super.key,
     this.label,
    this.hide = false,
    this.typeInput = TextInputType.emailAddress,
    this.controller,
    this.validator,
    this.hintText = "",
    this.suffixIcon, // AJOUT
    this.prefixIcon,
    this.border =const  OutlineInputBorder()
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      /*  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "Search",border: OutlineInputBorder()),
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter a search term";
                  }}),*/
      controller: controller,
      keyboardType: typeInput,
      obscureText: hide,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey,fontFamily: "bold",fontSize: 20),
        labelText: label,
        border: InputBorder.none,
        prefixIcon: prefixIcon,

        //  utiliser suffixIcon dynamique
        suffixIcon: suffixIcon,
      ),
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return "Please enter your $label";
            }
            return null;
          },
    );
  }
}