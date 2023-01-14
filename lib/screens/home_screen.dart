import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebToonModel>> webtoons = ApiService.getTodaysWebToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green.shade300,
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, futureResult) {
          if (futureResult.hasData) {
            print(futureResult.data!.length);
            // ListView보다 최적화 됨.
            return makeList(futureResult);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebToonModel>> futureResult) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: futureResult.data!.length,
      itemBuilder: (context, index) {
        var webtoon = futureResult.data![index];
        print(index);

        return Text(webtoon.title);
      },
      // 구분자를 build 하는 인자
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
