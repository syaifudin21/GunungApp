import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gng/model/Gunung.dart';
import 'package:gng/services/Connect.dart';
import 'package:gng/view/WebView.dart';
import 'package:http/http.dart' as http;

class SearchGunung extends StatefulWidget {
  @override
  _SearchGunungState createState() => _SearchGunungState();
}

class _SearchGunungState extends State<SearchGunung> {
  List<Gunung> _notes = List<Gunung>();
  List<Gunung> _notesForDisplay = List<Gunung>();

  Future<List<Gunung>> fetchNotes() async {
    String base = Connect.getBase();
    var url = base+"v1/gunung/";
    var response = await http.get(url);
    
    var notes = List<Gunung>();
    
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Gunung.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index-1);
        },
        itemCount: _notesForDisplay.length+1,
      )
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 8.0, right: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.nama.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    String base = Connect.getBase();
    String url = base+"gunung/";

    return ListTile(
      leading: Image.network(base+_notesForDisplay[index].thumbnail, width: 80.0,),
      title: Text(_notesForDisplay[index].nama),
      subtitle: Text(_notesForDisplay[index].alamat + " - Status "+_notesForDisplay[index].status,),
       onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new WebViewFlutter(url: url+_notesForDisplay[index].id.toString(), judul: _notesForDisplay[index].nama,))),
    );
  }
}