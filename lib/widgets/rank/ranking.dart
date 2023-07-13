import 'package:flutter/material.dart';
import 'package:los_app/widgets/rank/rank_item.dart';

import '../../design/dimensions.dart';
import '../global/category_text.dart';

class Ranking extends StatelessWidget {
  const Ranking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 145,
        maxHeight: 155,
        minWidth: 150 * getScaleFactorFromWidth(context),
        maxWidth: 160 * getScaleFactorFromWidth(context),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryText(category: '랭킹'),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return const RankItem();
              },
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
