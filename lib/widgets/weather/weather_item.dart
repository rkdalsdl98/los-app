import 'package:flutter/material.dart';

import '../../design/dimensions.dart';

class WeatherInfoItem extends StatelessWidget {
  const WeatherInfoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5 * getScaleFactorFromWidth(context),
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '온도:',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 6 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '최고/최저\n22°C / 25°C',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 4 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
