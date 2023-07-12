import 'package:flutter/material.dart';
import 'package:los_app/widgets/rank/ranking.dart';

import '../global/long_horizontal_button.dart';
import '../lately_game_details_item.dart';
import '../rank/rising_rank_team.dart';
import '../team_information_box.dart';
import '../weather/weather.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        SliverToBoxAdapter(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                const Weather(),
                Row(
                  mainAxisAlignment: MediaQuery.of(context).size.width > 500
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  children: const [
                    Ranking(),
                    RisingRankTeam(),
                  ],
                ),
                LongHorizontalButton(
                  text: '게시판으로 이동하기',
                  onPressEvent: () => Navigator.pushNamed(context, '/posts'),
                ),
              ],
            ),
          ),
        ),
      ],
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
            Row(
              children: [
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
                const SizedBox(width: 5)
              ],
            ),
          ],
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
