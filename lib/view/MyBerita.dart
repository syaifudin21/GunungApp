import 'package:flutter/material.dart';
import 'package:gng/services/Berita.dart';
import 'package:gng/services/Connect.dart';
import 'package:gng/view/WebView.dart';

class MyBerita extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(

        child: FutureBuilder(
          future: Services.getBerita(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // print(snapshot.data);
            if (snapshot.hasData) {
              String base = Connect.getBase();
              String url = base+"v1/berita/";
              return ListView.builder(
                
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                    leading: Image.network(base+snapshot.data[i].lampiran, width: 80.0,),
                    title: Text(snapshot.data[i].judul, style: TextStyle(fontSize: 20.0),),
                    subtitle: Text(snapshot.data[i].text_pembuka, style: TextStyle(fontSize: 18.0),),
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new WebView(url: url+snapshot.data[i].id.toString(), judul: snapshot.data[i].judul,))),
                  );
                },
              );
            } else {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
              
            }
          },
        ),
      );
  }
}
