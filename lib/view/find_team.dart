import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';

import '../widgets/team/find_team_list_item.dart';
import '../widgets/team/find_team_search_box.dart';

class FindTeam extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  FindTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  size: 24,
                ),
              ),
            ),
            FIndTeamSearchBox(controller: controller),
            teamCategoryHelper(context),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FindTeamListItem(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}

Widget teamCategoryHelper(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20, bottom: 5),
    width: double.maxFinite,
    height: 30,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 1,
          spreadRadius: 1,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '팀명',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 8 * getScaleFactorFromWidth(context),
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 60 * getScaleFactorFromWidth(context)),
        Text(
          '친절도',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 8 * getScaleFactorFromWidth(context),
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 60 * getScaleFactorFromWidth(context)),
        Text(
          '랭크',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 8 * getScaleFactorFromWidth(context),
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 60 * getScaleFactorFromWidth(context)),
        Text(
          '인원수',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 8 * getScaleFactorFromWidth(context),
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
