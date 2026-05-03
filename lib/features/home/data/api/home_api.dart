import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/data/model/news_model_dto.dart';

class HomeApi {
  Future<ResultApi<NewsModelDto>> getNews() async {
    try {
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        "q": "bitcoin",
        "apiKey": "f88f304c73da400e9456a2ffd9d44a96",
      });
      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String responseBody = response.body;
        Map<String, dynamic> json = jsonDecode(responseBody);
        return SuccessApi<NewsModelDto>(NewsModelDto.fromJson(json));
      } else {
        return ErorrApi<NewsModelDto>("Erorr");
      }
    } on SocketException {
      return ErorrApi<NewsModelDto>("No Internet Connection");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
