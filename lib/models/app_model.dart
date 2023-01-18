class WebToonAppModel {
  final int id;
  final String title;
  final String author;
  final String thumb;
  final double rating;

  WebToonAppModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'].toString(),
        author = json['author'].toString(),
        thumb = json['thumb'].toString(),
        rating = json['rating'] as double;
}
