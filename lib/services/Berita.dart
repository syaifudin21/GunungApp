import 'dart:convert';
import 'package:gng/services/Connect.dart';
import 'package:http/http.dart' as http;
import 'package:gng/model/Berita.dart';

class Services{
  static const String url = "v1/berita";

  static Future<List<Berita>> getBerita() async{
    String base = Connect.getBase();
    try{
      final response = await http.get(base+url);
      if (response.statusCode == 200) {
        List<Berita> list = parsePhotos(response.body);
        return list;
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static List<Berita> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Berita>((json)=> Berita.fromJson(json)).toList();
  }
}
