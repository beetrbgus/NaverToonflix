class WebToonAppModel {
  final int id;
  final String title;
  final String author;
  final String thumb;
  final double rating;

  WebToonAppModel.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        title = json['title'].toString(),
        author = json['author'].toString(),
        thumb = json['thumb'].toString(),
        rating = double.parse(json['rating']);
}
