import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final WebToonModel webtoon;
  const DetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebToonDetailInfo> webtoonDetail;
  late Future<List<WebToonEpisode>> episode;

  @override
  void initState() {
    super.initState();
    webtoonDetail = ApiService.getDetailWebToonInfo(widget.webtoon.id);
    episode = ApiService.getEpisodesById(widget.webtoon.id);
  }

  @override
  Widget build(BuildContext context) {
    // webtoon list에서 이동되기 때문에 Scaffold
    print(widget.webtoon.id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green.shade300,
        centerTitle: true,
        title: Text(
          widget.webtoon.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.webtoon.id,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 7),
                            color: Colors.black.withOpacity(0.8),
                          )
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      width: 250,
                      child: Image.network(widget.webtoon.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              FutureBuilder(
                future: webtoonDetail,
                builder: (context, detailResult) {
                  if (detailResult.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailResult.data!.about,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${detailResult.data!.genre} / ${detailResult.data!.age}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: episode,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.webtoon.id,
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
