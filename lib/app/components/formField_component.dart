import 'package:flutter/material.dart';

class FormfieldComponent extends StatelessWidget {
final  String label;
 final TextInputType typeInput;
  final bool hide;
  
  
   const FormfieldComponent({super.key,required this.label,
   this.hide = false,
   this.typeInput=TextInputType.emailAddress});
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: typeInput,
      obscureText: hide,
              decoration: InputDecoration(labelText:label,
              border: OutlineInputBorder(),
          suffixIcon:  hide ? Icon(Icons.remove_red_eye) : null
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter your email";
                }
              },
            );
  }
}