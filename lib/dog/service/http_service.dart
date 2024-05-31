import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response> getData({required String apiUrl}) async {
    var url = Uri.parse(apiUrl);
    var header = _header();
    return await http.get(url, headers: header);
  }

  Map<String, String> _header() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}