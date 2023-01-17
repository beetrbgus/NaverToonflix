import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon/webtoon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final Future<List<WebToonModel>> webtoons = ApiService.getTodaysWebToons();
  late TabController _myTabs;
  double tabWidth = 0;
  @override
  void initState() {
    super.initState();

    _myTabs = TabController(
      length: 10,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    tabWidth = MediaQuery.of(context).size.width / 10;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
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
        bottom: TabBar(
          controller: _myTabs,
          tabs: homeTabbar,
          labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          labelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          // 선택된 라벨의 색상
          labelColor: Colors.green.shade400,
          // 선택된 것(지시자)의 point?
          indicatorColor: Colors.green.shade300,
          // 선택되지 않은 라벨의 색상
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: TabBarView(
        controller: _myTabs,
        children: tabBarView,
      ),
    );
  }

  List<Widget> get homeTabbar {
    return <Widget>[
      const Tab(
        text: '신작',
      ),
      const Tab(
        text: '매일+',
      ),
      const Tab(
        text: '월',
      ),
      const Tab(
        text: '화',
      ),
      const Tab(
        text: '수',
      ),
      const Tab(
        text: '목',
      ),
      const Tab(
        text: '금',
      ),
      const Tab(
        text: '토',
      ),
      const Tab(
        text: '일',
      ),
      const Tab(
        text: '완결',
      ),
    ];
  }

  List<Widget> get tabBarView {
    List<Widget> arr = [];
    for (var i = 0; i < 10; i++) {
      arr.add(
        FutureBuilder(
          future: webtoons,
          builder: (context, futureResult) {
            if (futureResult.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: makeList(futureResult),
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
      );
    }
    return arr;
  }

  ListView makeList(AsyncSnapshot<List<WebToonModel>> futureResult) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: futureResult.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = futureResult.data![index];
        return WebToonCard(webtoon: webtoon);
      },
      // 구분자를 build 하는 인자
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
