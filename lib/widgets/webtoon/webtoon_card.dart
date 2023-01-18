import 'package:flutter/material.dart';
import 'package:toonflix/models/app_model.dart';
import 'package:toonflix/widgets/webtoon/detail.dart';

class WebToonCard extends StatelessWidget {
  // final WebToonModel webtoon;
  final WebToonAppModel webtoon;
  const WebToonCard({
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
      child: Column(
        children: [
          // 같은 tag의 widget을 연결해 줌
          Hero(
            tag: webtoon.id,
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
              child: Image.network(webtoon.thumb),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
