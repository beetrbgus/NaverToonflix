import 'package:intl/intl.dart';

class WebToonEpisode {
  final String thumb;
  final String id;
  final String title;
  final double rating;
  final DateTime date;

  WebToonEpisode(this.thumb, this.id, this.title, this.rating, this.date);

  WebToonEpisode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        thumb = json['thumb'],
        title = json['title'],
        rating = double.parse(json['rating']),
        date = DateFormat('yyyy.MM.dd').parse(json['date']);
}
