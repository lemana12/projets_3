import 'package:flutter/material.dart';
import 'choicesScreen/choices.dart';
import 'database.dart';
import 'firstScreen/firstscreen.dart';
import 'home/home.dart';

void main() async {
  await   intializeDatabase();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "test",
      routes: {
        'test' : (context) => Test(),
        "home": (context) => Home(),
        "firstScreen": (context) => FirstScreen(),
        "choices": (context) => Choices(),
      },
    );
  }
}

/*
* */


class Test extends StatefulWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    
      
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: TextButton(child: Text("click"), onPressed: () async {
              String s = await  getIdComp('mattel');
              print(s);
            },),
          ),
          
        );
      
  }
}