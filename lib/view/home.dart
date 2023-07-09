import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../system/message.dart';
import '../widgets/global/long_button_width.dart';
import '../widgets/lately_game_details_item.dart';
import '../widgets/rank/ranking.dart';
import '../widgets/rank/rising_rank_team.dart';
import '../widgets/team_information_box.dart';
import '../widgets/weather/weather.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  Future<void> initialize(UserProvider userProvider) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userProvider.user!.uid)
        .get()
        .then((value) => userProvider.linkUserData(value));
  }

  @override
  void initState() {
    super.initState();
    final userProvider = context.read<UserProvider>();

    if (userProvider.user != null) {
      try {
        initialize(userProvider);
      } catch (e) {
        snackBarErrorMessage(context, "유저 정보를 불러오는데 실패했습니다", e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        height: 64,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        backgroundColor: const Color(0xFFf8fdff),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: InkWell(
                onTap: () => print(MediaQuery.of(context).size.width),
                child: const Icon(Icons.people_alt_rounded)),
            label: 'Team',
          ),
          const NavigationDestination(
            icon: Icon(Icons.message_rounded),
            label: 'Message',
          ),
        ],
        animationDuration: const Duration(milliseconds: 800),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(const Size.fromWidth(500)),
          child: CustomScrollView(
            slivers: [
              const HomeAppBar(),
              SliverToBoxAdapter(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      const Weather(),
                      Row(
                        mainAxisAlignment:
                            MediaQuery.of(context).size.width > 500
                                ? MainAxisAlignment.spaceAround
                                : MainAxisAlignment.spaceEvenly,
                        children: const [
                          Ranking(),
                          RisingRankTeam(),
                        ],
                      ),
                      LongButtonWidth(
                        text: '게시판으로 이동하기',
                        onPressEvent: () =>
                            Navigator.pushNamed(context, '/posts'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Stack(
          children: [
            Positioned(
              left: 25,
              top: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(.5),
              ),
            ),
          ],
        ),
        // 알림버튼
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: Theme.of(context)
                .colorScheme
                .onPrimaryContainer
                .withOpacity(.5),
          ),
        ),
      ],
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/img/los_background_translate.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(30),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Image.asset(
                        'assets/img/basketball_mark.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UserName 님 환영합니다!',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 14,
                            fontFamily: 'SpoqaHanSans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '팀의 남은 경기 횟수는 1 회 입니다.',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 14,
                            fontFamily: 'SpoqaHanSans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    TeamInformationBox(),
                    Spacer(),
                    LatelyGameDetails(
                      detailCount: 5,
                    ),
                    Spacer(),
                  ],
                ),
                if (MediaQuery.of(context).size.width > 500)
                  const SizedBox(
                    height: 60,
                  ),
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(45),
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 48,
              height: 5,
              decoration: const BoxDecoration(
                color: Color(0xFFD9DDEB),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ),
      expandedHeight: 400,
      toolbarHeight: 48,
      floating: true,
      pinned: false,
    );
  }
}
