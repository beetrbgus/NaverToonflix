import 'package:flutter/material.dart';
import 'package:toonflix/widgets/webtoon/detail.dart';

import '../../models/app_model.dart';

class AppWebToonCard extends StatelessWidget {
  final WebToonAppModel webtoon;
  const AppWebToonCard({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // StatelessWidget을 route로 감싸서 다른 스크린처럼 보이게 해 줌.
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(webtoon: webtoon),
              // 실행환경에 따라 다르겠지만 IOS에서는 하단에서 올라 옴.
              // chrome은 그냥 페이지 변경하는 것 같음.
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 같은 tag의 widget을 연결해 줌
            Flexible(
              flex: 7,
              child: Hero(
                tag: webtoon.id,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: 300,
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    webtoon.thumb,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  webtoon.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  webtoon.author,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
