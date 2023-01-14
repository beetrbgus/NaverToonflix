import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';

class WebToonCard extends StatelessWidget {
  final WebToonModel webtoon;
  const WebToonCard({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        const SizedBox(height: 10),
        Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
