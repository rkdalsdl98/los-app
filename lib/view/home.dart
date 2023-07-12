import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:los_app/provider/page_provider.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:los_app/widgets/pages/home_setting_page.dart';
import 'package:los_app/widgets/pages/home_team_page.dart';
import 'package:provider/provider.dart';

import '../system/message.dart';
import '../widgets/pages/home_main_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return ChangeNotifierProvider<PageProvider>(
      create: (_) => PageProvider(0),
      child: Consumer<PageProvider>(
        builder: (_, provider, __) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              selectedIndex: provider.selectedPage,
              height: 64,
              onDestinationSelected: (value) => setState(() {
                provider.selectedPage = value;
              }),
              backgroundColor: const Color(0xFFf8fdff),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_alt_rounded),
                  label: 'Team',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              animationDuration: const Duration(milliseconds: 800),
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            body: WillPopScope(
              onWillPop: () async {
                await onWillPopScopeMessage(context);
                return false;
              },
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size.fromWidth(500)),
                  child: IndexedStack(
                    index: provider.selectedPage,
                    children: const [
                      HomeMainPage(),
                      HomeTeamPage(),
                      HomeSettingPage(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
