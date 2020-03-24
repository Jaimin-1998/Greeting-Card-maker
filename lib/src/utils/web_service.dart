import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({this.url,this.parse});
}

class Webservice {

  Future<T> load<T>(Resource<T> resource,String url) async {

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }


  }

  static Future<Map<String, dynamic>> commonPostHttpMethod(String url, body) async {
    print('url');
    print(url);
    http.Response response = await http.post(
      url,
      headers: await {
        "Content-Type":"application/json",
        "Authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRpcGFrLnNhdmFsaXlhQGNvbmF1Zy5jb20iLCJpZCI6MCwiaWF0IjoxNTY5OTkyMzU3fQ.m3arQ0dJHDPV0RnQmx_2JqRDBtkhGAap704V7yEFg-0",
         "cartInstance":"6jIgtcyDzB8SYNMW"
      },
      body: json.encode(body),
    );
    Map<String, dynamic> responseJson = {
      'body': json.decode(response.body),
      'headers': response.headers
    };
    return responseJson;
  }



}