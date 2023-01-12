import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String basicURL =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";
  static const String id = "id";
  static const String epicodes = "episodes";

  static Future<List<WebToonModel>> getTodaysWebToons() async {
    List<WebToonModel> webtoonInstances = [];
    final url = Uri.parse('$basicURL$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = WebToonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
