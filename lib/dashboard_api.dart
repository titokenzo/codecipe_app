import 'dart:convert';
import 'dart:io';
import 'dart:async';

class DashboardApi{

  Future<List<Object>> getList() async {
    var url = "http://tecnologiasinternet.com.br/apac/dashboard.php";
    HttpClient client = new HttpClient();
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    Future<List<Object>> resp = response.transform(utf8.decoder).transform(json.decoder).toList();
    return resp;
  }

}