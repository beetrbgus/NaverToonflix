class WebToonModel {
  final String title;
  final String thumb;
  final String id;

  WebToonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
