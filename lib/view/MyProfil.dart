import 'package:flutter/material.dart';

class MyProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("About"),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: new EdgeInsets.all(20.0),),
              Text("About", style: TextStyle(fontSize: 25.0)),
              Text("Versi 1.0"),
              Padding(padding: new EdgeInsets.all(20.0),),
              Text("Ayu Sari", style: TextStyle(fontSize: 18.0),),

            ],
          ),
        ),
      ),
    );
  }
}