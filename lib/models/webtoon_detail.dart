class WebToonDetailInfo {
  final String title;
  final String about;
  final String genre;
  final String age;
  final String thumb;

  WebToonDetailInfo(this.title, this.about, this.genre, this.age, this.thumb);

  WebToonDetailInfo.fromJson(Map<String, dynamic> webtoonInfo)
      : title = webtoonInfo["title"],
        about = webtoonInfo["about"],
        genre = webtoonInfo["genre"],
        age = webtoonInfo["age"],
        thumb = webtoonInfo["thumb"];
}
