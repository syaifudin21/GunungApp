import 'package:flutter/material.dart';
import 'package:gng/view/MyBerita.dart' as berita;
import 'package:gng/view/MyGunung.dart' as gunung;
import 'package:gng/view/MyProfil.dart';
import 'package:gng/view/Search.dart';

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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => new SearchGunung())),
      ),
      appBar: new AppBar(
        title: Text("Ensiklopedia Gunung Indonesia"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle), onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => new MyProfil() )),
          )          
        ],
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Berita",
            ),
            new Tab(
              text: "Gunung",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new berita.MyBerita(),
          new gunung.MyGunung(),
        ],
      ),
      // bottomNavigationBar: new Material(
      //   color: Colors.teal[900],
      //   child: new TabBar(
      //     controller: controller,
      //     tabs: <Widget>[
      //       new Tab(
      //         icon: new Icon(Icons.notifications_none),
      //         // text: "Berita",
      //       ),
      //       new Tab(
      //         icon: new Icon(Icons.filter_hdr),
      //         // text: "Gunung",
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
