import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebToonModel> webtoonList = [];
  bool isLoading = true;
  // initState를 이용해 API를 fetching한다면
  // 실수하거나, 반복이 많아질 수 있음.
  @override
  void initState() {
    super.initState();
    waitForWebToons();
    setState(() {});
  }

  void waitForWebToons() async {
    webtoonList = await ApiService.getTodaysWebToons();
    isLoading = false;
    for (var element in webtoonList) {
      print(element.title);
    }
  }

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
    );
  }
}
