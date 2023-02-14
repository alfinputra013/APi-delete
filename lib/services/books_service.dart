import 'dart:convert';

import 'package:crud_api/global.dart';
import 'package:crud_api/models/buku_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future getListBook() async {
    try {
      var response = await http.get(Uri.parse("${Global.BASE_API_URL}/books"));
      print("Response ${response.statusCode}");
      print("response ${response.body}");
      var data = jsonDecode(response.body);
      print("response ${data}");
      return BukuModel.fromJson(data);
    } catch (e) {
      print("error get list $e");
      return null;
    }
  }

  deleteBook(int id) async {
    try {
      var response =
          await http.delete(Uri.parse("${Global.BASE_API_URL}/delete/$id"));
      print("response${response.statusCode}");
      print("response ${response.body}");
      var data = jsonDecode(response.body);
      print("response ${data}");
      return data;
    } catch (e) {
      print("error delete $e");
      return null;
    }
  }

  Future createBook(Data data) async {
    try {
      var response =
          await http.post(Uri.parse("${Global.BASE_API_URL}/create"));
      print("Response ${response.statusCode}");
      print("response ${response.body}");
      var data = jsonDecode(response.body);
      print("response ${data}");
      return data;
    } catch (e) {
      print("error create book $e");
      return null;
    }
  }

  void editBook(Data data) {}
}

Future editBook(Data data) async {
  try {
    var response = await http.put(Uri.parse("${Global.BASE_API_URL}/update/"));
    print("Response ${response.statusCode}");
    print("response ${response.body}");
    var data = jsonDecode(response.body);
    print("response ${data}");
    return data;
  } catch (e) {
    print("error edit book $e");
    return null;
  }
}
