import 'dart:convert';
import 'package:gng/services/Connect.dart';
import 'package:http/http.dart' as http;
import 'package:gng/model/Gunung.dart';

class Services{
  static const String url = "v1/gunung";

  static Future<List<Gunung>> getGunung() async{
    String base = Connect.getBase();
    try{
      final response = await http.get(base+url);
      if (response.statusCode == 200) {
        List<Gunung> list = parsePhotos(response.body);
        return list;
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static List<Gunung> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Gunung>((json)=> Gunung.fromJson(json)).toList();
  }
}
