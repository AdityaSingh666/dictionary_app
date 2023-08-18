import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio();

  Future<dynamic> getData({required String query}) async {
    String URL = "https://api.dictionaryapi.dev/api/v2/entries/en/$query";
    try {
      var response = await dio.get(URL);
      print("This is the response from the api ${response.data[0]['meanings'][0]['definitions'][0]['definition']}");
      return response.data[0]['meanings'][0]['definitions'][0]['definition'];
    } catch (error) {
      print("Somthing is wrong$error");
    }
  }
}
