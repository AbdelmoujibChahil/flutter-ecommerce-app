
  import 'package:flutter/material.dart';
import 'package:project/app/pages/main/home/home.dart';

class DrawerComponent extends StatelessWidget {

  
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
       child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
      child:  SafeArea(child:  ListView(children:[
   Container(
   decoration: BoxDecoration(color: Colors.blueGrey),
   padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
    child:Column(children: [
      CircleAvatar(    
              radius: 50,
              backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/12345678?v=4"),
            ) ,
      SizedBox(height: 10),
      Text("Ahemd Amrani", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    ]
      
    )  
   )
         ,
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).push( MaterialPageRoute(builder: (context) => HomePage()));
            })
          ,
      ] )
        )  
       )  
      
    );
  }
}