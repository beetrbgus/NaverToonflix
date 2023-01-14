class WebToonModel {
  final String title;
  final String thumb;
  final int id;

  WebToonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = int.parse(json['id']);
}
