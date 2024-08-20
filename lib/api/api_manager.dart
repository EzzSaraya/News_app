import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newss_app/Model/SourceResponse.dart';
import 'package:newss_app/api/api_constants.dart';
class ApiManager{
static Future<SourceResponse?> getsources() async {
  Uri url =  Uri.https(ApiConstants.basicurl, ApiConstants.sourcesapi, {
    'apiKey': ApiConstants.apiKey
  }
  );
  try {
    var response = await http.get(url);
    var responsebody = response.body;
    var json = jsonDecode(responsebody);
    return SourceResponse.fromJson(json);
  }
catch(e){
    throw e;
}
}
}