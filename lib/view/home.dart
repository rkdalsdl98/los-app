import 'dart:io';

import 'package:flutter/material.dart';
import 'package:los_app/provider/page_provider.dart';
import 'package:provider/provider.dart';

import '../system/message.dart';
import '../widgets/pages/home_main_page.dart';
import '../widgets/pages/home_my_page.dart';
import '../widgets/pages/home_team_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  icon: Icon(Icons.person),
                  label: 'My',
                ),
              ],
              animationDuration: const Duration(milliseconds: 800),
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            body: WillPopScope(
              onWillPop: () async {
                await showDialogMessage(
                  context,
                  '앱을 완전히 종료 하시겠습니까?',
                  [
                    TextButton(
                      child: const Text('예'),
                      onPressed: () => exit(0),
                    ),
                    TextButton(
                      child: const Text('아니오'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
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
                      SingleChildScrollView(child: HomeMyPage()),
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
