import 'package:flutter/material.dart';
import 'package:project/components/drawer_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LOGIN")),
      body:Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 200),
        child:   Form(
            key: _formKey,
            child: 
             Column(
               children: [
            TextFormField(
              controller: emailController,
              
              decoration: InputDecoration(labelText: "Email",border: OutlineInputBorder()),
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter your email";
                }
              },
            ),
            SizedBox(height: 20),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(labelText: "Password",border: OutlineInputBorder()),
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter your password";
                }
              },
            ),
            SizedBox(height: 20)
            ,
            MaterialButton(
              child: Text("Login"),
              color: Colors.blue,
              onPressed: ()  {
                 Map credentials = {
                  "email": emailController.text,
                  "password": passController.text
                  };

                if(_formKey.currentState!.validate()){ 
                 print("${credentials} ");
                } 
                else{
                  print("nn");
                }
              }
            )
               ],
             )  
          )


      )
         
       ,
      drawer: DrawerComponent()
      );
  }
}
