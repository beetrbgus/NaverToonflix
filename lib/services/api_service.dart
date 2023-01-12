import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String basicURL = "https://webtoon-crawler.nomadcoders.workers.dev/";
  final String today = "today";
  final String id = "id";
  final String epicodes = "episodes";

  Future<List<WebToonModel>> getTodaysWebToons() async {
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
