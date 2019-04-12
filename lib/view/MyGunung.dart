import 'package:flutter/material.dart';
import 'package:gng/services/Gunung.dart';
import 'package:gng/services/Connect.dart';
import 'package:gng/view/WebView.dart';

class MyGunung extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(

        child: FutureBuilder(
          future: Services.getGunung(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // print(snapshot.data);
            if (snapshot.hasData) {
              String base = Connect.getBase();
              String url = base+"gunung/";
              return ListView.builder(
                
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                    leading: Image.network(base+snapshot.data[i].thumbnail, width: 80.0,),
                    title: Text(snapshot.data[i].nama,),
                    subtitle: Text(snapshot.data[i].alamat + " - Status "+snapshot.data[i].status,),
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new WebView(url: url+snapshot.data[i].id.toString(), judul: snapshot.data[i].nama,))),
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
