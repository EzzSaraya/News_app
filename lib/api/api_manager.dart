import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newss_app/Model/NewsResponse.dart';
import 'package:newss_app/Model/SourceResponse.dart';
import 'package:newss_app/api/api_constants.dart';
class ApiManager{
static Future<SourceResponse?> getsources(String categoryId) async {
  print("Fetching sources for categoryId: $categoryId");
  Uri url =  Uri.https(ApiConstants.basicurl, ApiConstants.sourcesapi, {
    'apiKey': ApiConstants.apiKey,
     'category': categoryId

  }
  );
  try {
    var response = await http.get(url);
    var responsebody = response.body;
    var json = jsonDecode(responsebody);
    return SourceResponse.fromJson(json);


  }
catch(e){
  print("Error: $e");
    throw e;
}
}
static Future<NewsResponse?> getNewsbySourceID(String SourceId) async{
  Uri url = Uri.https(ApiConstants.basicurl,ApiConstants.newsapi, {
    'apiKey': ApiConstants.apiKey,
    'sources': SourceId
  });
  var response = await http.get(url);

try {
  return NewsResponse.fromJson(jsonDecode(response.body));

}
catch(e){
  throw e;
}

}
static Future<NewsResponse?> SearchNews(String query) async{
  Uri url = Uri.https(ApiConstants.basicurl,ApiConstants.newsapi, {
    'apiKey': ApiConstants.apiKey,
    'q':query
  });
  var response = await http.get(url);

  try {
    return NewsResponse.fromJson(jsonDecode(response.body));

  }
  catch(e){
    throw e;
  }


}
}