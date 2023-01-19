import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/app_model.dart';
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String basicURL =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";
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

  static Future<WebToonDetailInfo> getDetailWebToonInfo(int id) async {
    final url = Uri.parse('$basicURL$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoonInfo = jsonDecode(response.body);
      return WebToonDetailInfo.fromJson(webtoonInfo);
    }
    throw Error();
  }

  static Future<List<WebToonEpisode>> getEpisodesById(int id) async {
    List<WebToonEpisode> episodeInstances = [];
    final url = Uri.parse('$basicURL$id/$epicodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);

      for (var episode in episodes) {
        episodeInstances.add(WebToonEpisode.fromJson(episode));
      }
      return episodeInstances;
    }
    throw Error();
  }

  static Future<List<WebToonAppModel>> getdailyWebtoons() async {
    List<WebToonAppModel> items = [];
    final String response =
        await rootBundle.loadString('data/daily_plus_webtoon.json');
    final List<dynamic> data = await jsonDecode(response);
    for (var webtoon in data) {
      WebToonAppModel webtoon2 = WebToonAppModel.fromJson(webtoon);
      items.add(webtoon2);
    }
    return items;
  }

  static Future<List<WebToonAppModel>> getNewWebtoons() async {
    List<WebToonAppModel> items = [];
    final String response =
        await rootBundle.loadString('data/new_webtoon.json');

    final List<dynamic> data = await jsonDecode(response);

    for (var webtoon in data) {
      items.add(WebToonAppModel.fromJson(webtoon));
    }
    return items;
  }
}
