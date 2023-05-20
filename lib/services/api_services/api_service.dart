import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService
{
  Future<dynamic>fetchData(String Url)async{
    var url = Uri.parse(Url);
    var response = await http.get(url);
    return response;
    //print(jsonDecode(response.body));
   // return jsonDecode(response.body);
  }
}