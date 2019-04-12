import 'package:flutter/material.dart';
import 'package:gng/view/MyBerita.dart' as berita;
import 'package:gng/view/MyGunung.dart' as gunung;
import 'package:gng/view/MyProfil.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Ensiklopedia Gunung Indonesia"),
        actions: <Widget>[
          GestureDetector(
             onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new MyProfil())),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.person_pin,
              ),
            ),
          )
        ],
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new berita.MyBerita(),
          new gunung.MyGunung(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.notifications_none),
              text: "Berita",
            ),
            new Tab(
              icon: new Icon(Icons.filter_hdr),
              text: "Gunung",
            ),
          ],
        ),
      ),
    );
  }
}
