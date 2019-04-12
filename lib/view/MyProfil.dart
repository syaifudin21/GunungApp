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
              Text("Nama", style: TextStyle(fontSize: 16.0),),
              Text("Ayu Puspita Sari", style: TextStyle(fontSize: 22.0, ),),
              Padding(padding: new EdgeInsets.all(20.0),),
              Text("Kelas", style: TextStyle(fontSize: 16.0),),
              Text("2TIA", style: TextStyle(fontSize: 18.0),),
              Padding(padding: new EdgeInsets.all(20.0),),
              Text("Alamat", style: TextStyle(fontSize: 16.0),),
              Text("Jln Berbek 1aF/12 Waru Sidoarjo ", style: TextStyle(fontSize: 18.0),),
              Padding(padding: new EdgeInsets.all(20.0),),
              Text("Jurusan", style: TextStyle(fontSize: 16.0),),
              Text("Teknik Informatika", style: TextStyle(fontSize: 18.0),),
              Padding(padding: new EdgeInsets.all(50.0),),
              Text("Akademi Komunitas negeri Lamongan", style: TextStyle(fontSize: 18.0),),
              Text("Angkatan 2019", style: TextStyle(fontSize: 18.0),),

            ],
          ),
        ),
      ),
    );
  }
}