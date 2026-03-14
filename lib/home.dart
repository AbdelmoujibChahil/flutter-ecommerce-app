import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SafeArea(
        child: Container(
        padding: EdgeInsets.all(20),
child: 
Column(
  children: [
    Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
  
              children: [
            const Text("Home",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),), 
       
         CircleAvatar(
     radius: 50,
     backgroundColor: Colors.blue,
     backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/12345678?v=4"),
         ),
           
          ],
        ),
        SizedBox(height: 30)
        ,
     Form(child: 
              TextFormField(  
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "Search",border: OutlineInputBorder()),
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter a search term";
                  }}),
            )
  ],
)     )
     )
    );
  }
}