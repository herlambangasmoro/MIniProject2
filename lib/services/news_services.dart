import 'dart:convert';
import 'package:http/http.dart';
import 'package:miniproject2/models/news_model.dart';

class NewsServices {
  Future<List<NewsOrgModel>> getNews() async {
    String baseUrl ="https://newsapi.org/v2/everything";

  Map<String, String> queryParams = {
'qInTitle': 'Premier League',
'from': '2024-02-04',
'to': '2024-02-14',
'sortBy': 'popularity',
'language': 'en',
'apiKey': '6e8e6f35b2234660b757abb988ee4f2b',
};

String queryString = Uri(queryParameters: queryParams).query;

String apiUrl = '$baseUrl?$queryString';

Response response =  await get(Uri.parse(apiUrl));
if (response.statusCode == 200) {
  final List result = jsonDecode(response.body) ['articles'];
  print(result);
  return result.map((e) => NewsOrgModel.fromJson(e)).toList();
} else {
throw Exception(response.reasonPhrase);
    }
  }
}